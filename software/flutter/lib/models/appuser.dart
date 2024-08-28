

class AppUser {
  final String? id;
  final String? fullName;
  final String? photoUrl;
  final String? email;
  final String? userRole;
  final double? latitude;
  final double? homeLat;
  final double? longitude;
  final double? homeLong;
  final String? place;
  final String? phone;
  final DateTime? regTime;
  final String? videoId;
  final bool? isVideoOn;

  AppUser({
     this.isVideoOn,
    this.id,
    this.fullName,
    this.photoUrl,
    this.email,
    this.userRole,
    this.latitude,
    this.phone,
    this.longitude,
    this.homeLat,
    this.homeLong,
    this.place,
    this.regTime,
    this.videoId,
  });

  AppUser.fromMap(Map<String, dynamic> data)
      : id = data['id'] ?? "",
      isVideoOn = data[false],
        fullName = data['fullName'] ?? "nil",
        photoUrl = data['photoUrl'] ?? "nil",
        email = data['email'] ?? "nil",
        userRole = data['userRole'] ?? "patient",
        latitude = data['lat'] ?? 0.0,
        longitude = data['long'] ?? 0.0,
        homeLat = data['homeLat'] ?? 0.0,
        homeLong = data['homeLong'] ?? 0.0,
        phone = data['phone'] ?? "",
        place = data['place'] ?? "",
        videoId = data['videoId'],
        regTime =
            data['regTime'] != null ? data['regTime'].toDate() : DateTime.now();

  Map<String, dynamic> toJson(keyword) {
    Map<String, dynamic> map = {
      'isVideoOn':isVideoOn,
      'id': id,
      'fullName': fullName,
      'photoUrl': photoUrl,
      'keyword': keyword,
      'email': email,
      'userRole': userRole,
      'lat': latitude,
      'long': longitude,
      'place': place,
      'phone': "+918137810031",
      'regTime': regTime,
      'videoId': videoId,
    };
    // if (imgString != null) map['imgString'] = imgString!;
    return map;
  }
}
