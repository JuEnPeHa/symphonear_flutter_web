import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WebScrollBarSymphonear extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;
  final double heightFraction;
  final double width;
  final Color color;
  final Color backgroundColor;
  final bool isAlwaysShown;

  const WebScrollBarSymphonear({
    super.key,
    required this.child,
    required this.scrollController,
    this.heightFraction = 0.20,
    this.width = 8,
    this.color = Colors.black45,
    this.backgroundColor = Colors.black12,
    this.isAlwaysShown = false,
  }) : assert(heightFraction > 0.0 && heightFraction <= 1.0);

  @override
  State<WebScrollBarSymphonear> createState() => _WebScrollBarSymphonearState();
}

class _WebScrollBarSymphonearState extends State<WebScrollBarSymphonear> {
  double _scrollBarHeight = 0.0;
  // double _scrollBarY = 0.0;
  // double _scrollBarYMax = 0.0;
  // double _scrollBarYMin = 0.0;
  // double _scrollBarYMaxLimit = 0.0;
  // double _scrollBarYMinLimit = 0.0;
  // double _scrollBarYMaxLimitOffset = 0.0;
  // double _scrollBarYMinLimitOffset = 0.0;
  // double _scrollBarYMaxLimitOffsetMax = 0.0;
  // double _scrollBarYMinLimitOffsetMin = 0.0;

  double _scrollPosition = 0;
  late bool _isUpdating;
  late Timer _timer;

  _scrollListener() {
    setState(() {
      _scrollPosition = widget.scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    super.initState();
    _isUpdating = false;
    widget.scrollController.addListener(_scrollListener);
    // _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
    //   if (_isUpdating) {
    //     _isUpdating = false;
    //     _updateScrollBar();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double _scrollerHeight = screenSize.height * widget.heightFraction;
    double _scrollerYMax = screenSize.height - _scrollerHeight;

    double _topMargin = widget.scrollController.hasClients
        ? ((screenSize.height *
                _scrollPosition /
                widget.scrollController.position.maxScrollExtent) -
            (_scrollerHeight *
                _scrollPosition /
                widget.scrollController.position.maxScrollExtent))
        : 0.0;

    // double _scrollerYMin = 0.0;
    // double _scrollerYMaxLimit = _scrollerYMax - _scrollerHeight;
    // double _scrollerYMinLimit = _scrollerYMin + _scrollerHeight;
    // double _scrollerYMaxLimitOffset = _scrollerYMaxLimit - _scrollerYMax;
    // double _scrollerYMinLimitOffset = _scrollerYMinLimit - _scrollerYMin;
    // double _scrollerYMaxLimitOffsetMax = _scrollerYMaxLimitOffset + _scrollerHeight;
    // double _scrollerYMinLimitOffsetMin = _scrollerYMinLimitOffset - _scrollerHeight;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.depth == 0) {
          if (notification is ScrollUpdateNotification) {
            _timer.cancel();
            setState(() {
              _isUpdating = true;
            });
          } else {
            _timer = Timer(Duration(seconds: 5), () {
              setState(() {
                _isUpdating = false;
              });
            });
          }
        }
        return true;
      },
      child: Stack(
        children: [
          widget.child,
          AnimatedOpacity(
            opacity: widget.isAlwaysShown
                ? 1
                : widget.scrollController.hasClients
                    ? _isUpdating
                        ? 1
                        : 0
                    : 0,
            duration: Duration(milliseconds: 300),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
