import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serveit/blocs/auth_bloc/auth_bloc.dart';

class FirstScreen extends StatelessWidget {
  AuthBloc authBloc;
  @override
  Widget build(BuildContext context) {
    final loadingOrError =
        BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthenticatedState) {
        print(state.user);
        return (Text("Correct"));
      } else {
        return (Text("SOMETHING IS FKN WRONG"));
      }
    });
    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: loadingOrError,
      ),
    );
  }
}
