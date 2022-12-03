import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => InfoCubit()..fetData(),
      child: const MenuView(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
