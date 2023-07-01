import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scribe/src/data/services/data_service.dart';

import 'firebase_options.dart';
import 'src/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configFirebase();
  setupDataService();
  runApp(const MyApp());
}

Future<void> configFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
