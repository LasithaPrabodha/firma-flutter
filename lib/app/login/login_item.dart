class LoginItem {
  final int userId;
  final int id;
  final String title; 
  final bool completed;

  LoginItem({this.userId = 0, this.id = 0, this.title = '', this.completed = false});

  factory LoginItem.fromJson(Map<String, dynamic> json) {
    return LoginItem(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
