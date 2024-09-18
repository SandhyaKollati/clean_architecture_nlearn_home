import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String errorMessage;
  const Failure([this.errorMessage = 'An unknown Error Occurred']);

  @override
  List<Object?> get props => [errorMessage];
}
