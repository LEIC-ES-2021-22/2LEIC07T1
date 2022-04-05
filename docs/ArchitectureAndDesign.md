# Architecture and Design

This file incorporates a short description of the app's architecture.
The main component of our program is the mobile application. It is hosted on the user's phone and connects to the website. Data about the events is stored locally. The app is organized according to the **Model-View-Controller** pattern. 

## Logical architecture

Uniteca is the main component of the application. It contains all the **MVC** components:
 - The **View** (Occupation UI, Profile UI and Rooms UI) uses the data from the model and controller to display it to the user, through the Flutter interface. It also communicates to the Controller any action the user performs.
 - The **Controller** (Occupation Logic, Profile Logic and Booking Logic) is responsible for fetching the data from the website and saving it to the database. It is also the brain of the program since the information from View is processed here.
 - The **Model** (Occupation database, Student's database) holds and organizes all the program's data, including booked rooms, profile information and occupation values.

![component diagram](src/component_diagram.png)

## Physical architecture

The physical architecture of the application is composed by:
 - Smarthphone
 - Sigarra's website
 - Library's website

The chosen sotfware of the UI section is Flutter (finish)

## Vertical prototype
