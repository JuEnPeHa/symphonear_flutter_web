import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

final List<AppBarButton> appBarButtons = [
  AppBarButton(
    title: 'About',
    // icon: Icons.music_note,
    route: Container(),
  ),
  AppBarButton(
    title: 'Support',
    // icon: Icons.music_note,
    route: Container(),
  ),
  AppBarButton(
    title: 'Login',
    // icon: Icons.music_note,
    route: Container(),
  ),
];

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Row(
          children: const [
            Icon(Icons.av_timer, color: Colors.black),
            SizedBox(width: 4),
            Text('0D 0H 00:00', style: TextStyle(color: Colors.black)),
            SizedBox(width: 16),
            Icon(Icons.monetization_on, color: Colors.black),
            SizedBox(width: 4),
            Text('0 USDC', style: TextStyle(color: Colors.black)),
            Spacer(),
          ],
        ),
        titleSpacing: 0.0,
        centerTitle: true,
        actions: [
          for (final AppBarButton appBarButton in appBarButtons)
            CupertinoButton(
              child: Text(
                appBarButton.title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => appBarButton.route,
                  ),
                );
              },
            ),
        ],
        leading: IconButton(
            onPressed: () {
              print("Onboarding Page");
            },
            icon: Icon(Icons.music_note, color: Colors.black)),
      ),
      body: Container(
        color: Colors.blue,
        child: const Center(
          child: Text('Onboarding Page'),
        ),
      ),
    );
  }
}

class AppBarButton {
  final String title;
  // final IconData icon;
  final Widget route;

  const AppBarButton({
    required this.title,
    // required this.icon,
    required this.route,
  });
}
