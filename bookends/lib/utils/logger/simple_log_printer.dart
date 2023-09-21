import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  final String className;
  SimpleLogPrinter(this.className);

  AnsiColor _getLevelColor(Level level) {
    return PrettyPrinter.defaultLevelColors[level] ?? const AnsiColor.none();
  }

  @override
  List<String> log(LogEvent event) {
    List<String> buffer = [];
    var color = _getLevelColor(event.level);
    var emoji = PrettyPrinter.defaultLevelEmojis[event.level];

    buffer.add(color('$emoji $className - ${event.message}'));
    print();

    return [];
  }
}
