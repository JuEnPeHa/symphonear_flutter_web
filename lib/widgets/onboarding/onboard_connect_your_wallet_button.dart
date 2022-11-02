import 'package:flutter/material.dart';
import 'package:symphonear_flutter_web/widgets/responsive_widget.dart';

class OnboardingConnectYourWalletButton extends StatelessWidget {
  const OnboardingConnectYourWalletButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: ResponsiveWidget.isSmallScreen(context)
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                enabledMouseCursor: SystemMouseCursors.click,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                backgroundColor: Colors.grey.shade500,
              ),
              onPressed: () {},
              child: Text(
                'Connect your wallet',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                enabledMouseCursor: SystemMouseCursors.click,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                backgroundColor: Colors.grey.shade500,
              ),
              onPressed: () {},
              child: Text(
                'Connect your wallet',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
