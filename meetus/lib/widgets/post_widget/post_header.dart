import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),),
                color: Colors.blueGrey,
              ),
              height: 80,
              width: 80,
              alignment: Alignment.center,
              child: Text(
                'RG',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              width: 270,
              height: 80,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  )
                ),
              ),
              padding: EdgeInsets.only(left: 8, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Mother Patrick Pry School ododdjdn djdjdjd",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "13-04-2020 14:09",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.lens,
                        size: 5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.public,
                        size: 15,
                      ), //Icon(Icons.lock, size: 15,)
                    ],
                  ),
                  Text(
                    "Mutare",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 25,
              width: 25,
              color: Colors.blueGrey,
            ),
            Container(
              height: 55,
            )
          ],
        ),
      ],
    );
  }
}
