import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/chat_models.dart';

class ChatService {
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

  Future<void> sendMessage(String chatRoomId, Message message) async {
    await _firebaseStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(message.toMap());
  }

  Stream<QuerySnapshot> getMessages(String chatRoomId) {
    return _firebaseStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
