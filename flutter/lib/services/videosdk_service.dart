import 'dart:convert';

import 'package:diabeticretinopathydetection/app/app.logger.dart';
import 'package:http/http.dart' as http;

class VideosdkService {
  final log = getLogger('VideosdkService');

//Auth token we will use to generate a meeting and connect to it
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiJlNzc2NWI0MS04YTRlLTRmYjEtYjczNy1mMzkzMDgwNmJmOTciLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcwNzc1NDgxMywiZXhwIjoxNzIzMzA2ODEzfQ.7eP1DWE2G7JdGfrbNaSVdh_QtyiLwya_O0zdPqzasuA";

// API call to create meeting
  Future<String?> createMeeting() async {
    log.i("Create meeting");
    try {
      final http.Response httpResponse = await http.post(
        Uri.parse("https://api.videosdk.live/v2/rooms"),
        headers: {'Authorization': token},
      );
      log.v(httpResponse.body);
      //Destructuring the roomId from the response
      return json.decode(httpResponse.body)['roomId'];
    } catch (e) {
      log.e(e);
    }
    return null;
  }

  bool validateMeetingId(meetingId) {
    var re = RegExp("\\w{4}\\-\\w{4}\\-\\w{4}");
    // check meeting id is not null or invaild
    // if meeting id is vaild then navigate to MeetingScreen with meetingId,token
    return (meetingId.isNotEmpty && re.hasMatch(meetingId));
  }
}
