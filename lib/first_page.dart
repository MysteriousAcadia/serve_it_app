import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serveit/blocs/auth_bloc/auth_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/pages/intro_page.dart';

class FirstScreen extends StatelessWidget {
  AuthBloc authBloc;
  @override
  Widget build(BuildContext context) {
    authBloc = BlocProvider.of<AuthBloc>(context);

    final loadingOrError = BlocBuilder(
        bloc: authBloc,
        builder: (context, state) {
          if (state is AuthenticatedState) {
            print(state.user.uid);
            return (Text(state.user.displayName + "llll"));
          } else {
            return (Text("This is not even possible"));
          }
        });
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    authBloc.add(LogoutEvent());
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => IntroPage()));
                    });
                  },
                  child: Text("Logout"),
                ),
                loadingOrError
              ],
            ),
          ),
        ));
  }
}
