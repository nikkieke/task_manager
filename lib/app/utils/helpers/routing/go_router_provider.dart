import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/features.dart';


final GlobalKey<NavigatorState> _rootNavigation = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigation = GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref){
  final analytics = ref.watch(analyticsProvider);
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigation,
    debugLogDiagnostics: true,
    restorationScopeId: 'app',
    observers: [
      analytics.getAnalyticsObserver(),
    ],
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.getStarted.name,
        builder: (context, state) => const GetStartedView(),
      ),
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/signup',
        name: AppRoute.signup.name,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: '/forgotPassword',
        name: AppRoute.forgotPassword.name,
        builder: (context, state) => const ForgotPasswordView(),
      ),

      ShellRoute(
        navigatorKey: _shellNavigation,
        parentNavigatorKey: _rootNavigation,
        restorationScopeId: 'app',
        builder: (context, state, child)=> MainScreen(key: state.pageKey,child: child,),
          routes: [
            GoRoute(
              path: '/home',
              name: AppRoute.home.name,
              pageBuilder: (context, state)=>  NoTransitionPage(
                  child: HomeView(key: state.pageKey,),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigation,
                  path: 'projectDetails',
                  name: AppRoute.projectDetails.name,
                  pageBuilder: (context, state)=>  NoTransitionPage(
                    child: ProjectDetailsView(key: state.pageKey,),
                  ),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigation,
                      path: 'addTask',
                      name: AppRoute.addTask.name,
                      pageBuilder: (context, state)=>  NoTransitionPage(
                        child: AddTaskView(key: state.pageKey,),
                      ),
                    ),
                  ],
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigation,
                  path: 'profile',
                  name: AppRoute.profile.name,
                  pageBuilder: (context, state)=>  NoTransitionPage(
                    child: ProfileView(key: state.pageKey,),
                  ),
                ),

              ],
            ),
            GoRoute(
              path: '/chat',
              name: AppRoute.chat.name,
              pageBuilder: (context, state)=>  NoTransitionPage(
                child: ChatView(key: state.pageKey,),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigation,
                  path: 'newChat',
                  name: AppRoute.newChat.name,
                  pageBuilder: (context, state)=>  NoTransitionPage(
                    child: NewChatView(key: state.pageKey,),
                  ),
                ),

              ],
            ),
            GoRoute(
              path: '/newProject',
              name: AppRoute.newProject.name,
              pageBuilder: (context, state)=>  NoTransitionPage(
                child: NewProjectView(key: state.pageKey,),
              ),
            ),
            GoRoute(
              path: '/calendar',
              name: AppRoute.calendar.name,
              pageBuilder: (context, state)=>  NoTransitionPage(
                child: CalendarView(key: state.pageKey,),
              ),
            ),
            GoRoute(
              path: '/notifications',
              name: AppRoute.notifications.name,
              pageBuilder: (context, state)=>  NoTransitionPage(
                child: NotificationsView(key: state.pageKey,),
              ),
            ),
          ],
      ),
    ],
  );
});

enum AppRoute {
  getStarted,
  login,
  signup,
  forgotPassword,
  home,
  chat,
  newProject,
  calendar,
  notifications,
  projectDetails,
  newChat,
  profile,
  addTask,
}
