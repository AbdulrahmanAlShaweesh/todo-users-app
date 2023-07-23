class TodosModel {
  int id;
  String title;
  bool completed;

  TodosModel({required this.id, required this.title, required this.completed});

  factory TodosModel.fromJson({dynamic jsonData}) {
    return TodosModel(
      id: jsonData['id'],
      title: jsonData['title'],
      completed: jsonData['completed'],
    );
  }

  @override
  String toString() {
    return 'id => $id , title => $title , completed => $completed';
  }
}
