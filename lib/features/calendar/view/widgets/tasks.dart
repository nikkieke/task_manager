import 'package:task_manager/app/app.dart';

class Tasks{
  Tasks({required this.title, required this.time, required this.teamAvatar});

  final String title;
  final String time;
  final List<String> teamAvatar;
}

final List<Tasks> todayTasks = [
  Tasks(
      title: 'User Interviews',
      time: '16:00 - 18:30',
      teamAvatar: [
        AppImage.avatar3,
        AppImage.avatar2,
        AppImage.avatar4,
      ],
  ),
  Tasks(
    title: 'Wireframe',
    time: '16:00 - 18:30',
    teamAvatar: [
      AppImage.avatar5,
      AppImage.avatar4,
      AppImage.avatar8,
    ],
  ),
  Tasks(
    title: 'Icons',
    time: '16:00 - 18:30',
    teamAvatar: [
      AppImage.avatar10,
      AppImage.avatar12,
      AppImage.avatar4,
    ],
  ),
  Tasks(
    title: 'Mockups',
    time: '16:00 - 18:30',
    teamAvatar: [
      AppImage.avatar6,
      AppImage.avatar8,
      AppImage.avatar10,
    ],
  ),
  Tasks(
    title: 'Testing',
    time: '16:00 - 18:30',
    teamAvatar: [
      AppImage.avatar3,
      AppImage.avatar2,
      AppImage.avatar4,
    ],
  ),
];
