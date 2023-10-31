import 'package:task_manager/app/app.dart';

class CompletedProjects{
  CompletedProjects({required this.title, required this.teamAvatar});
  final String title;
  final List<String> teamAvatar;
}

final List<CompletedProjects> cP =[
  CompletedProjects(title: 'Real Estate Website Design',
      teamAvatar: [
        AppImage.avatar1,
        AppImage.avatar2,
        AppImage.avatar3,
        AppImage.avatar4,
        AppImage.avatar5,
      ],
  ),

  CompletedProjects(title: 'E-learning Website Design',
    teamAvatar: [
      AppImage.avatar4,
      AppImage.avatar5,
      AppImage.avatar1,
      AppImage.avatar3,
      AppImage.avatar2,
    ],
  ),

  CompletedProjects(title: 'Ecommerce Website Design',
    teamAvatar: [
      AppImage.avatar3,
      AppImage.avatar2,
      AppImage.avatar3,
      AppImage.avatar2,
      AppImage.avatar5,
    ],
  ),

  CompletedProjects(title: 'Finance Mobile App Design',
    teamAvatar: [
      AppImage.avatar2,
      AppImage.avatar1,
      AppImage.avatar4,
      AppImage.avatar3,
      AppImage.avatar5,
    ],
  ),

];
