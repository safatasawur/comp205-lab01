import 'package:lab01_dart/part3_classes.dart';
import 'package:test/test.dart';

void main() {
  group('Task', () {
    test('has default priority 1 and is not done', () {
      final t = Task('Buy milk');
      expect(t.priority, 1);
      expect(t.done, isFalse);
    });
    test('rejects priority outside 1..3', () {
      expect(() => Task('x', priority: 0), throwsArgumentError);
      expect(() => Task('x', priority: 4), throwsArgumentError);
    });
    test('urgent tasks have priority 3', () {
      expect(Task.urgent('Submit lab').priority, 3);
    });
    test('toggle switches done', () {
      final t = Task('Read')..toggle();
      expect(t.done, isTrue);
      t.toggle();
      expect(t.done, isFalse);
    });
    test('toString format', () {
      expect(Task('Buy milk').toString(), '[ ] Buy milk (p1)');
      expect(Task.urgent('Submit lab').toString(), '[ ] Submit lab (p3)');
      expect((Task('Read')..toggle()).toString(), '[x] Read (p1)');
    });
  });

  group('Timestamped / TimedTask', () {
    test('createdAt is null before stamp', () {
      expect(TimedTask('a').createdAt, isNull);
    });
    test('stamp keeps the first time', () {
      final first = DateTime(2026, 10, 7, 10);
      final t = TimedTask('a', priority: 2)
        ..stamp(first)
        ..stamp(DateTime(2030));
      expect(t.createdAt, first);
      expect(t.priority, 2);
    });
    test('a TimedTask is a Task', () {
      expect(TimedTask('a'), isA<Task>());
    });
  });

  group('TaskListTools', () {
    final tasks = [
      Task('a', priority: 1),
      Task('b', priority: 3, done: true),
      Task('c', priority: 2),
    ];
    test('pending keeps order', () {
      expect(tasks.pending.map((t) => t.title), ['a', 'c']);
    });
    test('doneCount', () => expect(tasks.doneCount, 1));
    test('byPriority sorts high to low without changing the original', () {
      expect(tasks.byPriority().map((t) => t.title), ['b', 'c', 'a']);
      expect(tasks.map((t) => t.title), ['a', 'b', 'c']);
    });
  });
}
