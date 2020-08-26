import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serveit/blocs/settings_bloc/settings_bloc_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/constants.dart';
import 'package:serveit/pages/auth/signin_page.dart';
import 'package:serveit/pages/auth/signup_page.dart';
import 'package:serveit/pages/dashboard/deliver_page.dart';
import 'package:serveit/pages/dashboard/finances_page.dart';
import 'package:serveit/pages/dashboard/receive_page.dart';
import 'package:serveit/pages/dashboard/settings_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  SettingsBloc settingsBloc;
  @override
  Widget build(BuildContext context) {
    settingsBloc = BlocProvider.of<SettingsBloc>(context);
    settingsBloc.add(GetSettingsEvent());
    print(_currentIndex);
    Widget indexedStack = BlocBuilder<SettingsBloc, SettingsState>(
      bloc: settingsBloc,
      builder: (context, state) {
        var widgetList = <Widget>[];
        if (state is SettingsLoaded) {
          if (state.settings.isProvideServicesEnabled) {
            widgetList.add(DeliverPage());
          }
          if (state.settings.isReceiveServicesEnabled) {
            widgetList.add(ReceivePage());
          }
          widgetList.add(FinancesPage());
          widgetList.add(ProfilePage());
        } else {
          widgetList.add(Center(
            child: CircularProgressIndicator(
              value: 1.0,
            ),
          ));
        }
        return IndexedStack(
          index: _currentIndex,
          children: widgetList,
        );
      },
    );
    Widget bottomNavBar = BlocBuilder<SettingsBloc, SettingsState>(
      bloc: settingsBloc,
      builder: (context, state) {
        var navIcons = <BottomNavigationBarItem>[];
        if (state is SettingsLoaded) {
          if (state.settings.isProvideServicesEnabled) {
            navIcons.add(
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  "Provide",
                ),
              ),
            );
          }
          if (state.settings.isReceiveServicesEnabled) {
            navIcons.add(
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  "Receive",
                ),
              ),
            );
          }
          navIcons.add(
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "Finances",
              ),
            ),
          );
          navIcons.add(
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "Profile",
              ),
            ),
          );
        } else {
          navIcons.add(
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "Finances",
              ),
            ),
          );
          navIcons.add(
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "Profile",
              ),
            ),
          );
        }
        return BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: navIcons,
        );
      },
    );
    return Scaffold(
      body: SafeArea(top: false, child: indexedStack),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
