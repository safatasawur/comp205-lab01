import 'package:lab01_dart/part1_basics.dart';
import 'package:test/test.dart';

void main() {
  group('greet', () {
    test('uses Hello by default', () {
      expect(greet('Ada'), 'Hello, Ada!');
    });
    test('accepts a custom greeting', () {
      expect(greet('Ada', greeting: 'Merhaba'), 'Merhaba, Ada!');
    });
    test('excited ends with three exclamation marks', () {
      expect(greet('Ada', excited: true), 'Hello, Ada!!!');
    });
  });

  group('parseAge', () {
    test('parses a normal number', () => expect(parseAge('21'), 21));
    test('allows spaces around the number', () => expect(parseAge(' 7 '), 7));
    test('returns null for text', () => expect(parseAge('abc'), isNull));
    test('returns null for negative numbers', () => expect(parseAge('-3'), isNull));
    test('returns null for decimals', () => expect(parseAge('2.5'), isNull));
  });

  group('describeAge', () {
    test('null is unknown', () => expect(describeAge(null), 'unknown'));
    test('12 is child', () => expect(describeAge(12), 'child'));
    test('13 is teen', () => expect(describeAge(13), 'teen'));
    test('17 is teen', () => expect(describeAge(17), 'teen'));
    test('18 is adult', () => expect(describeAge(18), 'adult'));
  });

  group('safeLength', () {
    test('null has length 0', () => expect(safeLength(null), 0));
    test('counts characters', () => expect(safeLength('dart'), 4));
  });
}
