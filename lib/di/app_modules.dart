import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/main/app_view_model.dart';

ChangeNotifierProvider<AppViewModel> appViewModelProvider =
    ChangeNotifierProvider<AppViewModel>(
  (ref) => AppViewModel(),
);