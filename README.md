# Raahi - Assitive tool for visually impaired

Raahi uses Machine learning techinques like -

- Object Localization
- Depth Estimation
- Lane Detection
- Natural Language Processing

to assist visually impaired people in navigation.

We made this as our Bachelors of Technology Project(BTP).

### Made By

- Aditya Kumar
- Harmeet Singh
- Rupesh Kumar
- Sumit Yadav

## Setup

1. We have provided an APK of a mobile application built using the Flutter Framework.
2. Download the APK on an Android device and install it.
3. Since the application is in prototype phase, we didn't take the trouble of buying a hosting service. You need to run the backend server on your device to test the functionality. Follow steps [here](https://github.com/rkas123/Raahi-flask) to set up the backend server.
4. Start the app.

That's it! You can test the prototype now.

## User manual

1. The application is based on automation and easy interaction, so using the app is very intuitive.
2. There are 2 types of operations a user can perform
   - Automatic
   - Manual
3. Automatic request is sent to the backend every 20 seconds(configurable). The user doesn't need to do anything for it.
4. Manual requests can be triggered by the user by clicking on the mic button and speaking out a command.

The app uses voice commands to communicate. The output is also given the user using Text to speech, therefore all the communication occurs via sound.
