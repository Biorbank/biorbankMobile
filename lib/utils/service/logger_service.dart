import 'package:biorbank/utils/constants/constants.dart';
import 'package:logger/logger.dart';

class EnableDebugFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

class LogService {
  static final logger = Logger(
    filter: Constants.isDebugMode ? EnableDebugFilter() : null,
    printer: PrettyPrinter(errorMethodCount: 10),
  );
}
