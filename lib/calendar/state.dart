import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'util.dart';

final pickedDateProvider = StateNotifierProvider<PickedDateNotifier>(
    (ref) => new PickedDateNotifier());

class PickedDateNotifier extends StateNotifier<DateTime> {
  PickedDateNotifier() : super(removeTime(DateTime.now()));

  void setDate(DateTime d) {
    state = removeTime(d);
  }
}
