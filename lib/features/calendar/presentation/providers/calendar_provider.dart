import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/calendar_local_datasource.dart';
import '../../data/repositories/calendar_repository_impl.dart';
import '../../domain/repositories/calendar_repository.dart';
import '../../domain/usecases/get_daily_missions.dart';
import '../states/calendar_state.dart';
import '../viewmodels/calendar_viewmodel.dart';
import '../viewmodels/selected_date_viewmodel.dart';

final calendarLocalDatasourceProvider = Provider<CalendarLocalDatasourceImpl>((
  ref,
) {
  return CalendarLocalDatasourceImpl();
});

final calendarRepositoryProvider = Provider<CalendarRepository>((ref) {
  final datasource = ref.watch(calendarLocalDatasourceProvider);
  return CalendarRepositoryImpl(datasource);
});

final getDailyMissionsUseCaseProvider = Provider<GetDailyMissions>((ref) {
  final repository = ref.watch(calendarRepositoryProvider);
  return GetDailyMissions(repository);
});

final calendarViewModelProvider =
    AsyncNotifierProvider<CalendarViewModel, CalendarState>(() {
      return CalendarViewModel();
    });

final selectedDateViewModelProvider =
    NotifierProvider<SelectedDateViewModel, DateTime>(() {
      return SelectedDateViewModel();
    });


