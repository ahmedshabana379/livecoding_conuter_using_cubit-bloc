class TaskModel {
  final int id;
  final String text;
  final bool isCompleted;

  TaskModel({required this.id, required this.text, required this.isCompleted});

  TaskModel copyWith({int? id, String? text, bool? isCompleted}) {
    return TaskModel(
      id: id ?? this.id,
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as int,
      text: json['text'] as String,
      isCompleted: json['isCompleted'] as bool,
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'isCompleted': isCompleted};
  }
}
