import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:symphonear_flutter_web/pages/library_page.dart';
import 'package:symphonear_flutter_web/utils/neumorphism.dart';
import 'package:symphonear_flutter_web/widgets/onboarding/symphonear_onboard_text_with_connect_wallet.dart';
import 'package:symphonear_flutter_web/widgets/responsive_widget.dart';
import 'package:symphonear_flutter_web/widgets/symphonear_drawer.dart';
import 'package:symphonear_flutter_web/widgets/top_bar_symphonear.dart';
import 'package:symphonear_flutter_web/widgets/web_scrollbar.dart';

final List<DrawerLibraryButton> drawerLibraryButtons = [
  DrawerLibraryButton(
    title: 'Home',
    icon: Icons.house,
    route: Container(),
  ),
  DrawerLibraryButton(
    title: 'Search',
    icon: Icons.search,
    route: Container(),
  ),
  DrawerLibraryButton(
    title: 'Albums',
    icon: Icons.view_carousel,
    route: Container(),
  ),
  DrawerLibraryButton(
    title: 'Alice.near',
    icon: Icons.person,
    route: Container(),
  ),
];

final List<AppBarButton> appBarButtons = [
  AppBarButton(
    title: 'How To',
    // icon: Icons.music_note,
    route: Container(),
  ),
  AppBarButton(
    title: 'DAOs',
    // icon: Icons.music_note,
    route: Container(),
  ),
  AppBarButton(
    title: 'Artists',
    // icon: Icons.music_note,
    route: Container(),
  ),
  const AppBarButton(
    title: 'My Library',
    // icon: Icons.music_note,
    route: MyLibraryPage(),
  ),
  AppBarButton(
    title: 'Roadmap',
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

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final ScrollController _scrollController;
  double _scrollPosition = 0.0;
  double _opacity = 0.0;

  _scrollListener() {
    setState(() {
      // _opacity = _scrollController.offset / 100;
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    //Negate the opacity of the top bar
    _opacity = 1 - _opacity;
    print('opacity: $_opacity');
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const SymphonearDrawer(),
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.grey.shade300.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'Symphonear',
                style: TextStyle(
                  color: Colors
                      .black /*.withOpacity(_opacity)*/, //TODO: fix this opacity
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // actions: [
              //   IconButton(
              //     icon: Icon(Icons.brightness_6),
              //     splashColor: Colors.transparent,
              //     highlightColor: Colors.transparent,
              //     onPressed: () {
              //       // EasyDynamicTheme.of(context).changeTheme();
              //     },
              //   ),
              // ],
            )
          : PreferredSize(
              child: TopBarSymphonear(opacity: _opacity),
              preferredSize: Size(
                screenSize.width,
                1000,
              ),
            ),
      body: WebScrollBarSymphonear(
        isAlwaysShown: true,
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: _opacity * 100,
              ),
              ResponsiveWidget.isSmallScreen(context)
                  ? Column(
                      children: [
                        SymphonearOnboardTextWithConnectWallet(
                          screenSize: screenSize,
                        ),
                        MiniMultipleAnimatedPreviews(
                          screenSize: screenSize,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: SymphonearOnboardTextWithConnectWallet(
                            screenSize: screenSize,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: MiniMultipleAnimatedPreviews(
                            screenSize: screenSize,
                          ),
                        ),
                      ],
                    ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SymphonearOnboardTextWithConnectWallet(
                      screenSize: screenSize,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.white12,
                        child:
                            MiniPreviewMusicReproductor(screenSize: screenSize)
                                .neumorphism(
                          blurRadius: 2.5,
                          spreadRadius: 2.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SymphonearOnboardTextWithConnectWallet(
                      screenSize: screenSize,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.white12,
                        child:
                            MiniPreviewMusicReproductor(screenSize: screenSize)
                                .neumorphism(
                          blurRadius: 2.5,
                          spreadRadius: 2.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        scrollController: _scrollController,
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

class DrawerLibraryButton extends StatelessWidget {
  const DrawerLibraryButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.route,
    this.padding =
        const EdgeInsets.only(left: 48, right: 48, top: 4, bottom: 4),
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Widget route;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: padding,
      margin: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade400.withOpacity(0.75),
      ),
      child: ListTile(
        // hoverColor: Colors.grey,
        // focusColor: Colors.grey,
        splashColor: Colors.grey,
        mouseCursor: SystemMouseCursors.click,
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ),
          );
        },
      ),
    );
  }
}

/*This widget will be a container with 3 MiniPreviewMusicReproductor
*in a row, with an animations
*the left and right will be animated from top to bottom and back in a loop
*and the center will be animated from bottom to top and back in a loop
*/

class MiniMultipleAnimatedPreviews extends StatefulWidget {
  final Size screenSize;
  const MiniMultipleAnimatedPreviews({
    required this.screenSize,
    super.key,
  });

  @override
  State<MiniMultipleAnimatedPreviews> createState() =>
      _MiniMultipleAnimatedPreviewsState();
}

class _MiniMultipleAnimatedPreviewsState
    extends State<MiniMultipleAnimatedPreviews>
    with SingleTickerProviderStateMixin {
  static const Map<String, String> _songInfo = {
    'title': 'Song title',
    'artist': 'Artist',
    'album': 'Album',
    'image': 'https://picsum.photos/200',
  };
  static const List<String> _songNames = [
    'Una noche en el museo',
    'Dance with me',
    'The best song',
  ];

  static List<Map<String, String>> _getSongInfo() {
    final List<Map<String, String>> songInfo = [];
    for (int i = 0; i < _songNames.length; i++) {
      songInfo.add({
        'title': _songNames[i],
        'artist': _songInfo['artist'] ?? 'Artist',
        'album': _songInfo['album'] ?? 'Album',
        'image': '${_songInfo['image']}?random=$i',
      });
    }
    return songInfo;
  }

  final List<Map<String, String>> _songInfoList = _getSongInfo();

  late final AnimationController _animationController;
  late final Animation<Offset> _animation1;
  late final Animation<Offset> _animation2;
  late final Animation<Offset> _animation3;

  final List<Animation<Offset>> _listOfAnimations = <Animation<Offset>>[];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animationController.repeat(reverse: true);
    _animation1 = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 0.5),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0,
        0.33,
        curve: Curves.easeInOut,
      ),
    ));
    _animation2 = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 0.5),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.33,
        0.66,
        curve: Curves.easeInOut,
      ),
    ));
    _animation3 = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 0.5),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.66,
        1,
        curve: Curves.easeInOut,
      ),
    ));
    _listOfAnimations.addAll([_animation1, _animation2, _animation3]);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.screenSize.width * 0.35,
          child: Row(
            children: [
              for (int i = 0; i < _songInfoList.length; i++)
                Expanded(
                  flex: 1,
                  child: SlideTransition(
                    position: _listOfAnimations[i],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MiniPreviewMusicReproductor(
                        screenSize: widget.screenSize,
                        imageUrl: _songInfoList[i]['image'],
                        title: _songInfoList[i]['title'] ?? 'Title',
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: widget.screenSize.width * 0.35 / 2,
        )
      ],
    );
  }
}

class MiniMultipleAnimatedPreviewsTwo extends StatefulWidget {
  final Size screenSize;
  const MiniMultipleAnimatedPreviewsTwo({
    super.key,
    required this.screenSize,
  });

  @override
  State<MiniMultipleAnimatedPreviewsTwo> createState() =>
      _MiniMultipleAnimatedPreviewTwoState();
}

class _MiniMultipleAnimatedPreviewTwoState
    extends State<MiniMultipleAnimatedPreviewsTwo>
    with SingleTickerProviderStateMixin {
//This will be a 3D carousel with 3 mini previews
//From left to right
//1. Music Reproductor
//2. Music Reproductor
//3. Music Reproductor

  late final AnimationController _animationController;
  late final Animation<double> _animation;
  late final Animation<double> _animation2;
  late final Animation<double> _animation3;

  void _changePosition() {
    _animationController.forward(from: 0.0);
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    _animation = Tween<double>(begin: 0, end: 0.33).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animation2 = Tween<double>(begin: 0.33, end: 0.66).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animation3 = Tween<double>(begin: 0.33, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: ResponsiveWidget.isSmallScreen(context)
          ? ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: widget.screenSize.width,
                maxWidth: widget.screenSize.width,
                minHeight: widget.screenSize.width * 0.80,
                maxHeight: widget.screenSize.width * 0.80,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 64,
                  vertical: 16,
                ),
                // color: Colors.blue.shade300,
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            _animation.value * (widget.screenSize.width / 2),
                            _animation.value *
                                (widget.screenSize.width / 3 / 2),
                          ),
                          child: child,
                        );
                      },
                      child: MiniPreviewMusicReproductor(
                        screenSize: widget.screenSize,
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _animation2,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            _animation2.value * (widget.screenSize.width / 2),
                            _animation2.value *
                                (widget.screenSize.width / 3 * 2 / 2),
                          ),
                          child: child,
                        );
                      },
                      child: MiniPreviewMusicReproductor(
                        screenSize: widget.screenSize,
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _animation3,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            (_animation2.value * 2) /
                                4 *
                                3 *
                                (widget.screenSize.width * 0.50),
                            _animation3.value *
                                (widget.screenSize.width / 3 / 2),
                          ),
                          child: child,
                        );
                      },
                      child: MiniPreviewMusicReproductor(
                        screenSize: widget.screenSize,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: widget.screenSize.width * 0.40,
                maxWidth: widget.screenSize.width * 0.50,
                minHeight: widget.screenSize.width * 0.40,
                maxHeight: widget.screenSize.width * 1.00,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                // color: Colors.blue.shade300,
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            _animation.value *
                                (widget.screenSize.width / 2 / 4),
                            _animation.value *
                                (widget.screenSize.width / 3 / 2 / 4),
                          ),
                          child: child,
                        );
                      },
                      child: MiniPreviewMusicReproductor(
                        screenSize: widget.screenSize,
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _animation2,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            _animation2.value *
                                (widget.screenSize.width / 2 / 4),
                            _animation2.value *
                                (widget.screenSize.width / 3 * 2 / 2 / 4),
                          ),
                          child: child,
                        );
                      },
                      child: MiniPreviewMusicReproductor(
                        screenSize: widget.screenSize,
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _animation3,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            (_animation2.value * 2) /
                                4 *
                                3 *
                                (widget.screenSize.width * 0.50 / 4),
                            _animation3.value *
                                (widget.screenSize.width / 3 / 2 / 4),
                          ),
                          child: child,
                        );
                      },
                      child: MiniPreviewMusicReproductor(
                        screenSize: widget.screenSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class MiniPreviewMusicReproductor extends StatelessWidget {
  final Size screenSize;
  final String imageUrl;
  final String title;
  MiniPreviewMusicReproductor({
    super.key,
    required this.screenSize,
    String? imageUrl,
    this.title = 'Otra noche en Miami',
  }) : imageUrl = imageUrl ?? 'https://picsum.photos/200/200?random=50';

  @override
  Widget build(BuildContext context) {
    final _width = screenSize.width * 0.2;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15.0),
      ),
      //color: Colors.yellow,
      width: _width,
      height: _width * 2.0,
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: AutoSizeText(
                    minFontSize: 8,
                    maxFontSize: 16,
                    title,
                    style: TextStyle(
                      //fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                ),
                CustomSymphonearSlider(
                  onChanged: (value) {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: _width * 0.115,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        iconSize: _width * 0.115,
                        onPressed: () {},
                        icon: const Icon(
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
                          icon: const Icon(
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
                        icon: const Icon(
                          Icons.skip_next,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                //Two more buttons in a Row (repeat and shuffle)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: _width * 0.115,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.repeat,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      iconSize: _width * 0.115,
                      onPressed: () {},
                      icon: const Icon(
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
      data: const SliderThemeData(
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
