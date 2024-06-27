import 'package:flutter/material.dart';
import 'package:hostelhero/features/bottomnav/bottom_navbar.dart';

class Routine extends StatelessWidget {
  const Routine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => BottomNavBar()));
            },
            icon: Icon(Icons.arrow_back)),
        title: Center(child: Text("Routine")),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Sunday-Friday",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            DataTable(
              columns: [
                DataColumn(
                    label: Text(
                  'Time',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('7:00 AM')),
                  DataCell(Text('Freshen Up')),
                ]),
                DataRow(cells: [
                  DataCell(Text('7:30 AM')),
                  DataCell(Text('Exercise')),
                ]),
                DataRow(cells: [
                  DataCell(Text('8:00 AM')),
                  DataCell(Text('Breakfast')),
                ]),
                DataRow(cells: [
                  DataCell(Text('6:00 PM')),
                  DataCell(Text('Relaxation And Free Time')),
                ]),
                DataRow(cells: [
                  DataCell(Text('7:00 PM')),
                  DataCell(Text('Physical Activity')),
                ]),
                DataRow(cells: [
                  DataCell(Text('8:00 PM')),
                  DataCell(Text('Dinner')),
                ]),
                DataRow(cells: [
                  DataCell(Text('6:00 PM')),
                  DataCell(Text('Relax And Prepare Bed')),
                ]),
              ],
            ),
            //For Saturday
            SizedBox(
              height: 10,
            ),
            Text("Saturday",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            DataTable(
              columns: [
                DataColumn(
                    label: Text(
                  'Time',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text('Description',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('8:00 AM')),
                  DataCell(Text('Freshen Up')),
                ]),
                DataRow(cells: [
                  DataCell(Text('9:00 AM')),
                  DataCell(Text('Breakfast')),
                ]),
                DataRow(cells: [
                  DataCell(Text('12:00 PM')),
                  DataCell(Text('Outdoor Activities')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1:00 PM')),
                  DataCell(Text('Lunch')),
                ]),
                DataRow(cells: [
                  DataCell(Text('4:00 PM')),
                  DataCell(Text('Relaxation And Free Time')),
                ]),
                DataRow(cells: [
                  DataCell(Text('6:00 PM')),
                  DataCell(Text('Indoor Activities')),
                ]),
                DataRow(cells: [
                  DataCell(Text('7:00 PM')),
                  DataCell(Text('Dinner')),
                ]),
                DataRow(cells: [
                  DataCell(Text('9:00 PM')),
                  DataCell(Text('Relax And Prepare Bed')),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
