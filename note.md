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

