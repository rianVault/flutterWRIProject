class Task {
  String title;
  String description;
  DateTime? dueDate;

  Task({
    required this.title,
    required this.description,
    this.dueDate
  });
}