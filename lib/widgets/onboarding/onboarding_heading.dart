import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:symphonear_flutter_web/widgets/responsive_widget.dart';

class OnboardingHeadingSymphonear extends StatelessWidget {
  final Size screenSize;
  const OnboardingHeadingSymphonear({
    super.key,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            padding: EdgeInsets.only(
              top: screenSize.height / 10,
              bottom: screenSize.height / 25,
            ),
            width: screenSize.width,
            // color: Colors.black,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      style: TextStyle(
                        fontSize: 24 / 6 * 5,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Symphonear',
                        ),
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                          text: 'Music in web3 with NEAR',
                        )
                      ]),
                ),
                SizedBox(
                  height: screenSize.height / 20,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      style: TextStyle(
                        fontSize: 24 / 6 * 5,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                      ),
                      children: [
                        TextSpan(
                          text: 'Experience decentralized music',
                        ),
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                          text:
                              'A service thought for Artists and users in web3',
                        )
                      ]),
                ),
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.only(
              top: screenSize.height / 10,
              bottom: screenSize.height / 20,
            ),
            width: screenSize.width,
            // color: Colors.black,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 40 / 6 * 5,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Symphonear',
                      ),
                      TextSpan(
                        text: '\n',
                      ),
                      TextSpan(
                        text: 'Music in web3 with NEAR',
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height / 20,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 24 / 6 * 5,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                    ),
                    children: [
                      TextSpan(
                        text: 'Experience decentralized music',
                      ),
                      TextSpan(
                        text: '\n',
                      ),
                      TextSpan(
                        text: 'A service thought for Artists and users in web3',
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
