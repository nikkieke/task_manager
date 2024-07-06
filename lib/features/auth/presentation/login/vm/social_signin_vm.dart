import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';

final socialSignInProvider = StateNotifierProvider.autoDispose<
    SocialSignInNotifier, AsyncValue<NewUser>>(SocialSignInNotifier.new);

class SocialSignInNotifier extends StateNotifier<AsyncValue<NewUser>> {
  SocialSignInNotifier(this.ref) : super(const AsyncData(NewUser()));

  final Ref ref;

  Future<void> socialSignIn(SocialLogIn provider) async {
    state = const AsyncValue.loading();
    final result = await ref.read(authRepoProvider).signInWithSocials(provider);
    if (result.isRight) {
      state = AsyncValue.data(result.right);
    } else {
      BaseUtils.basicPrint(result.left.code);
      state = AsyncValue.error(result.left.message, StackTrace.current);
    }
  }
}
