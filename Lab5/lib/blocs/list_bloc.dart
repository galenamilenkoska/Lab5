import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "../model/list_item.dart";
import "list_event.dart";
import "list_state.dart";

class ListBloc extends Bloc<ListEvent, ListState> {
  List<ListItem> _elements;

  ListBloc() : super(ListInitState()) {
    on<ListInitializedEvent>((event, emit) {
      this._elements = [
        ListItem(
          id: "T1",
          naslov: "Test 1",
          datum: DateTime(2023, 8, 22),
          vreme: TimeOfDay(hour: 10, minute: 30),
        ),
        ListItem(
          id: "T2",
          naslov: "Test 2",
          datum: DateTime(2023, 8, 23),
          vreme: TimeOfDay(hour: 14, minute: 0),
        ),
      ];
      ListInitState state = ListInitState();
      state.elements = this._elements;
      emit(state);
    });
    on<ListElementAddedEvent>((event, emit) {
      this._elements.add(event.element);
      emit(ListElementsState(elements: this._elements));
    });
    on<ListElementDeletedEvent>((event, emit) {
      this._elements.removeWhere((p) => p.id == event.id);
      if (this._elements.length > 0) {
        emit(ListElementsState(elements: this._elements));
      } else {
        emit(ListEmptyState());
      }
    });
  }
}
