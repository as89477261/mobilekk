import 'package:equatable/equatable.dart';

class ProcessedText extends Equatable {
  final String original;
  final DateTime processedTime;
  final double riskRatio;
  final ViolatedRule? violatedRule;
  final String? whichWord;

  ProcessedText({
    required this.original,
    required this.processedTime,
    required this.riskRatio,
    required this.violatedRule,
    required this.whichWord,
  });

  @override
  List<Object?> get props => [
        original,
        processedTime,
        riskRatio,
        violatedRule,
        whichWord,
      ];
}

class ViolatedRule extends Equatable {
  final String number;
  final String? description;

  ViolatedRule({
    required this.number,
    required this.description,
  });

  @override
  List<Object?> get props => [number, description];
}
