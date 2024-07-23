class TaskModel {
  String title;
  String content;
  DateTime time;
  String? id;
  bool isDone;

  TaskModel({
    this.id,
    required this.title,
    required this.content,
    required this.time,
    required this.isDone,
  });
  factory TaskModel.fromJson(jsonData) {
    return TaskModel(
      title: jsonData['title'],
      content: jsonData['content'],
      time: DateTime.fromMillisecondsSinceEpoch(jsonData['time']),
      id: jsonData['id'],
      isDone: jsonData['isDone'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'content': content,
      'time': time.millisecondsSinceEpoch,
      'id': id,
      'isDone': isDone,
    };
  }

  // TaskModel copyWith({
  //   String? title,
  //   String? content,
  //   DateTime? time,
  //   String? id,
  //   bool? isDone,
  // }) {
  //   return TaskModel(
  //     title: title ?? this.title,
  //     content: content ?? this.content,
  //     time: time ?? this.time,
  //     id: id ?? this.id,
  //     isDone: isDone ?? this.isDone,
  //   ); 
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'title': title,
  //     'content': content,
  //     'time': time.millisecondsSinceEpoch,
  //     'id': id,
  //     'isDone': isDone,
  //   };
  // }

  // factory TaskModel.fromMap(Map<String, dynamic> map) {
  //   return TaskModel(
  //     title: map['title'] as String,
  //     content: map['content'] as String,
  //     time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
  //     id: map['id'] as String,
  //     isDone: map['isDone'] as bool,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory TaskModel.fromJson(String source) =>
  //     TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'TaskModel(title: $title, content: $content, time: $time, id: $id, isDone: $isDone)';
  // }

  // @override
  // bool operator ==(covariant TaskModel other) {
  //   if (identical(this, other)) return true;

  //   return other.title == title &&
  //       other.content == content &&
  //       other.time == time &&
  //       other.id == id &&
  //       other.isDone == isDone;
  // }

  // @override
  // int get hashCode {
  //   return title.hashCode ^
  //       content.hashCode ^
  //       time.hashCode ^
  //       id.hashCode ^
  //       isDone.hashCode;
  // }
}
