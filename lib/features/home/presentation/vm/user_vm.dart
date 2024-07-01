import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';

final userDataProvider = FutureProvider((ref) {
  return ref.watch(userRepoProvider).getUserInfo('userProfile');
});

final userLogOut = FutureProvider((ref) {
  return ref.watch(authRepoProvider).logOut();
});
