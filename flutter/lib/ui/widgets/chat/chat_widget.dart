import 'package:diabeticretinopathydetection/app/app.logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:videosdk/videosdk.dart';

class ChatWidget extends StatelessWidget {
  final bool isLocalParticipant;
  final PubSubMessage message;

  const ChatWidget({
    Key? key,
    required this.isLocalParticipant,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final log = getLogger('chatWidgetViewModel');
    return Align(
      alignment:
          isLocalParticipant ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: () {
          Clipboard.setData(ClipboardData(text: message.message));
        },
        child: Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black54,
          ),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isLocalParticipant ? "You" : message.senderName,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                   message.message,
                 
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${message.timestamp.toLocal().hour}:${message.timestamp.toLocal().minute}",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
