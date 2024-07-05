import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:rive/rive.dart';
import 'package:task_manager/features/features.dart';

class VerifyEmailView extends ConsumerStatefulWidget {
  const VerifyEmailView({super.key});

  @override
  ConsumerState<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends ConsumerState<VerifyEmailView> {
  StateMachineController? controller;

  final TextEditingController code = TextEditingController();

  void verifyEmail(BuildContext context) {
    if (code.text.isEmpty) return;
    ref
        .read(verifyEmailTokenProvider.notifier)
        .sendVerifyEmailToken(code.text, context);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<String>>(verifyEmailTokenProvider, (_, state) {
      return state.whenOrNull(
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$error')),
          );
        },
      );
    });

    //listen for errors
    // ref.listen<AsyncValue<String>>(verifyEmailTokenProvider, (_, value) {
    //   if (value is AsyncData<String>) {
    //     context.pushNamed(AppRoute.home.name,
    //     );
    //   }
    //   if (value is AsyncError) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('${value.error}')),
    //     );
    //   }
    // });

    final verifyEmailTokenState = ref.watch(verifyEmailTokenProvider);
    final isLoading = verifyEmailTokenState is AsyncLoading<void>;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                width: 300.w,
                height: 300.h,
                child: RiveAnimation.asset(
                  AppImage.emailIcon,
                  stateMachines: const ['State Machine 1'],
                  onInit: (artboard) {
                    controller = StateMachineController.fromArtboard(
                      artboard,
                      'State Machine 1',
                    );
                    if (controller == null) return;
                    artboard.addController(controller!);
                  },
                ),
              ),
              Text(
                'Verify your email',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
              ),
              Space(10.h),
              Text(
                'Please input the four digit code sent to your email address.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Space(40.h),
              Pinput(
                controller: code,
                defaultPinTheme: buildPinTheme(context),
                focusedPinTheme: buildPinTheme(context, Colors.white),
                submittedPinTheme: buildPinTheme(context),
                errorPinTheme: buildPinTheme(context, const Color(0xffb42c3a)),
              ),
              Space(60.h),
              TextButton(
                onPressed: () {},
                child: RichText(
                  selectionColor: Theme.of(context).primaryColor,
                  text: TextSpan(
                    text: "Didn't get code? Resend in ",
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(
                        text: '55 ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      TextSpan(
                        text: 'seconds',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              Space(20.h),
              MainButton(
                loading: isLoading,
                text: 'Verify',
                pressed: () => verifyEmail(context),
              ),
              Space(20.h),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Change email?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PinTheme buildPinTheme(
    BuildContext context, [
    Color borderColor = const Color(0xFF35383F),
  ]) {
    return PinTheme(
      width: 83,
      height: 60,
      textStyle: Theme.of(context).textTheme.bodyMedium,
      decoration: BoxDecoration(
        color: const Color(0xff1F222A),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: borderColor,
        ),
      ),
    );
  }
}
