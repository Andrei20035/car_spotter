
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentDayPostProvider extends StateNotifier<int> {
  CurrentDayPostProvider() : super(0);

  void setPage(int index) {
    state = index;
  }
}

final currentDayPostProvider = StateNotifierProvider<CurrentDayPostProvider, int>((ref) {
  return CurrentDayPostProvider();
});