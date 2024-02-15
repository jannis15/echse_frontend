import 'package:echse_frontend/config/constants.dart';
import 'package:echse_frontend/config/global_service.dart';
import 'package:echse_frontend/utils/tools/duration_formatter.dart';
import 'package:echse_frontend/widgets/bloc/processes_cubit.dart';
import 'package:echse_frontend/widgets/bloc/repository_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/prcoess_repository.dart';

const kIconSize = 64.0;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Widget buildDefaultAppIcon() => const SizedBox(
          width: kIconSize,
          height: kIconSize,
          child: Icon(
            Icons.wysiwyg,
            size: kIconSize - 16,
          ),
        );

    return MaterialApp(
        navigatorKey: GlobalService.globalKey,
        theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff325d9e), brightness: Brightness.light)),
        darkTheme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff325d9e), brightness: Brightness.dark)),
        debugShowCheckedModeBanner: false,
        title: 'Demo',
        home: RepositoryProvider<RepositoryCubit>(
            create: (context) => RepositoryCubit(ProcessRepository()),
            child: BlocProvider<ProcessesCubit>(
                create: (context) => ProcessesCubit(ProcessesLoading(context.read<RepositoryCubit>().state))..initialize(),
                child: BlocBuilder<ProcessesCubit, ProcessesState>(builder: (context, state) {
                  return Scaffold(
                    appBar: AppBar(
                        title: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Icon(FontAwesomeIcons.windows, color: Theme.of(context).colorScheme.primary),
                            const SizedBox(
                              width: AppSizes.kBigGap,
                            ),
                            const Flexible(
                              fit: FlexFit.loose,
                              child: Text('Aktivitäten'),
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton.icon(
                              label: const Text('Aktualisieren'),
                              onPressed: state is ProcessesLoading || state is ProcessesLoaded && state.isFetchingInBackground
                                  ? null
                                  : () {
                                      context.read<ProcessesCubit>().refresh();
                                    },
                              icon: const Icon(Icons.sync)),
                          const SizedBox(
                            width: AppSizes.kGap,
                          )
                        ]),
                    body: state is ProcessesLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : state is ProcessesLoaded
                            ? SafeArea(
                                child: ListView.separated(
                                    controller: _scrollController,
                                    separatorBuilder: (context, index) => const SizedBox(height: AppSizes.kGap),
                                    itemCount: state.processes.length,
                                    itemBuilder: (context, index) {
                                      final process = state.processes[index];
                                      int maxDuration =
                                          state.processes.map((obj) => obj.duration).reduce((value, element) => value > element ? value : element);
                                      return Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Container(
                                              width: 800,
                                              padding: const EdgeInsets.symmetric(horizontal: AppSizes.kBigGap, vertical: AppSizes.kGap),
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    titleAlignment: ListTileTitleAlignment.center,
                                                    leading: process.icon.isNotEmpty
                                                        ? Image.memory(
                                                            process.icon,
                                                            width: kIconSize,
                                                            height: kIconSize,
                                                            errorBuilder: (context, error, stackTrace) => buildDefaultAppIcon(),
                                                          )
                                                        : buildDefaultAppIcon(),
                                                    title: Flex(
                                                      direction: Axis.horizontal,
                                                      children: [
                                                        if (index == 0) ...[
                                                          const Icon(
                                                            FontAwesomeIcons.crown,
                                                            size: 16,
                                                          ),
                                                          const SizedBox(width: AppSizes.kGap),
                                                        ],
                                                        Flexible(
                                                          fit: FlexFit.loose,
                                                          child: Text(process.name, softWrap: false, overflow: TextOverflow.ellipsis),
                                                        ),
                                                      ],
                                                    ),
                                                    trailing: Text(formatDuration(process.duration), style: Theme.of(context).textTheme.bodyMedium),
                                                  ),
                                                  const SizedBox(
                                                    height: AppSizes.kBigGap,
                                                  ),
                                                  LinearProgressIndicator(
                                                    borderRadius: BorderRadius.circular(AppSizes.kDefaultBorderRadius),
                                                    value: process.duration / maxDuration,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              )
                            : const Center(
                                child: Text('Ein unerwarteter Fehler ist aufgetreten!'),
                              ),
                  );
                }))));
  }
}
