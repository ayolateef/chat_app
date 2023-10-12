import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/chat_models.dart';

class ChatContainer extends StatelessWidget {
  final Message message;

  ChatContainer({required this.message});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    String formattedTime = DateFormat.Hm().format(dateTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: Text(
            message.senderEmail,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, left: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.purple,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message.message,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            DateFormat.Hm().format(message.timestamp.toDate()),
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
