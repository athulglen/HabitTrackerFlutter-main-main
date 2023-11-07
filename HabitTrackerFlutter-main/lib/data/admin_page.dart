import 'package:flutter/material.dart';
import 'package:habittrackertute/screens/login_page.dart';
import '../pages/logout_page.dart';
import 'login_page.dart';
// <-- import the logout page

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<String> _users = ['User 1:\nUsername = athul \nPassword = 682528', 'User 2: \nUsername = Shalwin \nPassword = Shalwin123', 'User 3: \nUsername = Aedrin \nPassword = Aedein123'];
  String _selectedUser = '';

  void _handleUserSelected(String user) {
    setState(() {
      _selectedUser = user;
    });
  }

  void _handleAddUserPressed() {
    showDialog(
      context: context,
      builder: (context) {
        final _newUserController = TextEditingController();

        return AlertDialog(
          title: Text('Add New User'),
          content: TextField(
            controller: _newUserController,
            decoration: InputDecoration(
              labelText: 'New User Name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String newUser = _newUserController.text;
                setState(() {
                  _users.add(newUser);
                  Navigator.pop(context);
                });
              },
              child: Text('Add User'),
            ),
          ],
        );
      },
    );
  }

  void _handleRemoveUserPressed() {
    setState(() {
      _users.remove(_selectedUser);
      _selectedUser = '';
    });
  }

@override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool confirm = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Confirm Logout'),
              content: Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text('Logout'),
                ),
              ],
            );
          },
        );
        if (confirm == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Admin Page'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogoutPage()),
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://w0.peakpx.com/wallpaper/625/927/HD-wallpaper-white-geo-2-i1080-abstract-geometric-gray-light-vertical.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Users:'),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_users[index]),
                      selected: _users[index] == _selectedUser,
                      onTap: () => _handleUserSelected(_users[index]),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _handleAddUserPressed,
                    child: const Text('Add User'),
                  ),
                  ElevatedButton(
                    onPressed:
                        _selectedUser.isEmpty ? null : _handleRemoveUserPressed,
                    child: const Text('Remove User'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
