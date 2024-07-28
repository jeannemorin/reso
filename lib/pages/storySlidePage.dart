import 'package:alumnfarce/models/storyModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class StorySlidesPage extends StatefulWidget {
  final Story story;

  StorySlidesPage({required this.story});

  @override
  _StorySlidesPageState createState() => _StorySlidesPageState();
}

class _StorySlidesPageState extends State<StorySlidesPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isPaused = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    );
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_isPaused) {
        _nextSlide();
      }
    });
  }

  void _nextSlide() {
    if (_currentIndex < widget.story.slides.length - 1) {
      setState(() {
        _currentIndex++;
        _pageController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        _animationController.reset();
        _animationController.forward();
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onUserHold(bool isHolding) {
    setState(() {
      _isPaused = isHolding;
      if (_isPaused) {
        _animationController.stop();
      } else {
        _animationController.forward();
      }
    });
  }

  Widget _buildProgressBar() {
    return Positioned(
      top: 16.0,
      left: 8.0,
      right: 8.0,
      child: Row(
        children: widget.story.slides.map((slide) {
          int index = widget.story.slides.indexOf(slide);
          return Expanded(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
                if (index < _currentIndex)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  )
                else if (index == _currentIndex)
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        height: 5.0,
                        width: MediaQuery.of(context).size.width *
                            _animationController.value,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                      );
                    },
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  void _goToPreviousSlide() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _pageController.previousPage(
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        _animationController.reset();
        _animationController.forward();
      });
    }
  }

  void _goToNextSlide() {
    if (_currentIndex < widget.story.slides.length - 1) {
      setState(() {
        _currentIndex++;
        _pageController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        _animationController.reset();
        _animationController.forward();
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (_) => Navigator.pop(context),
        onTapDown: (details) {
          double screenWidth = MediaQuery.of(context).size.width;
          if (details.globalPosition.dx < screenWidth / 2) {
            _goToPreviousSlide();
          } else {
            _goToNextSlide();
          }
        },
        onLongPressStart: (_) => _onUserHold(true),
        onLongPressEnd: (_) => _onUserHold(false),
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.down,
          onDismissed: (direction) {
            Navigator.pop(context);
          },
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: widget.story.slides.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                  _animationController.reset();
                  _animationController.forward();
                },
                itemBuilder: (context, index) {
                  final slide = widget.story.slides[index];
                  return Column(
                    children: [
                      if (slide.link != null)
                        GestureDetector(
                          onTap: () {
                            // Handle link navigation
                          },
                          child: Container(
                            height: 200,
                            color: Colors.blueAccent,
                            child: Center(
                              child: Text(
                                "Link to Event/Article",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      Expanded(
                        child: Image.asset(
                          slide.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                },
              ),
              _buildProgressBar(),
            ],
          ),
        ),
      ),
    );
  }
}
