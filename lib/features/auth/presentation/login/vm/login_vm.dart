import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/features.dart';

final logInProvider = StateNotifierProvider.autoDispose<LogInNotifier,
    AsyncValue<NewUser>>(LogInNotifier.new);


class LogInNotifier extends StateNotifier<AsyncValue<NewUser>>{
  LogInNotifier(this.ref) : super(const AsyncData(NewUser()));

  final Ref ref;

  Future<void> signIn(String email, String password,BuildContext context)async{
    state = const AsyncValue.loading();
    final result = await ref.read(authRepoProvider).logInUser(
      email, password,);
    if(result.isRight) {
      state = AsyncValue.data(result.right);
      if(context.mounted){
        context.goNamed(AppRoute.home.name);
      }
    }else{
      state = AsyncValue.error(result.left.message, StackTrace.current);
    }
  }
}