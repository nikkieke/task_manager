import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/features.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchCtr = TextEditingController();
  String fullName = '';

  @override
  void initState() {
    final storageService = HiveStorageService.instance;
    fullName = storageService.get(StorageKey.username.name).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 28, 22, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 13.sp,),
                      ),
                      Text(
                        fullName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                   TextButton(
                       onPressed: (){
                         context.pushNamed(AppRoute.profile.name);
                       },
                       child: SizedBox(
                         width: 47.w,
                         height: 48.h,
                         child: Image.asset(AppImage.avatar1),),
                   ),
                ],
              ),
              Space(36.h),
              CupertinoSearchTextField(
                backgroundColor: const Color(0xff1b1b1b),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                prefixInsets: const EdgeInsets.only(left: 15),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                placeholder: 'Search Projects',
                placeholderStyle: Theme.of(context).textTheme.bodyMedium,
                controller: searchCtr,
                onChanged: (value) {},
              ),
              Space(25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Completed Projects',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 20.sp),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
              Space(5.h),
              SizedBox(
                width: double.maxFinite,
                height: 175.h,
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),),
                    scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index){
                            final completedProject = cP[index];
                            return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: CompletedProjectsCard(model: completedProject,),);
                          },
                        childCount:  cP.length,
                      ),
                    ),
                  ],
                ),
              ),
              Space(25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ongoing Projects',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 20.sp),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),),
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index){
                              final ongoingProject = oP[index];
                          return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: OngoingProjectsCard(model: ongoingProject,),
                                  );
                        },
                        childCount:  oP.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
