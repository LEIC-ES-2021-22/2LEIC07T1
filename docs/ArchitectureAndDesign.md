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
 - Smarthphone (both in Android and IOS)
 - Sigarra's website 
 - Library's website

The chosen mobile framework to develop the UI was Flutter. For the logical section and database management we are using Dart and SqlLite respectively.


![physical_diagram](src/physical_diagram.png)

## Vertical prototype

So far, we haven't worked on any concrete implementation of the user stories. Nevertheless, we have already produced a sample Flutter application so the development is ready to start 🚀. Here is the current state of the application:

<p align="center">
   <img src="https://user-images.githubusercontent.com/75942759/162584637-878dacaf-be78-41ca-8658-763d3eb5c972.png">
</p>

