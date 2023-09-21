import 'package:logger/logger.dart';

class LoggerUtil {
  Logger logger;

  LoggerUtil({
    required String className,
  });

  static Logger logger = Logger(
    level: Level.debug,
    printer: PrettyPrinter(),
  );

  static void setLogLevel(Level level) {
    logger = Logger(
      level: level,
      printer: PrettyPrinter(
        methodCount: 10,
      ),
    );
  }
}
