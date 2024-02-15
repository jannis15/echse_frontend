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

  Future<void> initialize() async {
    final processes = await state.repository.getProcesses();
    processes.sort(
      (a, b) => b.duration.compareTo(a.duration),
    );
    emit(ProcessesLoaded(state.repository, processes: processes, isFetchingInBackground: false));
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
