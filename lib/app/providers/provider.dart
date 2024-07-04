import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';

//------------------->>>>>> Firebase Services
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final firebaseFireStoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final storageServiceProvider = Provider((ref) => HiveStorageService.instance);

//-------------------->>>>>> Auth
final authServiceProvider = Provider((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firebaseStore = ref.watch(firebaseFireStoreProvider);
  final storageService = ref.watch(storageServiceProvider);
  return AuthService(
    firebaseAuth: firebaseAuth,
    fireStore: firebaseStore,
    storageService: storageService,
  );
});

final authRepoProvider = Provider<AuthRepository>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthRepoImpl(authService);
});

//------------------->>>>>> User
final userServiceProvider = Provider<UserService>((ref) {
  final authService = ref.watch(authServiceProvider);
  final firebaseStore = ref.watch(firebaseFireStoreProvider);
  final storageService = ref.watch(storageServiceProvider);
  return UserService(
    fireStore: firebaseStore,
    storageService: storageService,
    authService: authService,
  );
});

final userRepoProvider = Provider<UserRepository>((ref) {
  final userService = ref.watch(userServiceProvider);
  return UserRepoImpl(userService);
});
