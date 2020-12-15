import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'util.dart';

final pickedDateProvider =
    StateProvider<DateTime>((ref) => removeTime(DateTime.now()));
