# MusicApp
A simple swift application for iOS that plays music from specific genres
<<<<<<< HEAD
=======

Developed by: Brian Bugieda, November 2019

## Installation
Open a bash terminal and type the following to clone a copy of the repository to your local computer.
```bash
git clone https://github.com/bbugieda/MusicApp.git
```

## Setting up Environment & Running the App
Open the repository in XCode and select a device or simulator to run.

**Note: Run on an actual iOS device, as simulators are unable to connect to your music library

The first time you install the app on your device, you may need to "Trust" apps from Apple Developer. To allow this, go into Settings >> General >> Profiles & Device Management. From here, select the Developer App item for the app you are running and click "Trust" button from the pop up dialogue.

## Navigating in App

**Note: The first time you run the app, there will be a noticable lag from the time you tap a genre button until the time the music plays. This is because the app is connecting to iCloud and pulling songs down to be used in the app. This lag will only occur the first time running the app after installation.

### Genre Buttons
Click on any of the genre buttons to play a random song from that genre. If you are in one genre and tap the same genre button, a new song from the same genre will be played. If you tap a different genre button, a random song from the new genre will be played.

### Stop and Next Buttons
The stop button stops the current song from being played. This is different than pausing the music. The Next button will skip to the next song in the queue of the current genre.

### Current Song
The Current Song text view displays the current song's title. You are able to highlight the text and copy the song name if you want to share it or send it to a friend.
>>>>>>> parent of 8d19213... Update README.md
