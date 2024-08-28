import 'package:diabeticretinopathydetection/app/app.logger.dart';
import 'package:diabeticretinopathydetection/ui/widgets/chat/chat_widget.dart';
import 'package:flutter/material.dart';

import 'package:videosdk/videosdk.dart';

// ChatScreen
class ChatView extends StatefulWidget {
  final Room meeting;

  const ChatView({
    Key? key,
    required this.meeting,
  }) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final log = getLogger('patientViewModel');
  // MessageTextController
  final msgTextController = TextEditingController();

  // PubSubMessages
  PubSubMessages? messages;
  bool isRaisedHand = false;

  @override
  void initState() {
    super.initState();

    // Subscribing 'CHAT' Topic
    widget.meeting.pubSub
        .subscribe("CHAT", messageHandler)
        .then((value) => setState((() => messages = value)));
    log.i("InitState called");
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: messages == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    children: messages!.messages
                        .map(
                          (e) => ChatWidget(
                            message: e,
                            isLocalParticipant: e.senderId ==
                                widget.meeting.localParticipant.id,
                          ),
                        )
                        .toList(),
                  ),
                ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black54),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        controller: msgTextController,
                        onChanged: (value) => setState(() {
                          msgTextController.text;
                        }),
                        decoration: const InputDecoration(
                            hintText: "Write your message",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.black54,
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: msgTextController.text.trim().isEmpty
                          ? null
                          : () => widget.meeting.pubSub
                              .publish(
                                "CHAT",
                                msgTextController.text,
                                const PubSubPublishOptions(persist: true),
                              )
                              .then((value) => msgTextController.clear()),
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          width: 45,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          decoration: BoxDecoration(
                              color: msgTextController.text.trim().isEmpty
                                  ? null
                                  : Colors.purple,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(Icons.send)),
                    ),
                  ],
                ),
              ),
            ),
            // if (!widget.showClose) const SizedBox(width: 20,),
            // if (!widget.showClose)
            // TouchRippleEffect(
            //   borderRadius: BorderRadius.circular(12),
            //   rippleColor: primaryColor,
            //   onTap: () {
            //     if (!isRaisedHand) {
            //       widget.meeting.pubSub
            //           .publish("RAISE_HAND", "message");
            //       setState(() {
            //         isRaisedHand = true;
            //       });

            //       Timer(const Duration(seconds: 5), () {
            //         setState(() {
            //           isRaisedHand = false;
            //         });
            //       });
            //     }
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: isRaisedHand
            //           ? Color.fromRGBO(255, 255, 255, 1)
            //           : Color.fromRGBO(0, 0, 0, 0.3),
            //     ),
            //     padding: const EdgeInsets.all(14),
            //     child: SvgPicture.asset(
            //       "assets/ic_hand.svg",
            //       color: isRaisedHand ? Colors.black : Colors.white,
            //       height: 24,
            //       width: 24,
            //     ),
            //   ),
            // ),
          ],
        )
      ],
    );
  }

  void messageHandler(PubSubMessage message) {
    log.i("Message recived");
    setState(() => messages!.messages.add(message));
  }

  @override
  void dispose() {
    widget.meeting.pubSub.unsubscribe("CHAT", messageHandler);
    super.dispose();
  }
}
