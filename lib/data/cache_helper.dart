import 'package:shared_preferences/shared_preferences.dart';

import '../models/task.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static String allTasksString = "";
  static List<Task> allTasks = [];
  // static List<Task> pendingTasks = [];
  // static List<Task> completedTasks = [];
  // static List<Task> favoriteTasks = [];
  // static List<Task> removedTasks = [];
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    try {
      allTasks =
          Task.fromJson(sharedPreferences!.getString('allTasks') as String);
    } catch (e) {
      print("Error in INITING TASKS task!");
      print(e);
    }
    ///// nelzya tak delat' птому что каждый раз
    ///когда запускается все данные аннулируется
    // sharedPreferences!.setString("pendingTasks", "");
    // sharedPreferences!.setString("completedTasks", "");
    // sharedPreferences!.setString("removedTasks", "");
    // sharedPreferences!.setString("favotireTasks", "");
  }

  static void addTask({required Task task}) async {
    try {
      allTasksString = sharedPreferences!.getString('allTasks')!;
      if (allTasksString.isNotEmpty) allTasks = Task.fromJson(allTasksString);
      allTasks.add(
          task.copyWith(isDeleted: false, isFavorite: false, isDone: false));
    } catch (e) {
      print("Error in ADD ing task!");
      print(e);
    }
    sharedPreferences!.setString('allTasks', Task.toJson(allTasks));
  }

  static void updateTask({required Task task}) {
    try {
      allTasks =
          Task.fromJson(sharedPreferences!.getString('allTasks') as String);
      if (task.isDone == false) {
        allTasks.remove(task);
        allTasks.add(task.copyWith(isDone: true));
      } else {
        allTasks.remove(task);
        allTasks.add(task.copyWith(isDone: false));
      }
    } catch (e) {
      print("Error in UPDATING task!");
      print(e);
    }
    sharedPreferences!.setString('allTasks', Task.toJson(allTasks));
  }

  static void deleteTask({required Task task}) {
    try {
      allTasks =
          Task.fromJson(sharedPreferences!.getString('allTasks') as String);
      allTasks.remove(task);
    } catch (e) {
      print("Error in DELETE ing task!");
      print(e);
    }
    sharedPreferences!.setString('allTasks', Task.toJson(allTasks));
  }

  static void removeTask({required Task task}) {
    try {
      allTasks =
          Task.fromJson(sharedPreferences!.getString('allTasks') as String);
      allTasks.remove(task);
      allTasks.add(task.copyWith(isDeleted: true));
    } catch (e) {
      print("Error in REMOVE ing task!");
      print(e);
    }
    sharedPreferences!.setString('allTasks', Task.toJson(allTasks));
  }

  static void markFavoriteOrUnfavoriteTask({required Task task}) {
    var taskIndex = allTasks.indexOf(task);
    print("TASK INDEX in markFAVORITE is " + taskIndex.toString());

    try {
      allTasks =
          Task.fromJson(sharedPreferences!.getString('allTasks') as String);
      if (task.isFavorite == false) {
        allTasks.remove(task);
        allTasks.insert(0, task.copyWith(isFavorite: true));
      } else {
        allTasks.remove(task);
        allTasks.insert(0, task.copyWith(isFavorite: false));
      }
    } catch (e) {
      print("Error in FAVORITE ing task!");
      print(e);
    }
    sharedPreferences!.setString('allTasks', Task.toJson(allTasks));
  }

  static void editTask({required Task oldtask, newtask}) {
    try {
      allTasks =
          Task.fromJson(sharedPreferences!.getString('allTasks') as String);
      if (oldtask.isFavorite == true) {
        allTasks.remove(oldtask);
        allTasks.insert(0, newtask);
      }
      allTasks.remove(oldtask);
      allTasks.insert(0, newtask);
    } catch (e) {
      print("Error in EDIT ing task!");
      print(e);
    }
    sharedPreferences!.setString('allTasks', Task.toJson(allTasks));
  }

  static void restoreTask({required Task task}) {
    try {
      allTasks =
          Task.fromJson(sharedPreferences!.getString('allTasks') as String);
      allTasks.remove(task);
      allTasks.insert(
          0,
          task.copyWith(
            isDeleted: false,
            isDone: task.isDone,
            isFavorite: task.isFavorite,
          ));
    } catch (e) {
      print("Error in RESTORE ing task!");
      print(e);
    }
    sharedPreferences!.setString('allTasks', Task.toJson(allTasks));
  }

  static void deleteAllTasks() {
    try {
      allTasks =
          Task.fromJson(sharedPreferences!.getString('allTasks') as String);
      for (Task t in allTasks) {
        if (t.isDeleted == true) {
          allTasks.remove(t);
        }
      }
    } catch (e) {
      print("Error in DELETE_ALL ing task!");
      print(e);
    }
    sharedPreferences!.setString('allTasks', Task.toJson(allTasks));
  }

  static List<Task> getTasks() {
    try {
      allTasks =
          Task.fromJson(sharedPreferences!.getString('allTasks') as String);
    } catch (e) {
      print("Error in GETTING ALL task!");
      print(e);
    }
    return allTasks;
  }
}
