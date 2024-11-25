import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_ninja/view/screens/homePageSections/filterScreen/sort_button.dart';
import 'package:food_ninja/view/screens/homePageSections/main_home_sec.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  GlobalKey<FormState> searchKey = GlobalKey();
  TextEditingController search = TextEditingController();

  List<String> type = ['Restaurant', 'Menu'];
  List<String> location = [
    '1 Km',
    '>10 Km',
    '<10 Km',
  ];
  List<String> food = [
    'Cake',
    'Soup',
    'Main Course',
    'Appetizer',
    'Dessert',
  ];

  Widget currentHomeSection = const MainHomeSec();

  void changeHomeSection(Widget newSection) {
    emit(SearchLoading());
    currentHomeSection = newSection;
    emit(ChangeHomeSectionState());
  }

  void filterButtonPressed() {
    emit(FilterLoadingState());
  }

  void filterSuccess() {
    emit(FilterSuccessState());
  }

  List<SortButton> getSortButtons(String buttonCategory) {
    List<SortButton> buttons = [];
    if (buttonCategory == 'type') {
      for (var i in type) {
        buttons.add(SortButton(sortingType: i));
      }
    } else if (buttonCategory == 'Location') {
      for (var i in location) {
        buttons.add(SortButton(sortingType: i));
      }
    } else {
      for (var i in food) {
        buttons.add(SortButton(sortingType: i));
      }
    }
    return buttons;
  }
}
