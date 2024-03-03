import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBuWbobHloNIOrg8F_q06SWVOKx2rv02JI",
            authDomain: "ncuquit-50206.firebaseapp.com",
            projectId: "ncuquit-50206",
            storageBucket: "ncuquit-50206.appspot.com",
            messagingSenderId: "574627624080",
            appId: "1:574627624080:web:87395bc146312f0a035415",
            measurementId: "G-9R7FQY5JB6"));
  } else {
    await Firebase.initializeApp();
  }
}
