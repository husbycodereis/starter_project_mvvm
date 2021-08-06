class NavigateException<T> implements Exception {
  final dynamic model;
  NavigateException(
    this.model,
  );
  @override
  String toString() {
    return 'This model variable is not found in route $model as $T';
  }
}
