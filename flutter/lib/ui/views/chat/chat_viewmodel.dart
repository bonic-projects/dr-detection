import 'package:stacked/stacked.dart';

class ChatViewModel extends FormViewModel {
  String _msgText = '';
  String get msgText => _msgText;

  void updateMsgText(String newText) {
    _msgText = newText;
    notifyListeners();
  }

  void sendMessage(){
    if(!msgText.trim().isEmpty){
     // widget.room.pubsub.publish();
    }
  }

 void onModelReady() {
  
 }
}
