// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../locator.dart';
import '../../modules/home/home.dart';
import '../../modules/news/page/logic/cubit/news_info_cubit.dart';
import '../../modules/vet/page/logic/cubit/news_info_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InfoAboutAppCubit>(
          create: (context) => sl<InfoAboutAppCubit>(),
        ),
        BlocProvider<InfoNewsCubit>(
          create: (context) => sl<InfoNewsCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
