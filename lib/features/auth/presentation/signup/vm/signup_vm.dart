import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/app/app.dart';

final signUpProvider = StateNotifierProvider.autoDispose<SignUpNotifier,
AsyncValue<void>>(SignUpNotifier.new);


class SignUpNotifier extends StateNotifier<AsyncValue<void>>{
  SignUpNotifier(this.ref) : super(const AsyncData(null));

  final Ref ref;

  Future<void> signUp(String email, String password, String fullName)async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(authRepoProvider).createNewUser(email, password, fullName));

  }
}
