enum ToDoType { tugas, programming }

class ToDo {
  int id;
  String title, description, createdTime;
  ToDoType? type;

  ToDo(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdTime,
      required this.type});
}
