import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedDateViewModel extends Notifier<DateTime> {
  @override
  DateTime build() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  void selectDate(DateTime date) {
    state = DateTime(date.year, date.month, date.day);
  }
}
