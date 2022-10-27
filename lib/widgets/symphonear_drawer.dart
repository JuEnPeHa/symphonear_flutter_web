import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:symphonear_flutter_web/pages/onboarding_page.dart';

class SymphonearDrawer extends StatelessWidget {
  const SymphonearDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<bool> _isHovering =
    //     List.generate(appBarButtons.length, (index) => false);
    return Drawer(
      child: Container(
        color: Colors.grey.shade300,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.music_note_outlined,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: Column(
                  children: appBarButtons.map((AppBarButton appBarButton) {
                    return InkWell(
                      // onHover: (value) {
                      //   setState(() {
                      //     _isHovering[appBarButtons.indexOf(appBarButton)] =
                      //         value;
                      //   });
                      // },
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              appBarButton.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                )),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.av_timer, color: Colors.black),
                      SizedBox(height: 4),
                      Text('0D 0H 00:00',
                          style: TextStyle(color: Colors.black)),
                      SizedBox(height: 16),
                      Icon(Icons.monetization_on, color: Colors.black),
                      SizedBox(height: 4),
                      Text('0 USDC', style: TextStyle(color: Colors.black)),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
