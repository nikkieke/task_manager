class AllTasks{
  AllTasks({required this. title, required this.checked});
  final String title;
  bool checked;
}

final List<AllTasks> aT = [
  AllTasks(title: 'User Interviews', checked: true),
  AllTasks(title: 'Wireframes', checked: true),
  AllTasks(title: 'Design System', checked: false),
  AllTasks(title: 'Icons', checked: false),
  AllTasks(title: 'Final Mockups', checked: false),
];
