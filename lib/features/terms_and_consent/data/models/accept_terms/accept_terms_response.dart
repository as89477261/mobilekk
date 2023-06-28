import 'package:equatable/equatable.dart';

class AcceptTermsResponse extends Equatable {
  final bool isSuccess;

  AcceptTermsResponse({required this.isSuccess});

  @override
  List<Object?> get props => [isSuccess];
}
