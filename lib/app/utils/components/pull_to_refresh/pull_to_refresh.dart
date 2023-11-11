import 'dart:async';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/app.dart';



class _Cloud {

  _Cloud({
    required this.color,
    required this.image,
    required this.width,
    required this.dy,
    required this.initialValue,
    required this.duration,
  });
  static const _light = Color(0xFFE08989);
  static const _dark = Color(0xffb42c3a);
  static const _normal = Color(0xFFB54F54);

  static const _assets = [
    'assets/images/cloud1.png',
    'assets/images/cloud2.png',
    'assets/images/cloud3.png',
    'assets/images/cloud4.png',
  ];

  AnimationController? controller;
  final Color color;
  final AssetImage image;
  final double width;
  final double dy;
  final double initialValue;
  final Duration duration;
}

class PullIndicator extends StatefulWidget {
  const PullIndicator({required this.child, super.key,});
  final Widget child;

  @override
  State<PullIndicator> createState() => _PullIndicatorState();
}

class _PullIndicatorState extends State<PullIndicator> with TickerProviderStateMixin{
  static final _planeTween = CurveTween(curve: Curves.easeInOut);
  late AnimationController _planeController;

  @override
  void initState() {
    _planeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _setupCloudsAnimationControllers();
    WidgetsBinding.instance.addPostFrameCallback((_) => _precacheImages());
    super.initState();
  }

  void _precacheImages() {
    for (final config in _clouds) {
      unawaited(precacheImage(config.image, context));
    }
  }

  static final _clouds = [
    _Cloud(
      color: _Cloud._dark,
      initialValue: 0.6,
      dy: 10,
      image: AssetImage(_Cloud._assets[1]),
      width: 100,
      duration: const Duration(milliseconds: 1600),
    ),
    _Cloud(
      color: _Cloud._light,
      initialValue: 0.15,
      dy: 25,
      image: AssetImage(_Cloud._assets[3]),
      width: 40,
      duration: const Duration(milliseconds: 1600),
    ),
    _Cloud(
      color: _Cloud._light,
      initialValue: 0.3,
      dy: 65,
      image: AssetImage(_Cloud._assets[2]),
      width: 60,
      duration: const Duration(milliseconds: 1600),
    ),
    _Cloud(
      color: _Cloud._dark,
      initialValue: 0.8,
      dy: 70,
      image: AssetImage(_Cloud._assets[3]),
      width: 100,
      duration: const Duration(milliseconds: 1600),
    ),
    _Cloud(
      color: _Cloud._normal,
      initialValue: 0,
      dy: 10,
      image: AssetImage(_Cloud._assets[0]),
      width: 80,
      duration: const Duration(milliseconds: 1600),
    ),
  ];

  void _setupCloudsAnimationControllers() {
    for (final cloud in _clouds) {
      cloud.controller = AnimationController(
        vsync: this,
        duration: cloud.duration,
        value: cloud.initialValue,
      );
    }
  }

  void _startPlaneAnimation() {
    _planeController.repeat(reverse: true);
  }

  void _stopPlaneAnimation() {
    _planeController
      ..stop()
      ..animateTo(0, duration: const Duration(milliseconds: 100));
  }

  void _stopCloudAnimation() {
    for (final cloud in _clouds) {
      cloud.controller!.stop();
    }
  }

  void _startCloudAnimation() {
    for (final cloud in _clouds) {
      cloud.controller!.repeat();
    }
  }

  void _disposeCloudsControllers() {
    for (final cloud in _clouds) {
      cloud.controller!.dispose();
    }
  }

  @override
  void dispose() {
    _planeController.dispose();
    _disposeCloudsControllers();
    super.dispose();
  }

  static const _offsetToArmed = 150.0;

  @override
  Widget build(BuildContext context) {
    final plane = AnimatedBuilder(
      animation: _planeController,
      child: Image.asset(
        AppImage.plane,
        width: 172,
        height: 50,
        fit: BoxFit.contain,
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, 10 * (0.5 - _planeTween.transform(_planeController.value))),
          child: child,
        );
      },
    );
    return CustomRefreshIndicator(
      offsetToArmed: _offsetToArmed,
      autoRebuild: false,
      onStateChanged: (change) {
        if (change.didChange(
          from: IndicatorState.armed,
          to: IndicatorState.settling,
        )) {
          _startCloudAnimation();
          _startPlaneAnimation();
        }
        if (change.didChange(
          from: IndicatorState.loading,
        )) {
          _stopPlaneAnimation();
        }
        if (change.didChange(
          to: IndicatorState.idle,
        )) {
          _stopCloudAnimation();
        }
      },
    builder: (BuildContext context, Widget child, IndicatorController controller) {
     return AnimatedBuilder(
        animation: controller,
        child: child,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              if (!controller.side.isNone)
                Container(
                  height: _offsetToArmed * controller.value,
                  color: const Color(0xff141718),
                  width: double.infinity,
                  child: AnimatedBuilder(
                    animation: _clouds.first.controller!,
                    builder: (BuildContext context, Widget? child) {
                      return Stack(
                        children: <Widget>[
                          for (final cloud in _clouds)
                            Transform.translate(
                              offset: Offset(
                                ((MediaQuery.of(context).size.width + cloud.width) * cloud.controller!.value) - cloud.width,
                                cloud.dy * controller.value,
                              ),
                              child: OverflowBox(
                                minWidth: cloud.width,
                                minHeight: cloud.width,
                                maxHeight: cloud.width,
                                maxWidth: cloud.width,
                                alignment: Alignment.topLeft,
                                child: Image(
                                  color: cloud.color,
                                  image: cloud.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),

                          /// plane
                          Center(
                            child: OverflowBox(
                              maxWidth: 172,
                              minWidth: 172,
                              maxHeight: 50,
                              minHeight: 50,
                              child: plane,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              Transform.translate(
                offset: Offset(0, _offsetToArmed * controller.value),
                child: child,
              ),
            ],
          );
        },
      );

    },
      onRefresh: () => Future.delayed(const Duration(seconds: 3)),
      child: widget.child,
    );
  }
}
