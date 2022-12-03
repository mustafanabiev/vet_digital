import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/theme/theme.dart';
import '../../information.dart';


class MenuList extends StatelessWidget {
  const MenuList(this.items, {super.key});

  final List<InfoMenu> items;
  // final List<InfoSubMenu> infoSubItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final info = items[index];

        return InkWell(
          onTap: () async {
            
            if (info.isInfo) {

              // ignore: use_build_context_synchronously
              await Navigator.push(
                context,
                // ignore: inference_failure_on_instance_creation
                MaterialPageRoute(
                  // builder: (context) => const InfoView(),
                  builder: (context) => InfoView(infoModel: info.infoModel!),
                ),
              );

            } else {
              await Navigator.push(
                context,
                // ignore: inference_failure_on_instance_creation
                MaterialPageRoute(
                  builder: (context) => SubMenuView(
                    infoSubMenuModel: info.infoSubMenu!,
                  ),
                ),
              );
            }
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            color: AppColors.mainColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(info.icon),
                const SizedBox(height: 13),
                Text(
                  info.title,
                  style: AppTextStyles.poppinsWhite15w400,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
