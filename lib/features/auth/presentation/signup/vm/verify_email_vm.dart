import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';

final sendTokenProvider =
    StateNotifierProvider.autoDispose<SendTokenNotifier, AsyncValue<String>>(
  SendTokenNotifier.new,
);

class SendTokenNotifier extends StateNotifier<AsyncValue<String>> {
  SendTokenNotifier(this.ref) : super(const AsyncData(''));

  final Ref ref;

  Future<void> sendVerifyEmailToken() async {
    state = const AsyncValue.loading();
    final result = await ref.read(authRepoProvider).sendVerifyEmailToken();
    if (result.isRight) {
      state = AsyncValue.data(result.right.data);
    } else {
      BaseUtils.basicPrint(result.left.code);
      state = AsyncValue.error(result.left.message, StackTrace.current);
    }
  }
}

final verifyEmailTokenProvider =
    StateNotifierProvider.autoDispose<VerifyEmailNotifier, AsyncValue<String>>(
  VerifyEmailNotifier.new,
);

class VerifyEmailNotifier extends StateNotifier<AsyncValue<String>> {
  VerifyEmailNotifier(this.ref) : super(const AsyncData(''));

  final Ref ref;

  Future<void> sendVerifyEmailToken(String token, BuildContext context) async {
    state = const AsyncValue.loading();
    final result =
        await ref.read(authRepoProvider).confirmEmailVerificationToken(token);
    if (result.isRight) {
      state = AsyncValue.data(result.right.data);
      if (context.mounted) {
        context.goNamed(
          AppRoute.home.name,
        );
      }
    } else {
      BaseUtils.basicPrint(result.left.code);
      state = AsyncValue.error(result.left.message, StackTrace.current);
    }
  }
}
