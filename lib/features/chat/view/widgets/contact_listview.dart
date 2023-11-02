import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/chat/chat.dart';
import 'package:task_manager/features/chat/view/widgets/widgets.dart';


class ContactListView extends StatefulWidget {
  const ContactListView({super.key});

  @override
  State<ContactListView> createState() => _ContactListViewState();
}

class _ContactListViewState extends State<ContactListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AzListView(
          data: contacts,
          itemCount: contacts.length,
          itemBuilder: (context, index){
            final contact = contacts[index];
            return ContactListTile(model: contact);
          },
      ),
    );
  }
}


class AZItem extends ISuspensionBean{
  AZItem({required this.name, required this.avatar, required this.tag});

  final String name;
  final String avatar;
  final String tag;

  @override
  String getSuspensionTag()=> tag;
}

final List<AZItem> contacts = [
  AZItem(name: 'Amelia', avatar: AppImage.avatar7, tag: 'A'),
  AZItem(name: 'Alexander', avatar: AppImage.avatar8, tag: 'A'),
  AZItem(name: 'Avery', avatar: AppImage.avatar9, tag: 'A'),
  AZItem(name: 'Asher', avatar: AppImage.avatar10, tag: 'A'),
  AZItem(name: 'Berrett', avatar: AppImage.avatar11, tag: 'B'),
  AZItem(name: 'Benjamin', avatar: AppImage.avatar12, tag: 'B'),
  AZItem(name: 'Brayden', avatar: AppImage.avatar13, tag: 'B'),
  AZItem(name: 'Braxton', avatar: AppImage.avatar14, tag: 'B'),
  AZItem(name: 'Braxton', avatar: AppImage.avatar15, tag: 'B'),
  AZItem(name: 'Charlotte', avatar: AppImage.avatar1, tag: 'B'),
  AZItem(name: 'Camelia', avatar: AppImage.avatar2, tag: 'B'),
];
