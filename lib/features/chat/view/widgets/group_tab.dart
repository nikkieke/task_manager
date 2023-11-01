import 'package:flutter/material.dart';
import 'package:task_manager/features/chat/view/widgets/widgets.dart';




class GroupTab extends StatelessWidget {
  const GroupTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),),
      itemCount: groupChats.length,
      itemBuilder: (context, index){
        final gChat = groupChats[index];
        return GroupListTile(model: gChat);
      },
    );
  }
}
