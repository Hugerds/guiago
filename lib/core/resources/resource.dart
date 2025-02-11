import 'package:guia_go/core/resources/status.dart';

class Resource<T, E> {
  Resource({
    this.data,
    this.error,
    this.status,
  });

  Resource.success({this.data, this.error, this.status = Status.success});

  Resource.failed({this.data, this.error, this.status = Status.failed});

  Resource.loading({this.data, this.error, this.status = Status.loading});

  Resource.unauthorized({this.data, this.error, this.status = Status.unauthorized});
  T? data;
  E? error;
  Status? status;

  bool get hasError => error != null;
  bool get success => status == Status.success;
  bool get isLoading => status == Status.loading;

  Resource<T, E> copyWith({
    T? data,
    E? error,
    Status? status,
    int? code,
  }) {
    return Resource<T, E>(
      data: data ?? this.data,
      error: error ?? this.error,
      // status: status ?? this.status,
    );
  }
}
