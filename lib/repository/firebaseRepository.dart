import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../firebase_options.dart';

class FirebaseRepository {
  FirebaseRepository();

  initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseDatabase.instance.setPersistenceEnabled(true);
    //FirebaseDatabase.instance.setLoggingEnabled(true);
    FirebaseDatabase.instance.setPersistenceCacheSizeBytes(100000000);
  }

  Future<void> write(String path, Object value) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(path);
    await ref.set(value);
  }

  Future<void> writeWithCallBack(
      String path, Map<String, dynamic> value) async {
    FirebaseDatabase.instance.ref(path).set(value).then((_) {
      print("Successful");
    }).catchError((error) {
      print("There is a problem : " + error);
    });
  }

  Future<void> update(String path, Map<String, dynamic> value) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(path);
    await ref.update(value);
  }

  Future<Object?> read(String path, String value) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(path);
    final snapshot = await ref.child(value).get();
    if (snapshot.exists) {
      return snapshot.value;
    } else {
      return null;
    }
  }
}
