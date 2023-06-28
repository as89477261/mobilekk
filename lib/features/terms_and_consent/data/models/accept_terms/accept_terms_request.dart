import 'package:equatable/equatable.dart';

class AcceptTermsRequest extends Equatable{
  final String userId;
  AcceptTermsRequest({required this.userId});

  @override
  List<Object?> get props => [userId];
}