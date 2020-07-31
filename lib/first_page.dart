import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serveit/blocs/auth_bloc/auth_bloc.dart';
import 'package:serveit/components/button.dart';

class FirstScreen extends StatelessWidget {
  AuthBloc authBloc;
  @override
  Widget build(BuildContext context) {
         authBloc = BlocProvider.of<AuthBloc>(context);

    final loadingOrError =
        BlocBuilder(
          bloc: authBloc ,
          builder: (context, state) {
      if (state is AuthenticatedState) {
        print(state.user.uid);
        return (Text(state.user.displayName+"llll"));
      } else {
        return (Text("This is not even possible"));
      }


    });
    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: Center(child: Column(children: <Widget>[RaisedButton(onPressed: () {
          authBloc.add(LogoutEvent());
        },
        child: Text("Logout"),
        ),
        loadingOrError
        ]
        ,
        ),
      ),
    )
    );
  }
}
