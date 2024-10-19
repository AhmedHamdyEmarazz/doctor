import 'package:doctor/auth/domain/onBoard_cubit.dart';
import 'package:doctor/auth/domain/onBoard_states.dart';
import 'package:doctor/auth/presentation/screens/onBoardingFirst.dart';
import 'package:doctor/auth/presentation/screens/onBoardingSecond.dart';
import 'package:doctor/auth/presentation/screens/onBoardingThird.dart';
import 'package:doctor/auth/presentation/screens/signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Flutter code sample for [PageView].

class PageViewOnBoarding extends StatefulWidget {
  const PageViewOnBoarding({super.key});

  @override
  State<PageViewOnBoarding> createState() => _PageViewOnBoardingState();
}

class _PageViewOnBoardingState extends State<PageViewOnBoarding>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: const <Widget>[
            OnBoardingFirst(),
            OnBoardingSecond(),
            OnBoardingThird()
          ],
        ),
        BlocConsumer<OnBoardCubit, OnBoardStates>(
          builder: (context, state) {
            context.read<OnBoardCubit>().index;
            var counterx = context.read<OnBoardCubit>().index;

            return PageIndicator(
              tabController: _tabController,
              currentPageIndex: counterx,
              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
              isOnDesktopAndWeb: _isOnDesktopAndWeb,
            );
          },
          listener: (BuildContext context, OnBoardStates state) {},
        ),
      ],
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    _tabController.index = currentPageIndex;
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }
}

class PageIndicator extends StatefulWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocConsumer<OnBoardCubit, OnBoardStates>(
        builder: (context, state) {
          var counter = context.read<OnBoardCubit>().index;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                  splashRadius: 16.0,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    // if (counter == 0) {
                    //   widget.onUpdateCurrentPageIndex(counter);
                    // } else {
                    //   context.read<OnBoardCubit>().decrement();
                    //   widget.onUpdateCurrentPageIndex(counter);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignUp();
                    }));
                  },
                  icon: const Text(
                    'تخطي',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  )),
              TabPageSelector(
                  controller: widget.tabController,
                  color: Colors.grey.shade200,
                  indicatorSize: 9,
                  selectedColor: Colors.grey.shade700,
                  borderStyle: BorderStyle.none),
              IconButton(
                  splashRadius: 16.0,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (counter > 3) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignUp();
                      }));
                    } else {
                      context.read<OnBoardCubit>().increment();
                      widget.onUpdateCurrentPageIndex(counter);
                    }
                  },
                  icon: const Text(
                    'التالي',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  )),
            ],
          );
        },
        listener: (context, state) async {
          var counter = context.read<OnBoardCubit>().index;
          counter > 3
              ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignUp();
                }))
              : null;
          if (kDebugMode) {
            print(counter);
          }
        },
      ),
    );
  }
}
