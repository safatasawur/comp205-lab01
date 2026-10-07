// Part 4 - YOU write the tests here (at least 3 more tests).
//
// Ideas:
//  - fetchAll keeps the order of the names
//  - withFallback returns the task's result when it succeeds
//  - withFallback returns 'offline' when the task throws
//  - withFallback uses a custom fallback value
import 'package:lab01_dart/part4_async.dart';
import 'package:test/test.dart';

void main() {
  // Example: an async test. Note `async` and `await`.
  test('fetchGreeting returns a greeting', () async {
    expect(await fetchGreeting('Ada', delay: Duration.zero), 'Hello, Ada');
  });

  // TODO(4.4): add your tests below.
}
