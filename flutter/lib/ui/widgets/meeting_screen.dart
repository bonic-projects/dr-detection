import 'package:diabeticretinopathydetection/ui/widgets/chat/chat_view.dart';
import 'package:diabeticretinopathydetection/ui/widgets/meeting_controls.js.dart';
import 'package:diabeticretinopathydetection/ui/widgets/participant_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:videosdk/videosdk.dart';

class MeetingScreen extends StatefulWidget {
  final String meetingId;
  final String token;

  const MeetingScreen(
      {super.key, required this.meetingId, required this.token});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  late Room _room;
  late Room _chatRoom;

  var micEnabled = true;
  var camEnabled = true;

  Map<String, Participant> participants = {};

  @override
  void initState() {
    _chatRoom = VideoSDK.createRoom(roomId: widget.meetingId, displayName: "Chat Name", token: widget.token);

    // create room
    _room = VideoSDK.createRoom(
        roomId: widget.meetingId,
        token: widget.token,
        displayName: "John Doe",
        micEnabled: micEnabled,
        camEnabled: camEnabled,
        defaultCameraIndex: kIsWeb
            ? 0
            : 1 // Index of MediaDevices will be used to set default camera
        );

    setMeetingEventListener();

    // Join room
    _room.join();

    super.initState();
  }

  // listening to meeting events
  void setMeetingEventListener() {
    _room.on(Events.roomJoined, () {
      setState(() {
        participants.putIfAbsent(
            _room.localParticipant.id, () => _room.localParticipant);
      });
    });

    _room.on(
      Events.participantJoined,
      (Participant participant) {
        setState(
          () => participants.putIfAbsent(participant.id, () => participant),
        );
      },
    );

    _room.on(Events.participantLeft, (String participantId) {
      if (participants.containsKey(participantId)) {
        setState(
          () => participants.remove(participantId),
        );
      }
    });

    _room.on(Events.roomLeft, () {
      participants.clear();
      Navigator.popUntil(context, ModalRoute.withName('/'));
    });
  }

  // onbackButton pressed leave the room
  Future<bool> onBack() async {
    _room.leave();
    Navigator.pop(context);
    return true;
  }

  @override
  void dispose() {
    onBack();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(widget.meetingId),
          //render all participant
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, index) {
                  return ParticipantTile(
                      key: Key(participants.values.elementAt(index).id),
                      participant: participants.values.elementAt(index));
                },
                itemCount: participants.length,
              ),
            ),
          ),
          Expanded(child: ChatView(meeting: _chatRoom)),

          MeetingControls(
            onToggleMicButtonPressed: () {
              micEnabled ? _room.muteMic() : _room.unmuteMic();
              micEnabled = !micEnabled;
            },
            onToggleCameraButtonPressed: () {
              camEnabled ? _room.disableCam() : _room.enableCam();
              camEnabled = !camEnabled;
            },
            onLeaveButtonPressed: () {
              _room.leave();
            },
          ),
        ],
      ),
    );
  }
}
