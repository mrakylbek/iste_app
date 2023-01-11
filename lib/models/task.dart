// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDeleted;
  bool? isDone;
  bool? isFavorite;

  Task({
    required this.title,
    required this.description,
    required this.id,
    required this.date,
    this.isDeleted,
    this.isDone,
    this.isFavorite,
  }) {
    isDeleted = isDeleted ?? false;
    isDone = isDone ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? id,
    String? date,
    bool? isDeleted,
    bool? isDone,
    bool? isFavorite,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      date: date ?? this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      isDone: isDone ?? this.isDone,
      isFavorite: isFavorite ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
      'date': date,
      'isDeleted': isDeleted,
      'isDone': isDone,
      'isFavorite': isFavorite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      date: map['date'] as String,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        id,
        date,
        isDeleted,
        isDone,
        isFavorite,
      ];

  static String toJson(List<Task> tasks) => json.encode(
        tasks.map<Map<String, dynamic>>((task) => task.toMap()).toList(),
      );

  static List<Task> fromJson(String source) =>
      (json.decode(source) as List<dynamic>)
          .map<Task>((e) => Task.fromMap(e))
          .toList();
}
