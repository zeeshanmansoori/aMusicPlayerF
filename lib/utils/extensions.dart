import 'package:formz/formz.dart';
import 'package:shared_repo/models/request_status.dart';

extension RequestStatusCustomExtension on RequestStatus {
  FormzSubmissionStatus toApiStatus() {
    return status == RequestStatus.SUCCESS
        ? FormzSubmissionStatus.success
        : FormzSubmissionStatus.failure;
  }

  bool get isSuccess => status == RequestStatus.SUCCESS;

  String? toMessage({String? success, String? failure}) {
    return status == RequestStatus.SUCCESS ? success : (failure ?? msg);
  }
}