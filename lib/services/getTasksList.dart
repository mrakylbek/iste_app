import 'package:flutter/material.dart';

import '../models/task.dart';

List<Task> getPendingTasks(List<Task> tasks) {
  List<Task> pen = [];
  for (Task task in tasks) {
    if (task.isDeleted == false && task.isDone == false) {
      pen.add(task);
    }
  }
  return pen;
}

List<Task> getCompletedTasks(List<Task> tasks) {
  List<Task> pen = [];
  for (Task task in tasks) {
    if (task.isDeleted == false && task.isDone == true) {
      pen.add(task);
    }
  }
  return pen;
}

List<Task> getFavouriteTasks(List<Task> tasks) {
  List<Task> pen = [];
  for (Task task in tasks) {
    if (task.isDeleted == false && task.isFavorite == true) {
      pen.add(task);
    }
  }
  return pen;
}

List<Task> getDeletedTasks(List<Task> tasks) {
  List<Task> pen = [];
  for (Task task in tasks) {
    if (task.isDeleted == true) {
      pen.add(task);
    }
  }
  return pen;
}
