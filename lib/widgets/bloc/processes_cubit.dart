import 'package:echse_frontend/models/process_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/prcoess_repository.dart';

abstract class ProcessesState {
  final ProcessRepository repository;

  ProcessesState(this.repository);
}

class ProcessesStateLoading extends ProcessesState {
  ProcessesStateLoading(super.repository);
}
class ProcessesStateLoaded extends ProcessesState {
  final List<ProcessModel> processes;
  ProcessesStateLoaded(super.repository, {required this.processes});
}

class ProcessesCubit extends Cubit<ProcessesState> {
  ProcessesCubit(super.initialState);


  Future<void> initialize() async {
    final processes = await state.repository.getProcesses();
    processes.sort((a, b) => b.duration.compareTo(a.duration),);
    emit(ProcessesStateLoaded(state.repository, processes: processes));
  }

  Future<void> refresh() async {
    emit(ProcessesStateLoading(state.repository));
    await initialize();
  }
}