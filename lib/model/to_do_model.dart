enum ToDoType { tugas, programming }

class ToDo {
  String id,title, description, createdTime;
  ToDoType? type;

  ToDo(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdTime,
      required this.type});
}
