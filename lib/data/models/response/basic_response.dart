import 'package:equatable/equatable.dart';

class BaseResponse<T> extends Equatable {
  final T? data;
  final bool isSuccedded;
  final int code;
  List<String>? errors;

  BaseResponse(
      {required this.data,
      required this.isSuccedded,
      required this.code,
      this.errors});

  @override
  List<Object?> get props => [data, isSuccedded, code];
}
