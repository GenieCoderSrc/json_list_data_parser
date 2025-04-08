import 'package:json_list_data_parser/json_list_data_parser.dart';

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], age: json['age']);
  }
}

Future<void> main() async {
  // Example using Future extension
  Future<List<Map<String, dynamic>?>> futureJsonList = Future.value([
    {'name': 'Alice', 'age': 25},
    {'name': 'Bob', 'age': 30},
    null,
  ]);

  List<User> users = await futureJsonList.mapToNonNullableModelList(
    User.fromJson,
  );
  print(users.map((user) => user.name).toList()); // [Alice, Bob]

  // Example using List extension
  List<Map<String, dynamic>?> jsonList = [
    {'name': 'Charlie', 'age': 28},
    {'name': 'Diana', 'age': 35},
    null,
  ];

  List<User>? usersList =
      jsonList.listOfMapToListOfModels(User.fromJson)?.cast<User>();
  print(usersList?.map((user) => user?.name).toList()); // [Charlie, Diana]

  // Example using Stream extension
  Stream<List<Map<String, dynamic>?>> jsonStream = Stream.value([
    {'name': 'Eve', 'age': 22},
    {'name': 'Frank', 'age': 40},
  ]);

  Stream<List<User>>? userStream = jsonStream.mapToNonNullableModelStream(
    User.fromJson,
  );
  userStream?.listen((users) {
    print(users.map((user) => user.name).toList()); // [Eve, Frank]
  });
}
