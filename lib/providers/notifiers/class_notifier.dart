// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lla/models/class.dart';

class ClassNoteState {
  final int currentIndex;
  final List<ClassNotes> notes;

  ClassNoteState(this.currentIndex, this.notes);

  ClassNoteState copyWith({
    int? currentIndex,
    List<ClassNotes>? notes,
  }) {
    return ClassNoteState(
      currentIndex ?? this.currentIndex,
      notes ?? this.notes,
    );
  }
}

class ClassNotifier extends StateNotifier<ClassNoteState> {
  ClassNotifier() : super(ClassNoteState(0, []));

  getNotes(String language) async {
    state = ClassNoteState(0, []);
    final jsonString = await rootBundle.loadString('classroom.json');
    final decodedJson = json.decode(jsonString);
    final notesList = (decodedJson['notes'] as List)
        .map((e) => ClassNotes.fromMap(e, language))
        .toList();
    state = ClassNoteState(0, notesList);
  }

  goToNext() {
    final newIndex = state.currentIndex + 1;
    state = state.copyWith(currentIndex: newIndex);
  }

  goToPrevious() {
    final newIndex = state.currentIndex - 1;
    state = state.copyWith(currentIndex: newIndex);
  }
}
