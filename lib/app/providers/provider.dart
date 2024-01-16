import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';

//-------------------->>>>>> User Auth
final authRepoProvider = Provider<AuthRepository>((ref){
  return AuthRepoImpl();
});
