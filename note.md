# Notes

## State management 
    - state is the data which affect the UI and which might change over time
## providers and listener
    we can use it to void building the whole applications
## extends vs with
     with extends the child class cans use all properties and function of parent class or override method to personalise it
     with is used when the connection between mixin class and child is not strong (it is utility, fonctionnality, providers),  we can add many mixin to a class 
## app state vs wide state( provider vs statefullWidget)
    Provider change all widget using the concern data, otherwise, statefull restart the widget only.
    we can use consumer to rerun only a small part inside the build method.
    providers rerun all build method
## didChangeDependencies
    to use the arguments route, and update a product