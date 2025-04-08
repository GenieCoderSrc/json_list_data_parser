// stream_extensions.dart

extension StreamOfListOfMapsExtension<T>
    on Stream<List<Map<String, dynamic>?>?> {
  Stream<List<T>>? mapToNonNullableModelStream<T>(
      T Function(Map<String, dynamic>) fromJson) {
    return map((list) =>
        list
            ?.whereType<Map<String, dynamic>>()
            .map((json) => fromJson(json))
            .toList() ??
        []);
  }
}
