extension FutureListOfMapsExtension on Future<List<Map<String, dynamic>?>?> {
  Future<List<T>> mapToNonNullableModelList<T>(
      T Function(Map<String, dynamic>) fromJson) async {
    final list = await this;
    return list
            ?.whereType<Map<String, dynamic>>()
            .map((json) => fromJson(json))
            .toList() ??
        [];
  }
}
