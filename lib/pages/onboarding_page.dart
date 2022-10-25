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
        alignment: Alignment.center,
        color: Colors.blue,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                child: Column(
                  children: [
                    Text(
                      'Symphonear',
                      style: TextStyle(fontSize: 32),
                    ),
                    Text(
                      'Music in web3 with NEAR',
                      style: TextStyle(fontSize: 32),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Experience decentralized music.\nA service thought for Artists and users in web3',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        enabledMouseCursor: SystemMouseCursors.click,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Connect your wallet',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.deepOrange,
                child: Text('Onboarding Page'),
              ),
            ),
          ],
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
