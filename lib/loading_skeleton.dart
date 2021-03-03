library loading_skeleton;

import 'package:flutter/material.dart';

// # Enum to define different ending points for the animation in the Y axis
enum AnimationEnd {
  EXTREMELY_ON_TOP,
  MODERATELY_ON_TOP,
  NORMAL,
  MODERATELY_ON_BOTTOM,
  EXTREMELY_ON_BOTTOM,
}

// # enum extension so we can define different values for the different enum index
extension AnimationEndExtension on AnimationEnd {
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

class LoadingSkeleton extends StatefulWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final List<Color> colors;
  final AnimationEnd animationEnd;
  final int animationDuration;

  // # This method constructs the LoadingSkeleton widget;
  // # Params [width] and [height] are @required;
  // # Params margin and colors are optional;
  // # If the user don't pass any colors list as param, the package will use a default set color list
  // with shades of gray. #IMPORTANT: The colors list needs a size > 1 to work
  // # Param [animationEnd] is optional and defines the animation ending point on Y axis.
  // By default is set to "normal" => 0
  // # Param [animationDuration] defines the duration of the animation in milliseconds.
  // By default is set to 3000ms
  LoadingSkeleton({
    @required this.width,
    @required this.height,
    this.margin,
    this.colors = const [Colors.black12, Colors.black26, Colors.black12],
    this.animationEnd = AnimationEnd.NORMAL,
    this.animationDuration = 3000,
  })  : assert(width != null),
        assert(height != null),
        assert(colors.length > 1);

  @override
  _LoadingSkeletonState createState() => _LoadingSkeletonState();
}

class _LoadingSkeletonState extends State<LoadingSkeleton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation gradientPosition;

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

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
    );
  }
}
