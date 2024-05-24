import 'package:get/get.dart';

class ChatMessageModel {
  final bool isMine;
  final String? message;
  final String? time;

  ChatMessageModel({this.isMine = false, this.message, this.time});
}

class ChatController extends GetxController {
  RxString messageText = "".obs;

  RxList<ChatMessageModel> listSection = RxList([
    ChatMessageModel(
      message: "What is messages with chat features?",
      time: '12.35',
    ),
    ChatMessageModel(
      message: "Can I like a text on Samsung?",
      time: '12.36',
    ),
  ]);
}
