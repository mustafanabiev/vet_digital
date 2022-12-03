import 'package:flutter/material.dart';
import 'package:vet_digital/src/app/theme/theme.dart';
import 'package:vet_digital/src/app_constants/constants.dart';

import '../widgets/connection_widgets.dart';

class ConnectionView extends StatelessWidget {
  const ConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/icons/logo1.png',
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                AppBottomSheet.show(
                  context: context,
                  child: const TextField(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                fixedSize: const Size(307, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                AppString.baylanishuu,
                textAlign: TextAlign.center,
                style: AppTextStyles.poppinsWhite17w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
