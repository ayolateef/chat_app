import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/chat_models.dart';
import '../utils/textfield.dart';
import 'chat_container.dart';

class ChatPage extends StatefulWidget {
  final String userEmail;
  final String userId;
  final List<String> participantIds;
  const ChatPage(
      {super.key,
      required this.userEmail,
      required this.userId,
      required this.participantIds});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  late String chatRoomId;

  @override
  void initState() {
    super.initState();
    chatRoomId = createChatRoomId(widget.participantIds);
  }

  String createChatRoomId(List<String> participantIds) {
    participantIds.sort();
    return participantIds.join("_");
  }

  void sendMessage(ChatMessages chatMessages) {
    if (_messageController.text.isNotEmpty) {
      final newMessage = Message(
        senderId: widget.userId,
        receiverId: chatRoomId,
        senderEmail: widget.userEmail,
        message: _messageController.text,
        timestamp: Timestamp.now(),
      );

      chatMessages.addMessage(chatRoomId, newMessage);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userEmail),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(context),
          ),
          _buildMessageInput(context),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList(BuildContext context) {
    final chatMessages = Provider.of<ChatMessages>(context);
    final messages = chatMessages.getMessages(chatRoomId);

    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ChatContainer(message: messages[index]);
      },
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextfield(
              controller: _messageController,
              hintText: 'Enter Message',
              obscureText: false,
            ),
          ),
          IconButton(
            onPressed: () =>
                sendMessage(Provider.of<ChatMessages>(context, listen: false)),
            icon: const Icon(
              Icons.send,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
