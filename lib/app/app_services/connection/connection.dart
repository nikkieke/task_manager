import 'dart:async';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task_manager/app/app.dart';

final connectionProvider = StreamProvider.autoDispose((ref)async*{
  final stream = StreamController<InternetConnectionStatus>();

  final listener =
      InternetConnectionChecker().onStatusChange.listen((status)async{
        switch (status){
          case InternetConnectionStatus.connected:
            break;
          case InternetConnectionStatus.disconnected:
            await AlertView.showFlashToast( message: 'check your internet connection', ToastGravity.TOP);
        }
        stream.add(status);
      });

  await for (final value in stream.stream){
    log('stream value => $value');
    yield value;
  }

  ref.onDispose(() {
    stream.close();
    listener.cancel();
  });

});
