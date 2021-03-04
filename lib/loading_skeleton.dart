library loading_skeleton;

import 'package:flutter/material.dart';

/// Enum to define different ending points for the animation in the Y axis
enum AnimationEnd {
  EXTREMELY_ON_TOP,
  MODERATELY_ON_TOP,
  NORMAL,
  MODERATELY_ON_BOTTOM,
  EXTREMELY_ON_BOTTOM,
}

/// Enum extension so we can define different values for the different enum index
extension AnimationEndExtension on AnimationEnd {
  /// Return a defined value for the given enum type
  double get value {
    switch (this) {
      case AnimationEnd.EXTREMELY_ON_TOP:
        return -7;
      case AnimationEnd.MODERATELY_ON_TOP:
        return -3;
      case AnimationEnd.NORMAL:
        return 0;
      case AnimationEnd.MODERATELY_ON_BOTTOM:
        return 3;
      case AnimationEnd.EXTREMELY_ON_BOTTOM:
        return 7;
      default:
        return 0;
    }
  }
}

/// Loading Skeleton Widget class
class LoadingSkeleton extends StatefulWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final List<Color> colors;
  final AnimationEnd animationEnd;
  final int animationDuration;
  final Widget child;

  /// This method constructs the LoadingSkeleton widget
  ///
  /// Params [width] and [height] are @required
  ///
  /// Params margin and colors are optional
  ///
  /// If the user don't pass any colors list in [colors], the package will use a default set color list
  ///
  /// Param [animationEnd] is optional and defines the animation ending point on Y axis
  ///
  /// Param [animationDuration] defines the duration of the animation in milliseconds
  ///
  /// Param [child] can be used to get child widgets inside of loading skeleton
  LoadingSkeleton({
    @required this.width,
    @required this.height,
    this.margin,
    this.colors = const [Colors.black12, Colors.black26, Colors.black12],
    this.animationEnd = AnimationEnd.NORMAL,
    this.animationDuration = 3000,
    this.child,
  })  : assert(width != null),
        assert(height != null),
        assert(colors.length > 1);

  /// Method that create loading skeleton state
  @override
  _LoadingSkeletonState createState() => _LoadingSkeletonState();
}

class _LoadingSkeletonState extends State<LoadingSkeleton>
    with SingleTickerProviderStateMixin {
  /// Field responsable for controlling the animation
  AnimationController _controller;

  /// Field responsable for handle animation values
  Animation gradientPosition;

  /// Method that initializes the widget and the animation
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.animationDuration),
        vsync: this);

    gradientPosition = Tween<double>(begin: -3, end: 50).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    )..addListener(() {
        setState(() {});
      });

    /// It will repeat the animation until the widget be removed
    _controller.repeat();
  }

  /// Method responsable for disposing the animation controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Build method responsable for building the widget on the widget tree
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin != null ? widget.margin : null,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            gradientPosition.value,
            widget.animationEnd.value,
          ),
          end: Alignment(-10, 0),
          colors: widget.colors,
        ),
      ),
      child: widget.child != null ? widget.child : null,
    );
  }
}
