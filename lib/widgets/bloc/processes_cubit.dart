import 'dart:async';

import 'package:echse_frontend/models/process_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/prcoess_repository.dart';

abstract class ProcessesState {
  final ProcessRepository repository;

  ProcessesState(this.repository);
}

class ProcessesLoading extends ProcessesState {
  ProcessesLoading(super.repository);
}

class ProcessesLoaded extends ProcessesState {
  final List<ProcessModel> processes;
  final bool isFetchingInBackground;

  ProcessesLoaded(super.repository, {required this.processes, required this.isFetchingInBackground});
}

class ProcessesCubit extends Cubit<ProcessesState> {
  ProcessesCubit(super.initialState);

  Timer? _timer;

  Future<void> initialize() async {
    final processes = await state.repository.getProcesses();
    emit(ProcessesLoaded(state.repository, processes: processes, isFetchingInBackground: false));
    _startRefreshTimer();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void _startRefreshTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      refresh();
    });
  }

  Future<void> refresh() async {
    if (state is ProcessesLoaded) {
      final loadedState = state as ProcessesLoaded;
      if (!loadedState.isFetchingInBackground) {
        emit(ProcessesLoaded(loadedState.repository, processes: loadedState.processes, isFetchingInBackground: true));
        await initialize();
      }
    }
  }
}
