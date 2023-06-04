import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/authentication/widgets/loading_widget.dart';
import 'package:project/features/materi/materi_pages.dart';
import 'package:project/features/profile/profile_pages.dart';
import 'package:project/features/quiz/quiz_pages.dart';
import 'package:project/global_widgets/exit_dialog.dart';
import 'package:project/main.dart';
import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.callbackIndex}) : super(key: key);

  final int callbackIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late int _selectedIndex;
  final ref = firestore.collection("users").doc(auth.currentUser!.uid);

  static const List<Widget> _widgetOptions = <Widget>[
    MateriPages(),
    QuizPages(),
    ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.callbackIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        body: FutureBuilder(
          future: ref.get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Terjadi Kesalahan");
            }
    
            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text("Data tidak ditemukan");
            }
    
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              sharedPreferences.setString("name", data['name']);
              sharedPreferences.setString("email", data['email']);
              sharedPreferences.setString("avatar", data['avatar']);
              sharedPreferences.setInt("quia_h0a", data['quiz_hijaiyah0_attempts']);
              sharedPreferences.setInt("quiz_k7a", data['quiz_kosakata7_attempts']);
              sharedPreferences.setInt("quiz_k9a", data['quiz_kosakata9_attempts']);
              return Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              );
            }
    
            return const AuthLoading();
          },
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColor.primaryDarkest,
                width: 4,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColor.primaryBase,
            unselectedItemColor: AppColor.whiteBase,
            unselectedLabelStyle: TextStyles.subtitle2,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_outlined),
                label: 'Materi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.extension_outlined),
                label: 'Quiz',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded),
                label: 'Profile',
              ),
            ],
            onTap: _onItemTapped,
            selectedItemColor: AppColor.primaryDarkest,
          ),
        ),
      ),
    );
  }
}
