library loading_skeleton;

import 'package:flutter/material.dart';

class LoadingSkeleton extends StatefulWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final List<Color> colors;

  // # This method constructs the LoadingSkeleton widget;
  // # Params [width] and [height] are @required;
  // # Params margin and colors are optional;
  // # If the user don't pass any colors list as param, the package will use a default set color list
  // with shades of gray
  LoadingSkeleton(
      {@required this.width, @required this.height, this.margin, this.colors})
      : assert(width != null),
        assert(height != null);

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
        duration: Duration(milliseconds: 3000), vsync: this);

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
          begin: Alignment(gradientPosition.value, 0),
          end: Alignment(-10, 0),
          colors: widget.colors != null && widget.colors.isNotEmpty
              ? widget.colors
              : [Colors.black12, Colors.black26, Colors.black12],
        ),
      ),
    );
  }
}
