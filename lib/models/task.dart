class Task {
  final String title;
  final DateTime dateTime;

  Task({
    required this.title,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}
