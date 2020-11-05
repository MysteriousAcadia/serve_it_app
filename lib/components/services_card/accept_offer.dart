import 'package:flutter/material.dart';
import 'package:serveit/services/localstorage_service.dart';
import 'package:serveit/services/serveit_api_service.dart';
import 'package:http/http.dart' as http;

class AcceptServicesCard extends StatelessWidget {
  final bool isScheduled;
  AcceptServicesCard({this.isScheduled = false});
  @override
  Widget build(BuildContext context) {
    LocalStorageService localStorageService;
    UserApiClient client = UserApiClient(
        httpClient: http.Client(), localStorageService: localStorageService);
    return Card(
      color: Color(0xFFDCF3E9),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 30,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 35,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Peter H.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF005C7E),
                      ),
                    ),
                    Text(
                      'Room no. 102',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF005C7E),
                      ),
                    ),
                    Text(
                      '2nd floor',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF005C7E),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Shopping',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF005C7E),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            if (isScheduled)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5.0,
                      onPressed: () {
                        // TODO service id
                        client.markAsDone('serviceID_100');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                        child: Text(
                          'Mark as done',
                          style: TextStyle(
                            color: Color(0xFF005C7E),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5.0,
                      onPressed: () {
                        // TODO req id and token
                        client.cancelServiceProvider('requestID', 'token');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(0xFF005C7E),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5.0,
                  onPressed: () {
                    // TODO service id
                    client.acceptService('serviceID');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28.0,
                      vertical: 5.0,
                    ),
                    child: Text(
                      'Accept',
                      style: TextStyle(
                        color: Color(0xFF005C7E),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
