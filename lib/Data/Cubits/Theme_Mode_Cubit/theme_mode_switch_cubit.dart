import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_mode_switch_state.dart';

class ThemeModeSwitchCubit extends Cubit<bool> {
  ThemeModeSwitchCubit() : super(false);
  void isSwitched() => emit(!state);
}
