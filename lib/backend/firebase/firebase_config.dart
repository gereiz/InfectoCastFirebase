import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCCQnAraA9bxzGbNeZSBNswUFigvhQz0cw",
            authDomain: "infecto-firebase-eciz28.firebaseapp.com",
            projectId: "infecto-firebase-eciz28",
            storageBucket: "infecto-firebase-eciz28.appspot.com",
            messagingSenderId: "546042396081",
            appId: "1:546042396081:web:c832f2a16b637ef964d190"));
  } else {
    await Firebase.initializeApp();
  }
}
