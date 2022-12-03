import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vet_digital/src/app_constants/constants.dart';
import 'package:vet_digital/src/modules/information/page/logic/cubit/info_about_app_cubit.dart';

import '../../../../locator.dart';

class InfoAboutApp extends StatelessWidget {
  const InfoAboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfoAboutAppCubit(
        infoRepo: sl(),
      ),
      child: const InfoView(),
    );
  }
}

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  void getData() async {
    await context.read<InfoAboutAppCubit>().getAboutApp('ExzF8oqZreEirphd0pKV');
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<InfoAboutAppCubit, InfoAboutAppState>(
            builder: (context, state) {
              if (state is LoadingInfoAboutAppState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LoadedAboutAppState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      AppSpace.sized10,
                      Text(
                        '${state.documentName!.name}',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AppSpace.sized10,
                      Text(
                        '${state.documentName!.title}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      // SfPdfViewer.network(
                      //   infoModel.pdfLink,
                      //   canShowScrollHead: false,
                      //   canShowScrollStatus: false,
                      //   canShowPaginationDialog: false,
                      // ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text('Error'),
                );
              }
            },
          ),
        ),
      ),

      // body: SizedBox(
      //   width: double.infinity,
      //   height: context.height * 09,
      //   child: SfPdfViewer.network(info.pdfLink),
      // ),
    );
  }
}
