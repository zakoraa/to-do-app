enum ToDoType { tugas, programming, others }

class ToDo {
  final String title, createdTime;
  final ToDoType? type;
  bool isDone;

  ToDo(
      {required this.title,
      required this.createdTime,
      required this.type,
      this.isDone = false});

  ToDo copyWith({
    String? title,
    String? createdTime,
    ToDoType? type,
    bool? isDone,
  }) {
    return ToDo(
        title: title ?? this.title,
        createdTime: createdTime ?? this.createdTime,
        type: type ?? type,
        isDone: isDone ?? this.isDone);
  }

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
        title: json["title"],
        createdTime: json["createdTime"],
        type: json["type"],
        isDone: json["isDone"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "createdTime": createdTime,
      "type": type,
      "isDone": isDone,
    };
  }

  @override
  String toString() {
    return """Todo: {
      title: $title\n
      createdTime: $createdTime\n
      type: $type\n
      isDone: $isDone\n
    }""";
  }
}
