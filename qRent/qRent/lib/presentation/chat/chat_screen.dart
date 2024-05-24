import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/chat/chat_controller.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final ChatController _con = Get.put(ChatController());

  ChatScreen({Key? key}) : super(key: key);

  Widget chatListView() {
    return Expanded(
      child: StreamBuilder(
        builder: (context, snapshot) {
          return ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: _con.listSection.length,
              itemBuilder: (context, index) {
                return _con.listSection[index].isMine
                    ? sentmessagewidget(
                        _con.listSection[index].message,
                        _con.listSection[index].time,
                      )
                    : receivedMessagesWidget(
                        _con.listSection[index].message,
                        _con.listSection[index].time,
                      );
              });
        },
        stream: null,
      ),
    );
  }

  Widget sentmessagewidget(message, time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            time,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyText2!
                .apply(color: Colors.grey),
          ),
          const SizedBox(width: 15),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(Get.context!).size.width * 0.75),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.bodyText1!.apply(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget receivedMessagesWidget(message, time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(Get.context!).size.width * 0.75),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.bodyText1!.apply(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            time,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyText2!
                .apply(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  addMessage(messageText) {
    if (messageText != null && messageText.isNotEmpty) {
      _con.listSection.add(
        ChatMessageModel(
          message: messageText,
          time: '12.35',
          isMine: true,
        ),
      );
    }
    _con.messageText.value = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        titleSpacing: 0,
        centerTitle: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 5),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      offset: const Offset(0, 2),
                      blurRadius: 5)
                ],
              ),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2019/11/06/17/26/gear-4606749_960_720.jpg'),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Cybdom Tech",
                  style: TextStyle(color: Colors.black),
                  overflow: TextOverflow.clip,
                ),
                Text(
                  "Online",
                  style: Theme.of(context).textTheme.subtitle1!.apply(
                        color: Colors.green,
                      ),
                )
              ],
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        // color: AppColors.primaryColor.withOpacity(0.4),
        child: Column(
          children: [
            chatListView(),
            Container(
              margin: const EdgeInsets.all(15.0),
              height: 61,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35.0),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 5,
                              color: Colors.grey)
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Transform.scale(
                            scale: 1,
                            child: IconButton(
                                icon: Image.asset(ImageConstant.mic),
                                onPressed: () {}),
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (val) {
                                _con.messageText.value = val;
                              },
                              onSubmitted: (String str) {
                                addMessage(str);
                                _con.messageText.value = '';
                              },
                              decoration: InputDecoration(
                                  hintText: "Type Something...",
                                  hintStyle: TextStyle(
                                      color: AppColors.subTextColor,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 12),
                                  border: InputBorder.none),
                            ),
                          ),
                          Transform.scale(
                            scale: 1,
                            child: IconButton(
                                icon: Image.asset(ImageConstant.copy),
                                onPressed: () {}),
                          ),
                          Transform.scale(
                            scale: 1,
                            child: IconButton(
                              icon: Image.asset(ImageConstant.send),
                              onPressed: () {
                                addMessage(_con.messageText.value);
                                _con.messageText.value = '';
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
