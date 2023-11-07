import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/875/694/334/spider-man-into-the-spider-verse-spider-man-miles-morales-movies-city-hd-wallpaper-preview.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.black.withOpacity(0.66), 
          child: SingleChildScrollView(// add a transparent black overlay to the background image
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child:
              Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white, // set the text color to white
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child:
              Text(
                'How can you incorporate gratitude into my new habit?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white, // set the text color to white
                ),
              ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child:
              Text(
                'Be thankful that you are well-off enough to be able to even consider personal growth, and working on yourself. Look at your new habit as a treat!',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white, // set the text color to white
                ),
              ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child:
              Text(
                'The Habit Tracker: What It Is and How It Works',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white, // set the text color to white
                ),
              ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child:
              Text(
                'A habit tracker is a simple way to measure whether you did a habit. The most basic format is to get a calendar and cross off each day you stick with your routine.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white, // set the text color to white
                ),
              ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child:
              Text(
                'Benefit #1: A habit tracker reminds you to act.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white, // set the text color to white
                ),
              ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child:
              Text(
                'Habit tracking naturally builds a series of visual cues. When you look at the calendar and see your streak, you be reminded to act again.\n\nResearch has shown that people who track their progress on goals like losing weight, quitting smoking, and lowering blood pressure are all more likely to improve than those who don’t. One study of more than sixteen hundred people found that those who kept a daily food log lost twice as much weight as those who did not. A habit tracker is a simple way to log your behavior, and the mere act of tracking a behavior can spark the urge to change it.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white, // set the text color to white
                ),
              ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child:
              Text(
                'Benefit #2: A habit tracker motivates you to continue.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white, // set the text color to white
                ),
              ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child:
              Text(
                'The most effective form of motivation is progress. When we get a signal that we are moving forward, we become more motivated to continue down that path. In this way, habit tracking can have an addictive effect on motivation. Each small win feeds your desire.\n\nThis can be particularly powerful on a bad day. When you’re feeling down, it’s easy to forget about all the progress you have already made. Habit tracking provides visual proof of your hard work—a subtle reminder of how far you have come. Plus, the empty square you see each morning can motivate you to get started because you dont want to lose your progress by breaking your streak.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white, // set the text color to white
                ),
              ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child:
              Text(
                'Benefit #3: A habit tracker provides immediate satisfaction.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white, // set the text color to white
                ),
              ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child:
              Text(
                'Finally, tracking feels rewarding. It is satisfying to cross an item off your to-do list, to complete an entry in your workout log, or to mark an X on the calendar. It feels good to watch your results grow and if it feels good, then you are more likely to endure.\n\nHabit tracking also helps keep your eye on the ball: you are focused on the process rather than the result. You are not fixated on getting six-pack abs, you are just trying to keep the streak alive and become the type of person who does not miss workouts.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white, // set the text color to white
                ),
              ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}
