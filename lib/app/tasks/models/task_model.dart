import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  CollectionReference tasks = FirebaseFirestore.instance.collection('Tasks');
   String title;
   String content;
   String time;
   String id;

  TaskModel({
    required this.id,
    required this.title,
    required this.content,
    required this.time,
  });
  factory TaskModel.fromJson(jsonData) {
    return TaskModel(
      title: jsonData['title'],
      content: jsonData['content'],
      time: jsonData['time'].toString(),
      id: jsonData['id'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'content': content,
      'time': DateTime.now().toString(),
      'id': id,
    };
  }
}
