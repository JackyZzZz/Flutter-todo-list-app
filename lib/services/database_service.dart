import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final User? _user = FirebaseAuth.instance.currentUser;

  String get _uid => _user!.uid;

  Stream<List<String>> getTasks() {
    return _db
        .collection('users')
        .doc(_uid)
        .collection('tasks')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => doc['task'] as String).toList(),
        );
  }

  Future<void> addTask(String task) async {
    await _db.collection('users').doc(_uid).collection('tasks').add({
      'task': task,
    });
  }
}
