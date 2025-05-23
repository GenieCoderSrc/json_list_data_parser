# json_list_data_parser

A Dart package that provides helpful extensions for handling JSON data by converting lists of maps into strongly typed model lists and streams.

## Features
- Convert `Future<List<Map<String, dynamic>>>` to a strongly typed model list.
- Convert `List<Map<String, dynamic>>` into a list of models.
- Convert `Stream<List<Map<String, dynamic>>>` into a strongly typed model stream.

## Installation
Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  json_list_data_parser: latest_version
```

Then run:
```sh
dart pub get
```

## Usage

### Convert Future List of Maps to Model List
```dart
import 'package:json_list_data_parser/json_list_data_parser.dart';

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
    );
  }
}

Future<void> main() async {
  Future<List<Map<String, dynamic>?>> futureJsonList = Future.value([
    {'name': 'Alice', 'age': 25},
    {'name': 'Bob', 'age': 30},
    null,
  ]);

  List<User> users = await futureJsonList.mapToNonNullableModelList(User.fromJson);
  print(users.map((user) => user.name).toList()); // [Alice, Bob]
}
```

### Convert List of Maps to List of Models
```dart
List<Map<String, dynamic>?> jsonList = [
  {'name': 'Alice', 'age': 25},
  {'name': 'Bob', 'age': 30},
  null,
];

List<User>? users = jsonList.listOfMapToListOfModels(User.fromJson);
print(users?.map((user) => user?.name).toList()); // [Alice, Bob]
```

### Convert Stream of List of Maps to Model Stream
```dart
Stream<List<Map<String, dynamic>?>> jsonStream = Stream.value([
  {'name': 'Alice', 'age': 25},
  {'name': 'Bob', 'age': 30},
]);

Stream<List<User>>? userStream = jsonStream.mapToNonNullableModelStream(User.fromJson);
userStream?.listen((users) {
  print(users.map((user) => user.name).toList()); // [Alice, Bob]
});
```

## License
This project is licensed under the MIT License.

#   j s o n _ l i s t _ d a t a _ p a r s e r  
 