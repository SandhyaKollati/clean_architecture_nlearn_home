import 'package:equatable/equatable.dart';

class HomeDishaConfigResponse extends Equatable {
  final String? dishaEndPoint;

  const HomeDishaConfigResponse({required this.dishaEndPoint});

  @override
  // TODO: implement props
  List<Object?> get props => [dishaEndPoint];
}