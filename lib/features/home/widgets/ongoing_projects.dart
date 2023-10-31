import 'package:task_manager/app/app.dart';

class OngoingProjects{
  OngoingProjects({required this.title, required this.dueDate,
    required this.percentCompleted, required this.teamAvatars,required this.percent});

  final String title;
  final List<String>teamAvatars;
  final String dueDate;
  final String percentCompleted;
  final double percent;
}

final List<OngoingProjects> oP = [
  OngoingProjects(
      title: 'Mobile App Wireframe',
      dueDate: '21 March',
      percentCompleted: '75%',
      teamAvatars: [
        AppImage.avatar1,
        AppImage.avatar2,
        AppImage.avatar4,
      ],
    percent: 0.75,
  ),
  OngoingProjects(
    title: 'Real Estate App Design',
    dueDate: '20 June',
    percentCompleted: '60%',
    teamAvatars: [
      AppImage.avatar3,
      AppImage.avatar5,
      AppImage.avatar4,
    ],
    percent: 0.60,
  ),
  OngoingProjects(
    title: 'Dashboard & App Design',
    dueDate: '17 March',
    percentCompleted: '90%',
    teamAvatars: [
      AppImage.avatar5,
      AppImage.avatar1,
      AppImage.avatar4,
    ],
    percent: 0.90,
  ),
  OngoingProjects(
    title: 'Mobile App Wireframe',
    dueDate: '21 July',
    percentCompleted: '20%',
    teamAvatars: [
      AppImage.avatar3,
      AppImage.avatar5,
      AppImage.avatar4,
    ],
    percent: 0.20,
  ),
];
