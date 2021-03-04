# Loading Skeleton

This is a flutter package that provides you a loading animated and customizable widget.

## Installation

Here you will see everything you need to install and use this package.

To install it, paste this code into your *pubspec.yaml* under dependencies:
```dart
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

If you're setting your own colors make sure to pass a list with **size > 1** or you will get an error.

The animation duration is set in milliseconds so if you want 2s you should use 2000 as value. By default the widget use 3000 milliseconds.

You can also wrap your **loading skeleton** widget with another widget. So you can be creative with this.

Let's try to put some border radius on our header loading widget. In this example we will also use the child parameter so you can see how you can add widgets inside **loading skeleton**:

![Image](https://github.com/jpgpa/loading_skeleton_widget/blob/master/assets/Screenshot%202021-03-03%20at%2015.01.28.png)

and the result:

![loading_skeleton3](https://media.giphy.com/media/max8eeuVhtKBhOIbe5/giphy.gif)

So as you can see you can do a lot with this, and make more complex loading state pages. I think we are all full of the standard progress bar/circle, with flutter we can achieve bigger and more complex things so why not?

I'm finishing with another example, this one is a full loading page example. Imagine you have a page structured with your content, wouldn't be great to match that exact page in the loading state while you're waiting for the data? Let's see an example:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Loading Skeleton Example'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            LoadingSkeleton(
              width: 400,
              height: 250,
              margin: EdgeInsets.all(16),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, i) => ListItem(),
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LoadingSkeleton(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(left: 16, top: 16),
          colors: [Colors.amber, Colors.purpleAccent, Colors.amber],
        ),
        LoadingSkeleton(
          width: 280,
          height: 100,
          margin: EdgeInsets.only(left: 16, top: 16, right: 16),
          colors: [
            Colors.blueAccent,
            Colors.deepOrangeAccent,
            Colors.blueAccent,
          ],
        ),
      ],
    );
  }
}
```
and the result: 

![skeleton4](https://media.giphy.com/media/wyuUX0ZDP26VS2WmnH/giphy.gif)

I hope you enjoyed it, feel free to contact me:
josepedroalves100@gmail.com
