const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();
const db = admin.firestore();

exports.replicateMessages = functions.firestore
    .document('users/{userId}/{groups}/{groupId}/{messages}/{message}')
    .onCreate((snap, context) => {
        console.log('----------------start message replication function--------------------')

        var message = snap.data()
        const userId = context.params.userId;
        const groupId = context.params.groupId;
        const sender = message.sender
        //set time set
        // message.time = new Date().toISOString();
        if (sender.id !== userId) {
            return null;
        }

        db.collection('users').doc(userId).collection('groups').doc(groupId).collection('members').get().then((qs) => {
            qs.forEach((member) => {
                var member = member.data();
                if (member.id == userId) return;
                db.collection('users').doc(member.id).collection('groups').doc(groupId).collection('messages').add(message);
            })
        })
        return null;
    })

exports.addMembersToUserCollection = functions.firestore
    .document('groups/{groupId}/{members}/{member}')
    .onCreate(async (snap, context) => {
        console.log('----------------start add message to users collection function--------------------')
        try {
            const newMember = snap.data();
            const groupId = context.params.groupId;
            console.log(groupId);
            const groupSnap = await db.collection("groups").doc(groupId).get();
            if (!groupSnap.exists) {
                console.log("Group not found exiting gracefully........");
                return;
            }
            const groupDoc = groupSnap.data();
            const membersRef = await db.collection('groups').doc(groupId).collection('members').get();
            //creating group into user collection
            await db.collection("users").doc(newMember.id).collection("groups").doc(groupId).set(groupDoc);
            membersRef.forEach(async (querySnapshot) => {
                var member = querySnapshot.data();
                console.log(`Member with user ${member.firstName} found`);
                console.log(`Found member ${member.id}`)
                //add newly created member into group current members user group collection 
                await db.collection("users").doc(member.id).collection("groups").doc(groupId).collection('members').doc(newMember.id).set(newMember);
                if (member.id == newMember.id) return;
                await db.collection("users").doc(newMember.id).collection("groups").doc(groupId).collection('members').doc(member.id).set(member);
            })

            console.log("Execution ended successfully......")
        }
        catch (error) {
            console.log("There was an erro exection code");

            throw error

        }
        return;

    })

exports.replicatePosts = functions.firestore
    .document('posts/{postId}')
    .onCreate(async (snap, context) => {
        console.log('----------------start replicate posts among users collection function--------------------')
        try {

            const post = snap.data();
            const recipients = post.recipients;
            recipients.forEach(async (recipientId, index) => {
                console.log(recipientId);
                await db.collection("users").doc(recipientId).collection("posts").doc(context.params.postId).set(post);

            });
        }
        catch (error) {
            console.log(error)
            throw error

        }
        console.log("Execution has ended successfully");

        return;



    });

exports.replicateComments = functions.firestore
    .document("users/{userId}/{posts}/{postId}/{comments}/{comment}")
    .onCreate(async (snap, context) => {
        console.log("----------------start comments replication to users----------");
        try {

            const postSnap = await db.collection("posts").doc(context.params.postId).get();
            const comment = snap.data();
            if (!postSnap.exists) {
                console.log("Post not found exiting gracefully........");
                return;
            }
            const postDoc = postSnap.data();

            //get a list of recipients
            const recipients = postDoc.recipients;
            recipients.forEach(async (recipientId, index) => {
                if (recipientId == context.params.userId) return;
                await db.collection("users").doc(recipientId).collection("posts").doc(context.params.postId).collection("comments").doc(context.params.comment).set(comment);
            });


        }
        catch (error) {
            console.log(error);
            throw error;

        }

        console.log("-----comment replicate function finished just now--------- ");

        return;
    });

exports.sendNotification = functions.firestore
    .document('group/{groupId1}/{messages}/{message}')
    .onCreate((snap, context) => {
        console.log('----------------start push notifications function--------------------')

        const doc = snap.data()
        console.log(doc)

        const idFrom = doc.from
        console.log(`idFrom : ${idFrom.id}`);

        const idTo = doc.to
        console.log(`idTo : ${idTo.id}`);
        const contentMessage = doc.message
        console.log(`content message : ${contentMessage}`)

        // Get push token user to (receive)
        admin
            .firestore()
            .collection('group')
            .where('id', '==', idTo.id)
            .get()
            .then(querySnapshot => {
                console.log(`querysnapshot is ${querySnapshot}`);


                querySnapshot.forEach(groupTo => {
                    console.log(`Found user to: ${groupTo.data().name}`)


                    groupTo.ref.collection('members').get().then(querySnapshot1 => {

                        querySnapshot1.forEach(member => {

                            if (member.data().id != idFrom.id) {
                                // Get info user from (sent)
                                console.log(`found member : ${member.data().pushToken}`)

                                admin
                                    .firestore()
                                    .collection('users')
                                    .where('email', '==', idFrom.id)
                                    .get()
                                    .then(querySnapshot2 => {
                                        querySnapshot2.forEach(userFrom => {
                                            console.log(`Found user from: ${userFrom.data().email}`)
                                            const payload = {
                                                notification: {
                                                    title: `You have a message from "${userFrom.data().email}"`,
                                                    body: contentMessage,
                                                    badge: '1',
                                                    sound: 'default'
                                                },
                                                data: {
                                                    groupId: groupTo.data().id,
                                                }

                                            }
                                            // console.log(group);

                                            // Let push to the target device
                                            admin
                                                .messaging()
                                                .sendToDevice(member.data().pushToken, payload)
                                                .then(response => {
                                                    console.log('Successfully sent message:', response)
                                                })
                                                .catch(error => {
                                                    console.log('Error sending message:', error)
                                                })
                                        })
                                    })
                            } else {
                                console.log('Can not find pushToken target user')
                            }


                        })
                    })


                })
            })
        return null
        console.log(`Code execution ended`);

    })
