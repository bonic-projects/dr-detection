import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabeticretinopathydetection/app/app.locator.dart';
import 'package:diabeticretinopathydetection/app/app.logger.dart';
import 'package:diabeticretinopathydetection/app/constants/app_keys.dart';
import 'package:diabeticretinopathydetection/models/appuser.dart';
import 'package:diabeticretinopathydetection/models/reminder.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class FirestoreService {
  final log = getLogger('FirestoreApi');
  final _authenticationService = locator<FirebaseAuthenticationService>();

  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection(UsersFirestoreKey);

  Future<bool> createUser({required AppUser user, required keyword}) async {
    log.i('user:$user');
    try {
      final userDocument = _usersCollection.doc(user.id);

      await userDocument.set(user.toJson(keyword), SetOptions(merge: true));
      log.v('UserCreated at ${userDocument.path}');
      return true;
    } catch (error) {
      log.e("Error $error");
      return false;
    }
  }

  Future<bool> updateVideoId({required String videoId}) async {
    log.i('Video Id update');
    try {
      final userDocument =
          _usersCollection.doc(_authenticationService.currentUser!.uid);
      await userDocument.update({"videoId": videoId});
      // log.v('UserCreated at ${userDocument.path}');
      return true;
    } catch (error) {
      log.e("Error $error");
      return false;
    }
  }

  Future<bool> deleteVideoId() async {
    log.i('Deleting Video Id');
    try {
      final userDocument = _usersCollection
          .doc(_authenticationService.currentUser!.uid); // Get user document
      await userDocument.update({"videoId": FieldValue.delete()});
      log.i('Video Id deleted successfully');
      return true;
    } catch (error) {
      log.e("Error deleting Video Id: $error");
      return false;
    }
  }

  Future<AppUser?> getUser({required String userId, AppUser? user}) async {
    log.i('userId:$userId');
    log.i('userId:$user');
    //  final userRoll = _usersCollection.doc(user!.userRole);
    // log.i('User role document: $userRoll');

    if (userId.isNotEmpty) {
      final userDoc = await _usersCollection.doc(userId).get();

      if (!userDoc.exists) {
        log.v('We have no user with id $userId in our database');
        return null;
      }

      final userData = userDoc.data();
      log.v('User found. Data: $userData');

      return AppUser.fromMap(userData! as Map<String, dynamic>);
    } else {
      log.e("Error no user");
      return null;
    }
  }

  Future<List<AppUser>> getUsersWithVideoId() async {
  log.i('Fetching users with Video Id');
  try {
    final querySnapshot = await _usersCollection.where('videoId', isNotEqualTo: null).get();
    log.i("Video id users found: ${querySnapshot.size}");
    
    final List<AppUser> usersList = [];
    querySnapshot.docs.forEach((doc) {
      final userData = doc.data() as Map<String, dynamic>;
      final user = AppUser.fromMap(userData);
      usersList.add(user);
    });
    
    return usersList;
  } catch (error) {
    log.e("Error fetching users with Video Id: $error");
    return [];
  }
}

  Future<List<AppUser>> searchUsers(String keyword) async {
    log.i("searching for $keyword");
    final query = _usersCollection
        .where('keyword', arrayContains: keyword.toLowerCase())
        .limit(5);

    final snapshot = await query.get();

    return snapshot.docs
        .map((doc) => AppUser.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<bool> updateLocation(double lat, double long, String place) async {
    log.i('Location update');
    try {
      final userDocument =
          _usersCollection.doc(_authenticationService.currentUser!.uid);
      await userDocument.update({
        "lat": lat,
        "long": long,
        "place": place,
      });
      // log.v('UserCreated at ${userDocument.path}');
      return true;
    } catch (error) {
      log.e("Error $error");
      return false;
    }
  }

  Future<bool> updateBystander(String uid) async {
    log.i('Bystander update');
    try {
      final userDocument =
          _usersCollection.doc(_authenticationService.currentUser!.uid);
      await userDocument.update({
        "bystanders": FieldValue.arrayUnion([uid])
      });
      // log.v('UserCreated at ${userDocument.path}');
      return true;
    } catch (error) {
      log.e("Error $error");
      return false;
    }
  }

  Future<List<AppUser>> getUsersWithBystander() async {
    QuerySnapshot querySnapshot = await _usersCollection
        .where('bystanders',
            arrayContains: _authenticationService.currentUser!.uid)
        .get();

    return querySnapshot.docs
        .map((snapshot) =>
            AppUser.fromMap(snapshot.data() as Map<String, dynamic>))
        .toList();
  }

  String? generateReminderDocumentId(String userId) {
    try {
      // Add a document with an auto-generated ID
      DocumentReference documentReference =
          _usersCollection.doc(userId).collection('reminders').doc();

      // Retrieve the auto-generated ID from the document reference
      String documentId = documentReference.id;

      // Return the generated document ID
      return documentId;
    } catch (e) {
      // Handle any errors here
      log.e("Error generating document ID: $e");
      return null; // You might want to handle errors more gracefully
    }
  }

  Future<void> addReminder(String userId, Reminder reminder) async {
    try {
      final reminderDocument =
          _usersCollection.doc(userId).collection('reminders').doc(reminder.id);
      await reminderDocument.set(reminder.toJson(), SetOptions(merge: true));
    } catch (e) {
      log.e('Error adding reminder: $e');
    }
  }

  Future<void> deleteReminder(String userId, String reminderId) async {
    try {
      await _usersCollection
          .doc(userId)
          .collection('reminders')
          .doc(reminderId)
          .delete();
    } catch (e) {
      log.e('Error deleting reminder: $e');
    }
  }

  Stream<List<Reminder>> getRemindersStream() {
    try {
      // Snapshot of the query result as a stream
      Stream<QuerySnapshot> snapshots = _usersCollection
          .doc(_authenticationService.currentUser!.uid)
          .collection('reminders')
          .snapshots();

      // Map the snapshots to a list of Vehicle objects
      Stream<List<Reminder>> vehicleStream =
          snapshots.map((QuerySnapshot snapshot) {
        return snapshot.docs.map((DocumentSnapshot document) {
          return Reminder.fromMap(document.data() as Map<String, dynamic>);
        }).toList();
      });

      return vehicleStream;
    } catch (e) {
      // Handle any errors here
      log.e("Error getting vehicles for user: $e");
      // You might want to handle errors more gracefully
      return Stream.value([]); // Return an empty list on error
    }
  }
}
