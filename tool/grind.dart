import 'dart:io';

import 'package:grinder/grinder.dart';

main(List<String> args) => grind(args);

@Task('run build_runner')
void runner() {
  _runProcess(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
  );
}

Future<void> _runProcess(String executable, List<String> arguments) async {
  final result = await Process.run(executable, arguments);
  stdout.write(result.stdout);
  stderr.write(result.stderr);
}
