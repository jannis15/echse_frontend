import 'package:echse_frontend/widgets/bloc/processes_cubit.dart';
import 'package:echse_frontend/widgets/bloc/repository_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/prcoess_repository.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff325d9e), brightness: Brightness.light)),
        darkTheme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff325d9e), brightness: Brightness.dark)),
        title: 'Demo',
        home: RepositoryProvider<RepositoryCubit>(
            create: (context) => RepositoryCubit(ProcessRepository()),
            child: BlocProvider<ProcessesCubit>(
                create: (context) => ProcessesCubit(ProcessesStateLoading(context.read<RepositoryCubit>().state))..initialize(),
                child: BlocBuilder<ProcessesCubit, ProcessesState>(builder: (context, state) {
                  if (state is ProcessesStateLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ProcessesStateLoaded) {
                    return Scaffold(
                      body: SafeArea(
                          child: ListView.builder(
                              itemCount: state.processes.length,
                              itemBuilder: (context, index) {
                                final process = state.processes[index];
                                return Card(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      process.icon.isNotEmpty? Image.memory(process.icon,width: 32,height: 32,):const SizedBox(),
                                      Text(process.name),
                                      Text('Dauer (Minuten): ${process.duration}')
                                    ],
                                  ),
                                );
                              })),
                    );
                  } else {
                    return const Center(
                      child: Text("An unexpected error occured!"),
                    );
                  }
                }))));
  }
}
