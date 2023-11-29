import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:task_manager/app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp(flavor: Flavor.dev);
  runApp(const ProviderScope(child: App()));
}
