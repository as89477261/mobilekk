import 'package:equatable/equatable.dart';

class RecordSession extends Equatable{
  final String sessionId;

  RecordSession({required this.sessionId});

  @override
  List<Object?> get props => [sessionId];
}