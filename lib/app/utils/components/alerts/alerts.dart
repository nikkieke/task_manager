import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as toast;
import 'package:go_router/go_router.dart';
import 'package:task_manager/app/app.dart';


class AlertView{

  static Future<void> showErrorDialog(
  {required BuildContext context, String content = '', }){
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (BuildContext context)=> AlertDialog.adaptive(
          backgroundColor: const Color(0xff1b1b1b),
          title: Text('Error', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),),
          content: Text(content, style: Theme.of(context).textTheme.bodyMedium,),
          actions: [
            TextButton(
                onPressed: (){
                  context.pop();
                },
                child: Text('OK', style: Theme.of(context).textTheme.bodyMedium,),
            ),
          ],
        ),


    );
  }


  static Future<void> showFlashToast(toast.ToastGravity? gravity, {String message = ''})async{
    await showFlash(
      context: rootNavigation.currentState!.overlay!.context,
      duration:  const Duration(milliseconds: 5500),
      builder: (context, controller){
        return FlashBar(
            controller: controller,
            title: const Text('Internet Connection'),
            titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
            content: Text(message),
            contentTextStyle: Theme.of(context).textTheme.bodyMedium,
            backgroundColor: const Color(0xff1b1b1b),
            forwardAnimationCurve: Curves.easeInCirc,
            reverseAnimationCurve: Curves.bounceIn,
            position: FlashPosition.top,
            behavior: FlashBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          margin: const EdgeInsets.fromLTRB(35, 20, 35, 35),
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          elevation: 0,
          clipBehavior: Clip.antiAlias,


        );
      },
    );
  }


}
