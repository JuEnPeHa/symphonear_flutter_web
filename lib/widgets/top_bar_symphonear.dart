import 'package:flutter/material.dart';
import 'package:symphonear_flutter_web/pages/onboarding_page.dart';

class TopBarSymphonear extends StatelessWidget {
  final double opacity;
  const TopBarSymphonear({
    required this.opacity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.grey.shade300.withOpacity(opacity),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.music_note_outlined,
                      size: 30,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.av_timer, color: Colors.black),
                      SizedBox(width: 2),
                      Text('0D 0H 00:00',
                          style: TextStyle(color: Colors.black)),
                      SizedBox(width: 8),
                      Icon(Icons.monetization_on, color: Colors.black),
                      SizedBox(width: 2),
                      Text('0 USDC', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                // Row(
                //   children: appBarButtons
                //       .map((e) => Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: InkWell(
                //               onTap: () {},
                //               child: Text(e.title,
                //                   style: TextStyle(
                //                       fontSize: 20,
                //                       fontWeight: FontWeight.bold)),
                //             ),
                //           ))
                //       .toList(),
                // ),
                Expanded(
                  flex: 13,
                  child: TopBarSymphonearRightButtons(),
                ),
              ],
            )),
      ),
      // child: AppBar(
      //   backgroundColor: Colors.grey.shade300,
      //   title: Row(
      //     children: const [
      //       Icon(Icons.av_timer, color: Colors.black),
      //       SizedBox(width: 4),
      //       Text('0D 0H 00:00', style: TextStyle(color: Colors.black)),
      //       SizedBox(width: 16),
      //       Icon(Icons.monetization_on, color: Colors.black),
      //       SizedBox(width: 4),
      //       Text('0 USDC', style: TextStyle(color: Colors.black)),
      //       Spacer(),
      //     ],
      //   ),
      //   titleSpacing: 0.0,
      //   centerTitle: true,
      //   toolbarHeight: AdaptiveTextSize().getadaptiveTextSize(
      //     context,
      //     100,
      //   ),
      //   actions: [
      //     for (final AppBarButton appBarButton in appBarButtons)
      //       Container(
      //         color: Colors.brown,
      //         child: CupertinoButton(
      //           padding: EdgeInsets.symmetric(
      //             horizontal: AdaptiveTextSize().getadaptiveTextSize(
      //               context,
      //               16,
      //             ),
      //           ),
      //           child: Text(
      //             appBarButton.title,
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize:
      //                   AdaptiveTextSize().getadaptiveTextSize(context, 14),
      //             ),
      //           ),
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (BuildContext context) => appBarButton.route,
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //   ],
      //   leading: IconButton(
      //       onPressed: () {
      //         print("Onboarding Page");
      //       },
      //       icon: Icon(Icons.music_note, color: Colors.black)),
      // ),
    );
  }
}

class TopBarSymphonearRightButtons extends StatefulWidget {
  final MainAxisAlignment mainAxisAlignment;
  const TopBarSymphonearRightButtons({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  State<TopBarSymphonearRightButtons> createState() =>
      _TopBarSymphonearRightButtonsState();
}

class _TopBarSymphonearRightButtonsState
    extends State<TopBarSymphonearRightButtons> {
  final List<bool> _isHovering =
      List.generate(appBarButtons.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'topBarRightButtons',
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: appBarButtons.map((AppBarButton appBarButton) {
            return InkWell(
              onHover: (value) {
                setState(() {
                  _isHovering[appBarButtons.indexOf(appBarButton)] = value;
                });
              },
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => appBarButton.route,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      appBarButton.title,
                      style: TextStyle(
                        color: _isHovering[appBarButtons.indexOf(appBarButton)]
                            ? Colors.grey
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    // if (_isHovering[
                    //     appBarButtons.indexOf(appBarButton)])
                    //   Container(
                    //     height: 2,
                    //     width: 20,
                    //     color: Colors.black,
                    //   ),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[appBarButtons.indexOf(appBarButton)],
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 2,
                        width: 20,
                        // color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
