# Loading Skeleton

This is a flutter package that provides you a loading animated and customizable widget.

## Installation

Here you will see everything you need to install and use this package.

To install it, paste this code into your *pubspec.yaml* under dependencies:
```
    loading_skeleton: 0.0.1
```
and then run `flutter pub get` and that's it!

## Getting started

With **loading skeleton** all you need is set a width and a height:

![Image](https://github.com/jpgpa/loading_skeleton_widget/blob/master/assets/Screenshot%202021-03-03%20at%2014.22.40.png)

and the result:

![loading_animated_skeleton](https://media.giphy.com/media/uC0PTR2rgZ4cYD2xmY/giphy.gif)

If you want to be more creative you can change more things like:

    * Margin;
    * Colors;
    * The animation duration;
    * Where the animation should end on the y axis;
    * And of course you can add a child widget to it and add anything you want.

Let's check an example that use all of this parameters:

![Image](https://github.com/jpgpa/loading_skeleton_widget/blob/master/assets/Screenshot%202021-03-03%20at%2014.36.05.png)

and the result:

![another_loading_animated_skeleton](https://media.giphy.com/media/AzsZwdKfnDBrMXZUn0/giphy.gif) ![loading_skeleton_with_header](https://media.giphy.com/media/QK5uaTQTClFz08VlJO/giphy.gif)

You should take note that if you want to pass a **List<Color>** as a parameter to get your own customize color set, you need to pass an **list with size > 1** to get this working! If you don't pass any list<Color> as a parameter the widget will use the default colors (0x1F000000, 0x42000000, 0x1F000000) in this respective order.

The animation duration is set in milliseconds so if you want 2s you should use 2000 as value. By default and if you omit this parameter, the animation will have a duration of 3000 milliseconds.

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
