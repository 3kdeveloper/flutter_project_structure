import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/repository/data_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.dataManager}) : super(const HomeState()) {
    on<HomeEvent>((event, emit) {});
  }

  final DataManager dataManager;
}
