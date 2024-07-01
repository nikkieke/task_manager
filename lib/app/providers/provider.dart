import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';

//-------------------->>>>>> Auth
final authRepoProvider = Provider<AuthRepository>((ref){
  return AuthRepoImpl();
});

//------------------->>>>>> User
final userRepoProvider = Provider<UserRepository>((ref) {
  return UserRepoImpl();
});
