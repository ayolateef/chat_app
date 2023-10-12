import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Message {
  final String senderId;
  final String receiverId;
  final String message;
  final String senderEmail;
  final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.senderEmail,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      senderEmail: json['senderEmail'] as String,
      message: json['message'] as String,
      timestamp: json['timestamp'] as Timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'senderEmail': senderEmail,
      'message': message,
      'timestamp': timestamp,
    };
  }
}

class ChatMessages with ChangeNotifier {
  final Map<String, List<Message>> _messages = {};

  void addMessage(String chatRoomId, Message message) {
    if (_messages.containsKey(chatRoomId)) {
      _messages[chatRoomId]!.add(message);
    } else {
      _messages[chatRoomId] = [message];
    }
    notifyListeners();
  }

  List<Message> getMessages(String chatRoomId) {
    if (_messages.containsKey(chatRoomId)) {
      return _messages[chatRoomId]!;
    } else {
      return [];
    }
  }
}
