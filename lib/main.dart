import 'dart:io';


void add(List<String> e, String b) {
  e.add(b);
  print('Task "$b" added.\n');
}


void display(List<String> e) {
  print('Tasks:');
  for (int i = 0; i < e.length; i++) {
    print('${i + 1}. ${e[i]}');
  }
  print('\n');
}


void complete(int num, List<String> e, Map<String, String> completeTasks) {
  if (num >= 0 && num < e.length) {
    String task = e.removeAt(num);
    completeTasks[task] = 'Completed';
    print('Task "$task" marked as complete.\n');
  } else {
    print('Invalid task number.\n');
  }
}


void displayComplete(Map<String, String> completeTasks) {
  print('Completed Tasks:');
  completeTasks.forEach((task, status) {
    print('$task - $status');
  });
  print('\n');
}


void dalete(List<String> e, int num) {
  if (num >= 0 && num < e.length) {
    String task = e.removeAt(num);
    print('Task "$task" deleted.\n');
  } else {
    print('Invalid task number.\n');
  }
}

void main() {
  List<String> toDo = ['task1', 'task2', 'task3'];
  Map<String, String> completeTasks = {};

  while (true) {
    print('1. Add Task');
    print('2. Display Tasks');
    print('3. Mark Task as Complete');
    print('4. Display Completed Tasks');
    print('5. Delete Task');
    print('6. Exit');
    print('Choose an option: ');

    String? choice = stdin.readLineSync();

    if (choice == '1') {
      print('Enter the task name:');
      String? taskName = stdin.readLineSync();
      if (taskName != null && taskName.isNotEmpty) {
        add(toDo, taskName);
      } else {
        print('Task name cannot be empty.\n');
      }
    } else if (choice == '2') {
      display(toDo);
    } else if (choice == '3') {
      display(toDo);
      print('Enter the task number to mark as complete:');
      String? numStr = stdin.readLineSync();
      int? num = int.tryParse(numStr ?? '');
      if (num != null && num > 0 && num <= toDo.length) {
        complete(num - 1, toDo, completeTasks);
      } else {
        print('Invalid task number.\n');
      }
    } else if (choice == '4') {
      displayComplete(completeTasks);
    } else if (choice == '5') {
      display(toDo);
      print('Enter the task number to delete:');
      String? numStr = stdin.readLineSync();
      int? num = int.tryParse(numStr ?? '');
      if (num != null && num > 0 && num <= toDo.length) {
        dalete(toDo, num - 1);
      } else {
        print('Invalid task number.\n');
      }
    } else if (choice == '6') {
      print('Exiting...');
      break;
    } else {
      print('Invalid choice, please try again.\n');
    }
  }
}
