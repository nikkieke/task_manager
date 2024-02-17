import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/features.dart';

final signUpProvider = StateNotifierProvider.autoDispose<SignUpNotifier,
AsyncValue<NewUser>>(SignUpNotifier.new);


class SignUpNotifier extends StateNotifier<AsyncValue<NewUser>>{
  SignUpNotifier(this.ref) : super(const AsyncData(NewUser()));

  final Ref ref;

  Future<void> signUp(String email, String password, String fullName)async{
    state = const AsyncValue.loading();
      final result = await ref.read(authRepoProvider).createNewUser(
          email, password, fullName,);
    if(result.isRight) {
      state = AsyncValue.data(result.right);
    }else{
      state = AsyncValue.error(result.left.message, StackTrace.current);
    }
  }
}
