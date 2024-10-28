import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'images/'), // Replace with student's profile image
            ),
            SizedBox(height: 10),
            Text(
              'Anas ben abderrahmane',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              'Grade: 10 | ID: 12345',
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.blue),
                      title: Text('anas@gmail.com'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.blue),
                      title: Text('+212 623 456 789'),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_city, color: Colors.blue),
                      title: Text('1234 Elmaarif, CASABLANCA'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn('Subjects', '10%'),
                _buildStatColumn('Attendance', '95%'),
                _buildStatColumn('GPA', '3.8'),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'WelcomePage');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 30.0,
                      color: Colors.black,
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      'Log out',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.blue[100]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    );
  }
}
