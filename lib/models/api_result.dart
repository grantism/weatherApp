class ApiResult<T> {
  ApiResult._();

  factory ApiResult.loading(T msg) = LoadingState<T>;

  factory ApiResult.success(T value) = SuccessState<T>;

  factory ApiResult.error(T msg) = ErrorState<T>;
}

class LoadingState<T> extends ApiResult<T> {
  LoadingState(this.msg) : super._();
  final T msg;
}

class ErrorState<T> extends ApiResult<T> {
  ErrorState(this.msg) : super._();
  final T msg;
}

class SuccessState<T> extends ApiResult<T> {
  SuccessState(this.value) : super._();
  final T value;
}
