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
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      date: map['date'] ?? '',
      isDeleted: map['isDeleted'],
      isDone: map['isDone'],
      isFavorite: map['isFavorite'],
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
}
