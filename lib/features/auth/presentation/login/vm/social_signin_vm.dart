import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/features.dart';

final socialSignInProvider = StateNotifierProvider.autoDispose<SocialSignInNotifier,
    AsyncValue<void>>(SocialSignInNotifier.new);

class SocialSignInNotifier extends StateNotifier<AsyncValue<void>>{
  SocialSignInNotifier(this.ref): super (const AsyncData(null));

  final Ref ref;

  Future<void>socialSignIn(SocialLogIn provider)async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(authRepoProvider).signInWithSocials(provider));
  }
}
