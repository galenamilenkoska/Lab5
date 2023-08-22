import '../model/list_item.dart';

abstract class ListState {}

class ListInitState extends ListElementsState {
  ListInitState() {
    this.elements = [];
  }
}

class ListEmptyState extends ListState {}

class ListElementsState extends ListState {
  List<ListItem> elements;
  ListElementsState({this.elements});
}

class ListError extends ListState {
  final error;
  ListError({this.error});
}
