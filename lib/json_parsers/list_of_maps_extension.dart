extension ListOfMapsExtension<T> on List<Map<String, dynamic>?> {
  List<T?>? listOfMapToListOfModels(T Function(Map<String, dynamic>) fromJson) {
    final List<T?> result = whereType<Map<String, dynamic>>()
        .map((Map<String, dynamic> json) => fromJson(json))
        .toList();
    return result.isNotEmpty ? result : null;
  }
}
