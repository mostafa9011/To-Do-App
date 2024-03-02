class TaskModel {
  final String title;
  final String content;
  final String date;

  TaskModel({
    required this.title,
    required this.content,
    required this.date,
  });
  // factory TaskModel.fromJson(jsonData) {
  //   return TaskModel(
  //     title: jsonData['title'],
  //     content: jsonData['content'],
  //     date: jsonData['date'],
  //   );
  // }
}
