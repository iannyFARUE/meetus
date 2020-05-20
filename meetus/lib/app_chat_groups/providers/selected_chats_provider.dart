import 'package:flutter/foundation.dart';
import 'package:schoolbookapp/app_chat_groups/models/message.dart';

class SelectedChats with ChangeNotifier {
  List<Message> selectedChats = [];
  Message chatToReplyTo;
  bool replyTo = false;

  List<Message> get chats {
    return [...selectedChats];
  }

  removeUnselectedChat(String time) {
    selectedChats.removeWhere((item) => item.time.toString() == time); //using time for testing purposes
    notifyListeners();
  }

  int get chatCount {
    return selectedChats.length;
  }

  setChatToReplyTo(Message chat) {
    chatToReplyTo = chat;
    replyTo = true;
    //print('set chat reply clicked!! -- $replyTo');
    notifyListeners();
  }

  /*Message get messageToReplyTo {
    return selectedChats[0];
  }*/

  addSelectedChat(Message chat) {
    //print('my added chat id is == ${chat.message}');
    selectedChats.add(chat);
    notifyListeners();
  }

}
