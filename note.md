# Notes

## Most important widgets
- MaterialApp
- Scaffold : AppBar, ...
- Container 
- Row
- Column
- Flexible
- Expanded
- Stack 
- Card
- ListViews
- Gridview
- ListTilte
- Text
- Image
- Icon
- GestureDetector
- Inkwell

## container vs column vs row
- container take one child widget, row and column have a list of widgets (children)
- container have many styling(decoration, margin, border,color,...) options than the 2 others
## date format
https://pub.dev/packages/intl
- add dependencies in pubspec.yaml
-      Pattern                           Result
     ----------------                  -------
  new DateFormat.yMd()             -> 7/10/1996
  new DateFormat("yMd")            -> 7/10/1996
  new DateFormat.yMMMMd("en_US")   -> July 10, 1996
  new DateFormat.jm()              -> 5:08 PM
  new DateFormat.yMd().add_jm()    -> 7/10/1996 5:08 PM
  new DateFormat.Hm()              -> 17:08 // force 24 hour time

## scrolling 
wrap the body with SingleChildScrollView() widget

## closins the context
    
Navigator.of(context).pop();

## Flexible and Expanded widget
by adding "fit" and "flex" values, we can specified how the child take the space of your screen.

##  

Attached, you find the source code for this section (multiple code snapshots - also attached to individual lectures throughout this module).

In addition, the following resources might be helpful:

    More on Layouting (with Column(), Row() etc.): https://flutter.dev/docs/development/ui/layout

    More on Images & Assets: https://flutter.dev/docs/development/ui/assets-and-images

    Official Widget Catalog: https://flutter.dev/docs/development/ui/widgets

    Material Design Docs: https://material.io/design/

    Flutter Theming: https://flutter.dev/docs/cookbook/design/themes

## Working with the "textScaleFactor"

In this course, I mostly focus on the device sizes (height and width) when it comes to working with the MediaQuery class.

As mentioned, it offers way more than that of course. On particularly interesting property is the textScaleFactor property:

    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

textScaleFactor tells you by how much text output in the app should be scaled. Users can change this in their mobile phone / device settings.

Depending on your app, you might want to consider using this piece of information when setting font sizes.

Consider this example:

    Text('Always the same size!', style: TextStyle(fontSize: 20));

This text ALWAYS has a size of 20 device pixels, no matter what the user changed in his / her device settings.

    Text('This changes!', style: TextStyle(fontSize: 20 * curScaleFactor));

This text on the other hand also has a size of 20 if the user didn't change anything in the settings (because textScaleFactor by default is 1). But if changes were made, the font size of this text respects the user settings.

## Capurteno Widget 
 it is widgets for IOS devices
 In addition, the following resources might be helpful:

    More on MediaQuery & Responsive Layouts: https://api.flutter.dev/flutter/widgets/MediaQuery-class.html & https://stackoverflow.com/questions/49704497/how-to-make-flutter-app-responsive-according-to-different-screen-size?rq=1

    More on LayoutBuilder: https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html

    All Cupertino Widgets: https://flutter.dev/docs/development/ui/widgets/cupertino