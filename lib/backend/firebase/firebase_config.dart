import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBxc7e7QpL10EqSgrrXDPJvwYuEdvepIDY",
            authDomain: "infectocast-40420.firebaseapp.com",
            projectId: "infectocast-40420",
            storageBucket: "infectocast-40420.appspot.com",
            messagingSenderId: "1071627617219",
            appId: "1:1071627617219:web:29d575fb38fedb3a793376",
            measurementId: "G-KL8F979KLR"));
  } else {
    await Firebase.initializeApp();
  }
}
