class Todo {
  String id;
  String description;
  bool isCompleted;
  Todo({required this.description})
      : this.id = DateTime.now().toString(),
        this.isCompleted = false;
}