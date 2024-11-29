library MeetingsScreen;
import 'package:flutter/material.dart';

class MeetingsScreen extends StatefulWidget {
  @override
  _MeetingsScreenState createState() => _MeetingsScreenState();
}

class _MeetingsScreenState extends State<MeetingsScreen> {
  List<String> meetings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meetings'),
      ),
      body: ListView.builder(
        itemCount: meetings.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(meetings[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  meetings.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addMeetingDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addMeetingDialog() {
    String newMeeting = "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Meeting'),
          content: TextField(
            onChanged: (value) {
              newMeeting = value;
            },
            decoration: InputDecoration(hintText: "Meeting Title"),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  if (newMeeting.isNotEmpty) {
                    meetings.add(newMeeting);
                  }
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}