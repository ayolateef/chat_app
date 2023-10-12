import 'package:flutter/material.dart';

class ChatContainer extends StatefulWidget {
  final String message;
  const ChatContainer({super.key, required this.message}) ;

  @override
  State<ChatContainer> createState() => _ChatContainerState();
}

class _ChatContainerState extends State<ChatContainer> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.purple,
      ),
      child: Text(widget.message,
      style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
