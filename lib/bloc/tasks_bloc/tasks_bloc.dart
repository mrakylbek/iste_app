import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_iste/data/cache_helper.dart';
// import '../../data/repository.dart';
import '../../models/task.dart';

import '../bloc_exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  // final TasksRepository tasksRepository;
  // final CacheHelper cacheHelper;
  // TasksBloc(this.tasksRepository)
  //     : super(TasksLoaded(
  //         // pendingTasks: tasksRepository.pendingTasks,
  //         // completedTasks: tasksRepository.completedTasks,
  //         // favoriteTasks: tasksRepository.favoriteTasks,
  //         // removedTasks: tasksRepository.removedTasks,
  //         pendingTasks: tasksRepository.getPendingTasks(),
  //         completedTasks: tasksRepository.getCompletedTasks(),
  //         favoriteTasks: tasksRepository.getFavoriteTasks(),
  //         removedTasks: tasksRepository.getRemovedTasks(),
  //       ))
  TasksBloc() : super(TasksLoaded(CacheHelper.getTasks())) {
    // TasksBloc(this.tasksRepository)
    //     : super(TasksLoaded(tasksRepository.allTasks)) {
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
    on<RemoveTask>(_onRemoveTask);
    on<MarkFavoriteOrUnfavorite>(_onMarkFavoriteOrUnfavoriteTask);
    on<EditTask>(_onEditTask);
    on<RestoreTask>(_onRestoreTask);
    on<DeleteAllTask>(_onDeleteAllTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    emit(TasksLoading());
    CacheHelper.addTask(task: event.task);
    emit(TasksLoaded(CacheHelper.getTasks()));

    // ////// with 1 list but from repository
    // emit(TasksLoading());
    // final List<Task> tasks = tasksRepository.addTask(event.task);
    // log('data: $tasks');
    // emit(TasksLoaded(tasks));

    //////with 4 lists
    // tasksRepository.addTask(event.task);
    // emit(
    //   TasksLoaded(
    //     // pendingTasks: tasksRepository.pendingTasks,
    //     // completedTasks: tasksRepository.completedTasks,
    //     // favoriteTasks: tasksRepository.favoriteTasks,
    //     // removedTasks: tasksRepository.removedTasks,
    //     pendingTasks: tasksRepository.getPendingTasks(),
    //     completedTasks: tasksRepository.getCompletedTasks(),
    //     favoriteTasks: tasksRepository.getFavoriteTasks(),
    //     removedTasks: tasksRepository.getRemovedTasks(),
    //   ),
    // );
    // print('object\nobject\nobject\nobject\n');
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    emit(TasksLoading());
    CacheHelper.updateTask(task: event.task);
    emit(TasksLoaded(CacheHelper.getTasks()));
    // ////// with 1 list but from repository
    // emit(TasksLoading());
    // final tasks = tasksRepository.updateTask(event.task);

    // emit(
    //   TasksLoaded(tasks),
    // );

    //////with 4 lists
    // tasksRepository.updateTask(event.task);
    // emit(
    //   TasksLoaded(
    //     pendingTasks: tasksRepository.pendingTasks,
    //     completedTasks: tasksRepository.completedTasks,
    //     favoriteTasks: tasksRepository.favoriteTasks,
    //     removedTasks: tasksRepository.removedTasks,
    //   ),
    // );
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    emit(TasksLoading());
    CacheHelper.deleteTask(task: event.task);
    emit(TasksLoaded(CacheHelper.getTasks()));

    // emit(TasksLoading());
    // final tasks = tasksRepository.deleteTask(event.task);

    // emit(
    //   TasksLoaded(tasks),
    // );

    // tasksRepository.deleteTask(event.task);

    // emit(
    //   TasksLoaded(
    //     pendingTasks: tasksRepository.pendingTasks,
    //     completedTasks: tasksRepository.completedTasks,
    //     favoriteTasks: tasksRepository.favoriteTasks,
    //     removedTasks: tasksRepository.removedTasks,
    //   ),
    // );
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    emit(TasksLoading());
    CacheHelper.removeTask(task: event.task);
    emit(TasksLoaded(CacheHelper.getTasks()));

    // emit(TasksLoading());
    // final tasks = tasksRepository.removeTask(event.task);

    // emit(
    //   TasksLoaded(tasks),
    // );

    // tasksRepository.removeTask(event.task);

    // emit(
    //   TasksLoaded(
    //     pendingTasks: tasksRepository.pendingTasks,
    //     completedTasks: tasksRepository.completedTasks,
    //     favoriteTasks: tasksRepository.favoriteTasks,
    //     removedTasks: tasksRepository.removedTasks,
    //   ),
    // );
  }

  void _onMarkFavoriteOrUnfavoriteTask(
      MarkFavoriteOrUnfavorite event, Emitter<TasksState> emit) {
    emit(TasksLoading());
    CacheHelper.markFavoriteOrUnfavoriteTask(task: event.task);
    emit(TasksLoaded(CacheHelper.getTasks()));

    // emit(TasksLoading());
    // final tasks = tasksRepository.markFavoriteOrUnfavoriteTask(event.task);

    // emit(
    //   TasksLoaded(tasks),
    // );

    // tasksRepository.markFavoriteOrUnfavoriteTask(event.task);

    // emit(
    //   TasksLoaded(
    //     pendingTasks: tasksRepository.pendingTasks,
    //     completedTasks: tasksRepository.completedTasks,
    //     favoriteTasks: tasksRepository.favoriteTasks,
    //     removedTasks: tasksRepository.removedTasks,
    //   ),
    // );
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) {
    emit(TasksLoading());
    CacheHelper.editTask(oldtask: event.oldtask, newtask: event.newtask);
    emit(TasksLoaded(CacheHelper.getTasks()));

    // emit(TasksLoading());
    // final tasks = tasksRepository.editTask(event.oldtask, event.newtask);

    // emit(
    //   TasksLoaded(tasks),
    // );

    // tasksRepository.editTask(event.oldtask, event.newtask);

    // emit(
    //   TasksLoaded(
    //     pendingTasks: tasksRepository.pendingTasks,
    //     completedTasks: tasksRepository.completedTasks,
    //     favoriteTasks: tasksRepository.favoriteTasks,
    //     removedTasks: tasksRepository.removedTasks,
    //   ),
    // );
  }

  void _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    emit(TasksLoading());
    CacheHelper.restoreTask(task: event.task);
    emit(TasksLoaded(CacheHelper.getTasks()));

    // emit(TasksLoading());
    // final tasks = tasksRepository.restoreTask(event.task);

    // emit(
    //   TasksLoaded(tasks),
    // );

    // tasksRepository.restoreTask(event.task);

    // emit(
    //   TasksLoaded(
    //     pendingTasks: tasksRepository.pendingTasks,
    //     completedTasks: tasksRepository.completedTasks,
    //     favoriteTasks: tasksRepository.favoriteTasks,
    //     removedTasks: tasksRepository.removedTasks,
    //   ),
    // );
  }

  void _onDeleteAllTask(DeleteAllTask event, Emitter<TasksState> emit) {
    emit(TasksLoading());
    CacheHelper.deleteAllTasks();
    emit(TasksLoaded(CacheHelper.getTasks()));

    // emit(TasksLoading());
    // final tasks = tasksRepository.deleteAllTasks();

    // emit(
    //   TasksLoaded(tasks),
    // );

    // tasksRepository.deleteAllTasks();

    // emit(
    //   TasksLoaded(
    //     pendingTasks: tasksRepository.pendingTasks,
    //     completedTasks: tasksRepository.completedTasks,
    //     favoriteTasks: tasksRepository.favoriteTasks,
    //     removedTasks: tasksRepository.removedTasks,
    //   ),
    // );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    // return TasksState.fromMap(json);

    try {
      final allTasks = (json['allTasks'] as List)
          .map<Task>((x) => Task.fromMap(x as Map<String, dynamic>))
          .toList();
      // tasksRepository.allTasks = allTasks;

      // log('data: $allTasks');
      return TasksLoaded(CacheHelper.getTasks());

      // final pendingTasks = (json['pendingTasks'] as List)
      //     .map<Task>((x) => Task.fromMap(x as Map<String, dynamic>))
      //     .toList();

      // final completedTasks = (json['completedTasks'] as List)
      //     .map<Task>((x) => Task.fromMap(x as Map<String, dynamic>))
      //     .toList();

      // final favoriteTasks = (json['favoriteTasks'] as List)
      //     .map<Task>((x) => Task.fromMap(x as Map<String, dynamic>))
      //     .toList();

      // final removedTasks = (json['removedTasks'] as List)
      //     .map<Task>((x) => Task.fromMap(x as Map<String, dynamic>))
      //     .toList();

      // tasksRepository.completedTasks = completedTasks;
      // tasksRepository.pendingTasks = pendingTasks;
      // tasksRepository.favoriteTasks = favoriteTasks;
      // tasksRepository.removedTasks = removedTasks;

      // return TasksLoaded(
      //     pendingTasks: pendingTasks,
      //     completedTasks: completedTasks,
      //     favoriteTasks: favoriteTasks,
      //     removedTasks: removedTasks);
    } catch (e) {
      // print("Kate\nKate\nKate\nKate\nKate\nKate\n");
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    if (state is TasksLoaded) {
      return state.toJson();
    } else {
      return null;
    }
  }
}
