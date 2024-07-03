import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';

final userDataProvider = FutureProvider((ref) {
  return ref.watch(userRepoProvider).getStoredUser('userProfile');
});

// final getUserDataProvider = FutureProvider((ref) {
//   return ref.watch(userRepoProvider).getUserFromFireStore();
// });

final getUserDataProvider =
    StateNotifierProvider.autoDispose<GetUserDataNotifier, AsyncValue<NewUser>>(
  GetUserDataNotifier.new,
);

class GetUserDataNotifier extends StateNotifier<AsyncValue<NewUser>> {
  GetUserDataNotifier(this.ref) : super(const AsyncData(NewUser()));

  final Ref ref;

  Future<void> userData() async {
    state = const AsyncValue.loading();
    final result = await ref.read(userRepoProvider).getUserFromFireStore();
    if (result.isRight) {
      state = AsyncValue.data(result.right);
    } else {
      BaseUtils.basicPrint(result.left.code);
      state = AsyncValue.error(result.left.message, StackTrace.current);
    }
  }
}
