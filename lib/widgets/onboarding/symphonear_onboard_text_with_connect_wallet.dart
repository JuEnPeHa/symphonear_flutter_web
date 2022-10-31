import 'package:flutter/material.dart';
import 'package:symphonear_flutter_web/widgets/onboarding/onboard_connect_your_wallet_button.dart';
import 'package:symphonear_flutter_web/widgets/onboarding/onboarding_heading.dart';

class SymphonearOnboardTextWithConnectWallet extends StatelessWidget {
  final Size screenSize;
  const SymphonearOnboardTextWithConnectWallet({
    super.key,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      // color: Colors.red.shade300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnboardingHeadingSymphonear(screenSize: screenSize),
          SizedBox(
            height: screenSize.height * 0.025,
          ),
          const OnboardingConnectYourWalletButton()
        ],
      ),
    );
  }
}
