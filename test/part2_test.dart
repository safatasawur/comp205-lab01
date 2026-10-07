import 'package:lab01_dart/part2_collections.dart';
import 'package:test/test.dart';

void main() {
  group('evens', () {
    test('keeps even numbers in order', () {
      expect(evens([1, 2, 3, 4, 6]), [2, 4, 6]);
    });
    test('empty list gives empty list', () => expect(evens([]), isEmpty));
  });

  group('wordCount', () {
    test('counts words case-insensitively', () {
      expect(wordCount('The cat the'), {'the': 2, 'cat': 1});
    });
    test('handles extra spaces and new lines', () {
      expect(wordCount('  a  b\n a '), {'a': 2, 'b': 1});
    });
    test('empty text gives empty map', () => expect(wordCount(''), isEmpty));
  });

  group('minMax', () {
    test('returns (min, max) as a record', () {
      final (low, high) = minMax([4, -2, 9, 0]);
      expect(low, -2);
      expect(high, 9);
    });
    test('single element', () => expect(minMax([5]), (5, 5)));
    test('empty list throws ArgumentError', () {
      expect(() => minMax([]), throwsArgumentError);
    });
  });

  group('buildMenu', () {
    test('default menu has only Home', () => expect(buildMenu(), ['Home']));
    test('admin menu', () => expect(buildMenu(isAdmin: true), ['Home', 'Admin']));
    test('extras are added at the end', () {
      expect(
        buildMenu(isAdmin: true, extras: ['Settings', 'Help']),
        ['Home', 'Admin', 'Settings', 'Help'],
      );
    });
  });
}
