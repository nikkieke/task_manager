import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';

final logOutProvider =
    StateNotifierProvider.autoDispose<LogOutNotifier, AsyncValue<bool>>(
  LogOutNotifier.new,
);

class LogOutNotifier extends StateNotifier<AsyncValue<bool>> {
  LogOutNotifier(this.ref) : super(const AsyncData(false));

  final Ref ref;

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    final result = await ref.read(authRepoProvider).logOut();
    if (result.isRight) {
      state = AsyncValue.data(result.right);
    } else {
      BaseUtils.basicPrint(result.left.code);
      state = AsyncValue.error(result.left.message, StackTrace.current);
    }
  }
}
