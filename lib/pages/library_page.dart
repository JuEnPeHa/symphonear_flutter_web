import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//This is My Library Page
//Permanent bar at the left side of the screen
//This is the page that will be displayed when the user clicks on the library icon
//This page will display "Recently Played" and "Trending" and "Latest Podcasts" in the main body of the page
//With 4 cards in each section in a grid view
//A bottom navigation bar will be displayed at the bottom of the page pinned to the bottom of the screen
//The bottom navigation bar will have 5 icons in the center
//The icons will be "Shuffle", "Back", "Play", "Next", and "Like"
//At the right side of the bottom navigation bar will be a slider that will allow the user to adjust the volume
//At the left side of the bottom navigation bar will be a mini image of the album art of the currently playing song
//This bottom navigation bar color will be a gradient from grey to almost white

class MyLibraryPage extends StatelessWidget {
  const MyLibraryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Library'),
      ),
      body: const Center(
        child: Text('My Library Page'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
    );
  }
}
