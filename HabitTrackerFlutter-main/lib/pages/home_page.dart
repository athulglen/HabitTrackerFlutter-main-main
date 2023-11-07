import 'package:flutter/material.dart';
import 'package:habittrackertute/components/habit_tile.dart';
import 'package:habittrackertute/components/month_summary.dart';
import 'package:habittrackertute/components/my_fab.dart';
import 'package:habittrackertute/components/my_alert_box.dart';
import 'package:habittrackertute/data/habit_database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/login_page.dart';
import 'package:habittrackertute/components/about_page.dart';

import 'faq_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String quote = "Excellence is not an act, but a habit.  Aristotle";

  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    // if there is no current habit list, then it is the 1st time ever opening the app
    // then create default data
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }

    // there already exists data, this is not the first time
    else {
      db.loadData();
    }

    // update the database
    db.updateDatabase();

    super.initState();
  }

  // checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

  // create a new habit
  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    // show alert dialog for user to enter the new habit details
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: 'Enter habit name..',
          onSave: saveNewHabit,
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  // save new habit
  void saveNewHabit() {
    // add new habit to todays habit list
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });

    // clear textfield
    _newHabitNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // cancel new habit
  void cancelDialogBox() {
    // clear textfield
    _newHabitNameController.clear();

    // pop dialog box
    Navigator.of(context).pop();
  }

  // open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: db.todaysHabitList[index][0],
          onSave: () => saveExistingHabit(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  // save existing habit with a new name
  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    db.updateDatabase();
  }

  // delete habit


  // delete habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
        drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('Athul'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage('https://wallpaperaccess.com/full/3225763.jpg'),
            child: Text(' '),
          ), accountEmail: null,
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.question_mark),
          title: Text('FAQ'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FaqPage()),
            );
            // navigate to settings page
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutPage()),
            );
            // navigate to about page
          },
        ),
      ],
    ),
  ),
      floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
      backgroundColor: Colors.transparent,
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://wallpapercave.com/dwp1x/wp8188519.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
        children: [
          Container(
  padding: EdgeInsets.all(16.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(0.0),
    image: DecorationImage(
      image: NetworkImage('https://wallpapercave.com/wp/wp4892354.jpg'),
      fit: BoxFit.cover,
    ),
  ),
  child: Text(
    quote,
    style: TextStyle(
      fontSize: 18.0,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.center,
  ),
),


          
          // monthly summary heat map
          MonthlySummary(
            datasets: db.heatMapDataSet,
            startDate: _myBox.get("START_DATE"),
          ),

          // list of habits
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: db.todaysHabitList.length,
            itemBuilder: (context, index) {
              return HabitTile(
                habitName: db.todaysHabitList[index][0],
                habitCompleted: db.todaysHabitList[index][1],
                onChanged: (value) => checkBoxTapped(value, index),
                settingsTapped: (context) => openHabitSettings(index),
                deleteTapped: (context) => deleteHabit(index),
              );
            },
          )
        ],
      ),
    ));
  }
}
