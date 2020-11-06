import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search_widget/search_widget.dart';
import 'package:serveit/blocs/provide_bloc/provide_page_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/components/recents_card.dart';
import 'package:serveit/components/services_provide_card.dart';
import 'package:serveit/components/services_search_card.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_provider.dart';
import 'package:serveit/models/service_recents.dart';
import 'package:serveit/models/verify_service.dart';
import 'package:serveit/utils/constants.dart';

class ProvidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProvidePageBloc providePageBloc =
        BlocProvider.of<ProvidePageBloc>(context);
    providePageBloc.add(ProvidePageReload());
    Future<String> _refreshPage() async {
      providePageBloc.add(ProvidePageReload());
      return ("Success");
    }

    Widget _body(List<VerifyService> service, List<ServiceRecents> offers,
        List<ServiceRecents> scheduled, var context) {
      print("WHOT" +
          service.length.toString() +
          offers.length.toString() +
          scheduled.length.toString());
      return ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'What services are you providing?',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 30,
                color: const Color(0xff606060),
                letterSpacing: -0.675,
                fontWeight: FontWeight.w700,
                height: 1.1851851851851851,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: SearchWidget<VerifyService>(
              dataList: service,
              hideSearchBoxWhenItemSelected: false,
              listContainerHeight: MediaQuery.of(context).size.height / 4,
              queryBuilder: (String query, List<VerifyService> list) {
                return list
                    .where((VerifyService item) => item.service.name
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                    .toList();
              },
              popupListItemBuilder: (VerifyService item) {
                return ServicesSearchCard(
                    item.service, Constants.cardColors[0]);
              },
              selectedItemBuilder:
                  (dynamic selectedItem, VoidCallback deleteSelectedItem) {
                return ServicesProvideCard(
                    selectedItem, Constants.cardColors[1]);
              },
              // widget customization
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
              child: Text(
                'Scheduled',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 27,
                  color: const Color(0xff606060),
                  letterSpacing: -0.525,
                  fontWeight: FontWeight.w700,
                  height: 1.1904761904761905,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            height: 205,
            child: (scheduled != null || scheduled.length != 0)
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: scheduled
                        .map((e) =>
                            ServicesProvideCard(e, Constants.cardColors[0]))
                        .toList(),
                  )
                : Center(
                    child: Text("Nothing to Show"),
                  ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
              child: Text(
                'Offers',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 27,
                  color: const Color(0xff606060),
                  letterSpacing: -0.525,
                  fontWeight: FontWeight.w700,
                  height: 1.1904761904761905,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            height: 205,
            child: (offers != null || offers.length != 0)
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: offers
                        .map((e) =>
                            ServicesProvideCard(e, Constants.cardColors[0]))
                        .toList(),
                  )
                : Center(
                    child: Text("Nothing to Show"),
                  ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
              child: Text(
                'Offer other services',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 27,
                  color: const Color(0xff606060),
                  letterSpacing: -0.525,
                  fontWeight: FontWeight.w700,
                  height: 1.1904761904761905,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          ...scheduled
              .map((e) => ServicesProvideCard(e, Constants.cardColors[0]))
              .toList(),
        ],
      );
    }

    Widget page = BlocBuilder<ProvidePageBloc, ProvidePageState>(
        builder: (context, state) {
      if (state is ProvidePageBloc) {
        providePageBloc.add(ProvidePageReload());
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ProvidePageLoading) {
        return CircularProgressIndicator();
      } else if (state is ProvidePageSuccess) {
         print("WHOT" +
          state.services.length.toString() +
          state.offers.length.toString() +
          state.scheduled.length.toString());
        return _body(state.services, state.offers, state.scheduled, context);
      } else if (state is ProvidePageFailure) {
        return Center(
          child: Text("SOmething went wrong"),
        );
      }
      print(state.toString());
      return Center(
        child: Text("SOmething DEFFF wrong"),
      );
    });

    return SafeArea(
      child: Center(
        child: RefreshIndicator(child: page, onRefresh: _refreshPage),
      ),
    );
  }
}
