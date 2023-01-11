import '../../models/task.dart';

class TasksRepository {
  List<Task> pendingTasks = [];
  List<Task> completedTasks = [];
  List<Task> favoriteTasks = [];
  List<Task> removedTasks = [];

// moi
  void addTask(Task task){
    pendingTasks.add(task
          .copyWith(isDeleted: false, isFavorite: false, isDone: false));
    // removedTasks: state.removedTasks,
    // favoriteTasks: state.favoriteTasks,
    // completedTasks: state.completedTasks,
  }
  
  void updateTask(Task task){
    if (task.isDone == false) {
      if (task.isFavorite == false) {
        pendingTasks.remove(task);
        completedTasks.add(task.copyWith(isDone: true));
        // completedTasks.insert(0, task.copyWith(isDone: true));
      } else {
        var taskIndex = favoriteTasks.indexOf(task);
        pendingTasks.remove(task);
        completedTasks.add(task.copyWith(isDone: true, isFavorite: true));
        // completedTasks.insert(0, task.copyWith(isDone: true));
        favoriteTasks.remove(task)
          .insert(taskIndex, task.copyWith(isDone: true, isFavorite: true));
      }
    } else {
      if (task.isFavorite == false) {
        completedTasks.remove(task);
        pendingTasks.add(task.copyWith(isDone: false, isFavorite: false));
      } else {
        var taskIndex = favoriteTasks.indexOf(task);
        completedTasks.remove(task);
        pendingTasks.insert(0, task.copyWith(isDone: false, isFavorite: true));
        favoriteTasks.remove(task)
          .insert(taskIndex, task.copyWith(isDone: false, isFavorite: true));
      }
    }
  }

  void deleteTask(task){
    removedTasks: List.from(state.removedTasks)..remove(task);
  }

  void removeTask(task){
    pendingTasks.remove(task);
    completedTasks.remove(task),
    favoriteTasks.remove(task),
    removedTasks.add(task.copyWith(isDeleted: true));
  }

  void markFavoriteOrUnfavoriteTask(task){
    if (task.isDone == false) {
      if (task.isFavorite == false) {
        var taskIndex = pendingTasks.indexOf(task);
        pendingTasks
          ..remove(task)
          ..insert(
              taskIndex, task.copyWith(isFavorite: true, isDone: false));
        favoriteTasks.add(
            task.copyWith(
              isFavorite: true,
              isDeleted: false,
              isDone: false,
            ),
          );
      } else {
        var taskIndex = pendingTasks.indexOf(task);
        pendingTasks.remove(task)
          .insert(taskIndex, task.copyWith(isFavorite: false));
        favoriteTasks = List.from(pendingTasks)..remove(task);
      }
    } else {
      if (task.isFavorite == false) {
        var taskIndex = completedTasks.indexOf(task);
        completedTasks.remove(task)
          .insert(taskIndex, task.copyWith(isFavorite: true));
        favoriteTasks.add(
            task.copyWith(
              isFavorite: true,
              isDeleted: false,
              isDone: true,
            ),
          );
      } else {
        var taskIndex = completedTasks.indexOf(task);
        completedTasks.remove(task)
          .insert(taskIndex, task.copyWith(isFavorite: false));
        favoriteTasks.remove(task);
      }
    }
  }

  void editTask(oldtask, newtask){
    if (oldtask.isFavorite == true) {
      favoriteTasks
        ..remove(oldtask)
        ..insert(0, newtask);
    }
    if (oldtask.isDone == true) {
      completedTasks.remove(oldtask);
    }
    pendingTasks
          ..remove(oldtask)
          ..insert(0, newtask);
  }
  void restoreTask(task){
    removedTasks.remove(task),
    pendingTasks.insert(
          0,
          task.copyWith(
            isDeleted: false,
            isDone: false,
            isFavorite: false,
          )),
  }
  
  void deleteAllTasks(){
    removedTasks.clear();
  }



  List<Task> getPendingTasks(){
    return pendingTasks;
  }

  List<Task> getCompletedTasks(){
    return completedTasks;
  }

  List<Task> getRemovedTasks(){
    return removedTasks;
  }

  List<Task> getFavoriteTasks(){
    return favoriteTasks;
  }


}
