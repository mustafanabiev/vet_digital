import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vet_digital/firebase_options.dart';
import 'package:vet_digital/src/app/view/app.dart';
import 'package:vet_digital/src/locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await di.init();
  runApp(const App());
}
