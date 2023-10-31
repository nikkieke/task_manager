import 'package:flutter/material.dart';
import 'package:task_manager/features/chat/view/widgets/widgets.dart';




class ChatTab extends StatelessWidget {
  const ChatTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),),
        itemCount: chats.length,
        itemBuilder: (context, index){
          final chat = chats[index];
          return ChatListTile(model: chat);
        },
    );
  }
}
