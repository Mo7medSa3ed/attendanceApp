import 'package:attendance_app/api/services/app_exceptions.dart';
import 'package:attendance_app/helper/general_helper.dart';

class HandlerController {
  
  void handleError(error) {
    if (error is ApiNotRespondException) {
      final message = error.message;
      GeneralHelper.showErrorDialog(desc: message ?? '');
    } else if (error is BadRequestException) {
      final message = error.message;
      GeneralHelper.showErrorDialog(desc: message ?? '');
    } else if (error is FetchDataException) {
      GeneralHelper.showErrorDialog(desc: '.Oops! It took longer to respond');
    }
  }
}
