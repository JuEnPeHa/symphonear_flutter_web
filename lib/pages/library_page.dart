import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:symphonear_flutter_web/widgets/responsive.dart';
import 'package:symphonear_flutter_web/widgets/responsive_widget.dart';
import 'package:symphonear_flutter_web/widgets/top_bar_symphonear.dart';

//This is My Library Page
//Permanent light grey bar at the left side of the screen
//This is the page that will be displayed when the user clicks on the library icon
//This page will display "Recently Played" and "Trending" and "Latest Podcasts" in the main body of the page
//(the main body of the page will be a grid view background color is grey obscure in gradient from left bottom to right top)
//With 4 cards in each section in a grid view
//A bottom navigation bar will be displayed at the bottom of the page pinned to the bottom of the screen
//The bottom navigation bar will have 5 icons in the center
//The icons will be "Shuffle", "Back", "Play", "Next", and "Like"
//At the right side of the bottom music player will be a slider that will allow the user to adjust the volume
//At the left side of the bottom music player will be a mini image of the album art of the currently playing song
//This bottom music player color will be a gradient from grey bottom right to almost white top left

class MyLibraryPage extends StatelessWidget {
  const MyLibraryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: LeftNavBar(),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Colors.grey.shade300,
                            Colors.grey.shade200,
                            Colors.grey.shade100,
                            Colors.grey.shade50,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: TopBarSymphonearRightButtons(
                              mainAxisAlignment: MainAxisAlignment.end,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: double.maxFinite,
                              width: double.maxFinite,
                              //color: Colors.red.shade300,
                              child: MyLibraryBody(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // This is the Bottom Music Player
            BottomMusicPlayer(),
          ],
        ),
      ),
      mobile: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: const AutoSizeText(
            'Symphonear',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: LeftNavBar(),
        ),
        body: MyLibraryBody(),
      ),
    );
  }
}

class MyLibraryBody extends StatefulWidget {
  const MyLibraryBody({
    super.key,
  });

  @override
  State<MyLibraryBody> createState() => _MyLibraryBodyState();
}

class _MyLibraryBodyState extends State<MyLibraryBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MyLibraryBody oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveWidget.isSmallScreen(context)
          ? const EdgeInsets.all(12)
          : ResponsiveWidget.isMediumScreen(context)
              ? const EdgeInsets.all(8)
              : const EdgeInsets.all(4),
      child: CustomScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 150,
            delegate: SliverChildListDelegate.fixed(
              [
                GridListLibrarySimphonearWidget(
                  title: 'Recently Played',
                  //color: Colors.red.shade100,
                ),
                GridListLibrarySimphonearWidget(
                  title: 'Trending',
                  //color: Colors.blue.shade500,
                ),
                GridListLibrarySimphonearWidget(
                  title: 'Latest Podcasts',
                  //color: Colors.green.shade900,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GridListLibrarySimphonearWidget extends StatelessWidget {
  final String title;
  final Color? color;

  const GridListLibrarySimphonearWidget({
    super.key,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        //height: 100,
        width: double.maxFinite,
        color: color ?? Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: AutoSizeText(
                  title,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                //color: Colors.red.shade200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.grey.shade300,
                      Colors.grey.shade200,
                      Colors.grey.shade100,
                      Colors.grey.shade50,
                    ],
                  ),
                ),
                child: ScrollConfiguration(
                  behavior: CustomHorizontalScrollBehavior(),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    dragStartBehavior: DragStartBehavior.start,
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 100,
                        // color: Colors.red.shade700,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image:
                                NetworkImage('https://picsum.photos/200/300'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class LeftNavBar extends StatelessWidget {
  const LeftNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: double.maxFinite,
      color: Colors.grey[300],
    );
  }
}

class BottomMusicPlayer extends StatelessWidget {
  final double height;
  const BottomMusicPlayer({super.key, this.height = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Colors.grey[300]!,
            Colors.grey[100]!,
          ],
        ),
      ),
    );
  }
}

class CustomHorizontalScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
