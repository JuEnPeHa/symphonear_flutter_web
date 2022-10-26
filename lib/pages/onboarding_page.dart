import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:symphonear_flutter_web/utils/neumorphism.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AdaptiveTextSize().getadaptiveTextSize(
          context,
          50,
        )),
        child: AppBar(
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
          toolbarHeight: AdaptiveTextSize().getadaptiveTextSize(
            context,
            100,
          ),
          actions: [
            for (final AppBarButton appBarButton in appBarButtons)
              Container(
                color: Colors.brown,
                child: CupertinoButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: AdaptiveTextSize().getadaptiveTextSize(
                      context,
                      16,
                    ),
                  ),
                  child: Text(
                    appBarButton.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 14),
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
              ),
          ],
          leading: IconButton(
              onPressed: () {
                print("Onboarding Page");
              },
              icon: Icon(Icons.music_note, color: Colors.black)),
        ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Symphonear',
                      style: TextStyle(
                        fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 32),
                      ),
                    ),
                    Text(
                      'Music in web3 with NEAR',
                      style: TextStyle(
                        fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 32),
                      ),
                    ),
                    SizedBox(
                      height:
                          AdaptiveTextSize().getadaptiveTextSize(context, 32),
                    ),
                    Text(
                      'Experience decentralized music.\nA service thought for Artists and users in web3',
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 16)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height:
                          AdaptiveTextSize().getadaptiveTextSize(context, 32),
                    ),
                    ElevatedButton(
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
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 16),
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white12,
                  child: MiniPreviewMusicReproductor().neumorphism(
                    blurRadius: 2.5,
                    spreadRadius: 2.5,
                  ),
                ),
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
  final Widget route;

  const AppBarButton({
    required this.title,
    required this.route,
  });
}

class MiniPreviewMusicReproductor extends StatelessWidget {
  const MiniPreviewMusicReproductor({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _width = _size.width * 0.2;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15.0),
      ),
      //color: Colors.yellow,
      width: _width,
      height: _width * 2.0,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Placeholder(),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text("Otra noche en Miami"),
                //SizedBox(height: 4),
                CustomSymphonearSlider(
                  onChanged: (value) {},
                ),
                // SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: _width * 0.115,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        iconSize: _width * 0.115,
                        onPressed: () {},
                        icon: Icon(
                          Icons.skip_previous,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: _width * 0.115,
                      backgroundColor: Colors.black,
                      child: Center(
                        child: IconButton(
                          iconSize: _width * 0.115,
                          onPressed: () {},
                          icon: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: _width * 0.115,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        iconSize: _width * 0.115,
                        onPressed: () {},
                        icon: Icon(
                          Icons.skip_next,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                //Two more buttons in a Row (repeat and shuffle)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: _width * 0.125,
                      onPressed: () {},
                      icon: Icon(
                        Icons.repeat,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      iconSize: _width * 0.125,
                      onPressed: () {},
                      icon: Icon(
                        Icons.shuffle,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSymphonearSlider extends StatefulWidget {
  final ValueChanged<double> onChanged;
  final int? value;
  final double min;
  final double max;
  final Color activeColor;
  final Color inactiveColor;
  var _currentSliderValue;
  CustomSymphonearSlider({
    super.key,
    required this.onChanged,
    this.value,
    this.min = 0.0,
    this.max = 200.0,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
  }) : _currentSliderValue = value ?? max / 3 * 2;
  @override
  State<CustomSymphonearSlider> createState() => _CustomSymphonearSliderState();
}

class _CustomSymphonearSliderState extends State<CustomSymphonearSlider> {
  @override
  Widget build(BuildContext context) {
    // double _currentSliderValue = widget.value?.toDouble() ?? 0.0;

    return SliderTheme(
      data: SliderThemeData(
        overlayShape: RoundSliderOverlayShape(overlayRadius: 5),
      ),
      child: Slider(
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return Colors.black54;
        }),
        min: widget.min,
        max: widget.max,
        value: widget._currentSliderValue,
        divisions: 40,
        //label: (widget._currentSliderValue * 10).round().toString(),
        activeColor: widget.activeColor,
        inactiveColor: widget.inactiveColor,
        onChanged: (double value) {
          setState(() {
            widget._currentSliderValue = value;
          });
        },
      ),
    );
  }
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 360) * MediaQuery.of(context).size.height;
  }
}
