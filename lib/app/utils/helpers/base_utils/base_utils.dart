import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

class BaseUtils{
  static void basicPrint(dynamic value){
    return debugPrint(value.toString());
  }

  static void log(String tag, Object? content, {String message = ''}){
    if(!foundation.kReleaseMode){
      String jsonEncodedContent;
      try{
        jsonEncodedContent = jsonEncode(content);
      }catch (e){
        jsonEncodedContent = jsonEncode(content?.toString());
      }

      developer.log(
        message.isEmpty? tag: message,
        name: tag,
        error: jsonEncodedContent,
      );
    }
  }


}

