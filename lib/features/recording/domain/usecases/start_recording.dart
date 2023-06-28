import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/recording/domain/entities/record_session.dart';

class StartRecording {
  Future<AppResponse<RecordSession>> call() {
    throw UnimplementedError("");
  }
}

class StartRecordingError extends AppError {
  StartRecordingError({required super.errorMessage});

  static final cannotStartRecord = StartRecordingError(
    errorMessage: "ไม่สามารถอัดเสียงได้ในขณะนี้ กรุณาลองภายหลัง",
  );
}
