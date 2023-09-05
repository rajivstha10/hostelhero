import 'package:flutter/material.dart';
import 'package:hostelhero/features/view/calendar.dart';
import 'package:hostelhero/features/view/homepage.dart';
import 'package:hostelhero/features/view/notice.dart';
import 'package:hostelhero/features/view/profile.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  Future _qrScanner() async {
    var cameraStatus = await Permission.camera.status;

    if (cameraStatus.isGranted) {
      String? qrdata = await scanner.scan();
      return qrdata;
    } else {
      var isGrant = await Permission.camera.request();

      if (isGrant.isGranted) {
        String? qrdata = await scanner.scan();
        return qrdata;
      }
    }

    //String? qrdataphoto = await scanner.scanPhoto(); <=to open gallery and selevt qr
  }

  int index = 0;

  final screens = [
    //Screens boottom navbar eg: eventspage()
    Dashboard(),
    Calendar(),
    Notice(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/hostel_hero.png",
          height: 50,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  _qrScanner();
                });
              },
              icon: Icon(
                Icons.qr_code_2,
                color: Colors.black,
              )),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStatePropertyAll(TextStyle(
                color: Colors.blue.shade100,
                fontSize: 14,
                fontWeight: FontWeight.w500))),
        child: NavigationBar(
            height: 60,
            backgroundColor: Colors.indigo.shade900,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: index,
            animationDuration: Duration(seconds: 1),
            onDestinationSelected: (index) => setState(() {
                  this.index = index;
                }),
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                  icon: Icon(
                    Icons.event_outlined,
                    color: Colors.white,
                  ),
                  selectedIcon: Icon(Icons.event),
                  label: 'Events'),
              NavigationDestination(
                  icon: Icon(
                    Icons.mark_email_unread_outlined,
                    color: Colors.white,
                  ),
                  selectedIcon: Icon(Icons.mark_email_unread),
                  label: 'Notice'),
              NavigationDestination(
                  icon: Icon(
                    Icons.person_2_outlined,
                    color: Colors.white,
                  ),
                  selectedIcon: Icon(Icons.person),
                  label: 'Profile'),
            ]),
      ),
    );
  }
}
