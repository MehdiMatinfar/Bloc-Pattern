abstract class DataState<T> {
  final T? data;
  final String? error;

  DataState(this.data, this.error);
}

class DataStateSuccessfully<T> extends DataState<T> {
  T? data;

  DataStateSuccessfully({this.data}) : super(data, null);
}

class DataStateError<T> extends DataState<T> {
  String? error;

  DataStateError({this.error}) : super(null, error);
}
