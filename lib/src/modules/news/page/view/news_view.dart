import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vet_digital/src/modules/vet/page/logic/cubit/news_info_cubit.dart';

import '../../../../utils/components/components.dart';
import '../widgets/new_list.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InfoAboutAppCubit, InfoAboutAppState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedKatalogState) {
            return NewsList(state.items!);
          } else {
            return const FetchUnkNown();
          }
        },
      ),
      // body: BlocBuilder<NewsCubit, NewsState>(
      //   builder: (context, state) {
      //     if (state.status == FetchStatus.initial) {
      //       return const FetchInitialWidget();
      //     } else if (state.status == FetchStatus.loading) {
      //       return const FetchLoadingWidget();
      //     } else if (state.items != null) {
      //       return NewsList(state.items ?? []);
      //     } else if (state.status == FetchStatus.error) {
      //       return const FetchErrorWidget();
      //     } else {
      //       return const FetchUnkNown();
      //     }
      //   },
      // ),
    );
  }
}
