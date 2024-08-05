import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userLocalStorageProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 28, 22, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: SvgPicture.asset(
                        AppImage.arrowLeft,
                        width: 20.w,
                      ),
                    ),
                    Align(
                      child: Text(
                        'Profile',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 20.sp),
                      ),
                    ),
                  ],
                ),
                Space(50.h),
                const ProfileAvatar(),
                Space(52.h),
                DetailsCard(
                  model: UserDetails(
                    title: '${user.right.fullName}',
                    leadingIcon: AppImage.userAdd,
                    trailingIcon: AppImage.editLinear,
                  ),
                ),
                DetailsCard(
                  model: UserDetails(
                    title: '${user.right.email}',
                    leadingIcon: AppImage.userTagLinear,
                    trailingIcon: AppImage.editLinear,
                  ),
                ),
                ...List.generate(uD.length, (index) {
                  final userDetail = uD[index];
                  return DetailsCard(model: userDetail);
                }),
                Space(48.h),
                MainButton(
                  loading: false,
                  text: 'LogOut',
                  pressed: () {
                    //ref.read(logOutProvider.notifier).signOut(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserDetails {
  const UserDetails({
    required this.title,
    required this.leadingIcon,
    required this.trailingIcon,
  });
  final String title;
  final String leadingIcon;
  final String trailingIcon;
}

final List<UserDetails> uD = [
  const UserDetails(
    title: 'Password',
    leadingIcon: AppImage.lockLinear,
    trailingIcon: AppImage.editLinear,
  ),
  const UserDetails(
    title: 'My Projects',
    leadingIcon: AppImage.project,
    trailingIcon: AppImage.editLinear,
  ),
  const UserDetails(
    title: 'Privacy',
    leadingIcon: AppImage.securityCard,
    trailingIcon: AppImage.arrowDown,
  ),
  const UserDetails(
    title: 'Setting',
    leadingIcon: AppImage.settingLinear,
    trailingIcon: AppImage.arrowDown,
  ),
];

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    required this.model,
    super.key,
  });
  final UserDetails model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      width: double.maxFinite,
      height: 54.h,
      decoration: const BoxDecoration(
        color: Color(0xff1b1b1b),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                model.leadingIcon,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white54,
                  BlendMode.srcIn,
                ),
              ),
              Space(20.w),
              Text(model.title),
            ],
          ),
          SvgPicture.asset(
            model.trailingIcon,
            width: 20,
            colorFilter: const ColorFilter.mode(
              Colors.white54,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
