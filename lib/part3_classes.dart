// Part 3 - Classes, named constructors, mixins and extensions.

/// A to-do task with a priority from 1 (low) to 3 (high).
class Task {
  final String title;
  final int priority;
  bool done;

  /// Creates a task. [priority] defaults to 1 and [done] to false.
  ///
  /// Throws an [ArgumentError] if [priority] is not between 1 and 3.
  Task(this.title, {this.priority = 1, this.done = false}) {
    if(this.priority<1 || this.priority>3){
       throw ArgumentError('value of priority is not valid, it should be in between 1 and 3');
    }
  }

  /// An urgent task always has priority 3.
  // TODO(3.2): this constructor forgets the priority. Fix it.
  Task.urgent(String title) : this(title,priority:3);

  /// Switches [done] between true and false.
  void toggle() {
    // TODO(3.3)
    done=!done;
  }

  /// Examples: "[ ] Buy milk (p1)" and "[x] Submit lab (p3)".
  @override
  String toString() {
    // TODO(3.4)
    final result = done ? 'x' : ' ';
    return '[$result] $title (p$priority)';

  }
}

/// Gives any class a creation time.
mixin Timestamped {
  DateTime? _createdAt;

  DateTime? get createdAt => _createdAt;

  /// Sets the creation time to [time] (or now, if not given).
  ///
  /// Only the first call has an effect; later calls keep the first time.
  void stamp([DateTime? time]) {
    // TODO(3.5): the ??= operator is very useful here.
    _createdAt ??= (time ?? DateTime.now());
  }
}

/// A task that also knows when it was created.
class TimedTask extends Task with Timestamped {
  TimedTask(super.title, {super.priority});
}

/// Helpers for lists of tasks.
extension TaskListTools on List<Task> {
  /// The tasks that are not done yet, in the original order.
  List<Task> get pending {
    return where((task) => !task.done).toList();
  }

  /// How many tasks are done.
  int get doneCount {
    // TODO(3.7)
    return where((task) => task.done).length;
  }

  /// A new list sorted by priority, highest first.
  ///
  List<Task> byPriority() {
    
    final sortedList = [...this];
    
    
    sortedList.sort((a, b) => b.priority.compareTo(a.priority));
    
    return sortedList;
  }
}
