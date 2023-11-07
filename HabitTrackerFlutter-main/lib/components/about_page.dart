import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/2/937/253/portrait-display-vertical-pattern-digital-art-wallpaper-preview.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(30.0),
          color: Colors.black.withOpacity(0.7), // add a transparent black overlay to the background image
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  'About Habit Tracker',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Habit Tracker is a simple app that helps you to keep track of your daily habits. With this app, you can easily add, edit and delete habits, and keep track of your progress over time. Habit Tracker is designed to be easy to use and customizable to your specific needs.\n\nHabit Tracker is a powerful tool that helps users build and maintain healthy habits in their daily lives. With its user-friendly interface, customizable features, and community aspect, Habit Tracker is an app that can help users achieve their goals and lead healthier, happier lives.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Developer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'This app was developed by Athul P G as a main project.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Contact',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'For any questions or feedback, please contact us at 202325@student.alberts.edu.in',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}