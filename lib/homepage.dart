import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:karaoke/scanQRcode.dart';
import 'package:permission_handler/permission_handler.dart';
import 'profilepage.dart';
import 'settingspage.dart';
import 'songofdaypage.dart';
import 'genrepage.dart';
import 'librarypage.dart';
import 'playpage.dart';
import 'widgets.dart';
import 'variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      shape: const CircleBorder(),
                    ),
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor,
                      ),
                      child: Center(
                        child: Image.asset('images/account-large.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      shape: const CircleBorder(),
                    ),
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor,
                      ),
                      child: Center(
                        child: Image.asset('images/settings-large.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Text(
              'Melodizz',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 20,
                  ),
                  children: [
                    SquareButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SongOfDayPage()),
                        );
                      },
                      icon: 'images/cup.png',
                      label: 'Song of Day',
                    ),
                    SquareButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GenrePage()),
                        );
                      },
                      icon: 'images/mic.png',
                      label: 'Songs',
                    ),
                    SquareButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LibraryPage()),
                        );
                      },
                      icon: 'images/favorites.png',
                      label: 'Library',
                    ),
                    SquareButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScanQRCodePage()),
                        );
                      },
                      icon: 'images/qr-scan.png',
                      label: 'Scan QR',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
