import 'package:equatable/equatable.dart';

class IsConsentAllowed extends Equatable {
  final bool? isConsentAllowed;
  IsConsentAllowed({required this.isConsentAllowed});

  @override
  List<Object?> get props => [isConsentAllowed];
}