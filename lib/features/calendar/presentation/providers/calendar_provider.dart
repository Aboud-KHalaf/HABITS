import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/calendar_state.dart';
import '../viewmodels/calendar_viewmodel.dart';
import '../viewmodels/selected_date_viewmodel.dart';

final calendarViewModelProvider = NotifierProvider<CalendarViewModel, CalendarState>(() {
  return CalendarViewModel();
});

final selectedDateViewModelProvider = NotifierProvider<SelectedDateViewModel, DateTime>(() {
  return SelectedDateViewModel();
});
