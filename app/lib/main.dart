import 'package:app/src/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'assets/config/.env');
  return runApp(const Navigation());
}
