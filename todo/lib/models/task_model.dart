class TaskModel {
  final int id;
  final String text;
  final bool isCompeletd;

  TaskModel( {required this.id, required this.text, required this.isCompeletd});
  
  TaskModel copyWith({
    int? id,
    String? text,
    bool? isCompeletd,
  }) {
    return TaskModel(
      id: id ?? this.id,
      text: text ?? this.text,
      isCompeletd: isCompeletd ?? this.isCompeletd,
    );
  }
}