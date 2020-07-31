import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/constants.dart';
import 'package:serveit/pages/signin_page.dart';

class IntroPage extends StatelessWidget {
  IntroPage({
    Key key,
  }) : super(key: key);

  void goToLogin(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Main Stack
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
              //Background
              child: Transform.translate(
            offset: Offset(0, 150),
            child: SvgPicture.string(_svg_8isoop,
                allowDrawingOutsideViewBox: true),
          )),
          //Logo at top
          Transform.translate(
              offset: Offset(0, 100),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 145.0,
                      height: 145.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(72.5, 72.5)),
                        color: const Color(0xff7ddbe4),
                      ),
                      child: Center(
                        child: Text(
                          'Logo',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: const Color(0xffffffff),
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ])),
          //MAIN TITLE, SUMMARY, LOGIN SIGNUP
          Container(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                    offset: Offset(0, -70),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal:2.0,vertical:30.0),
                          width: 164.0,
                          child: Text(
                            'Main logo text',
                            style:Constants.buttonTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                            color: Constants.white,
                            fontSize: 24),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15,6.0,15,50),
                          child:
                        Text(
                          'A very long description like: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidi.',
                          style: Constants.buttonTextStyle.copyWith(
                            fontSize: 16,
                            color: Constants.white,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                        )),

                          Button("Login", Constants.white,
                              Constants.buttonTextStyle, ()=> {
                            goToLogin(context)
                          })
                        ,
                        Button("Signup", Constants.transparent, Constants.buttonTextStyle.copyWith(color:Constants.white),
                                ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()))),
                      ],
                    ))),

          ),

        ],
      ),
    );
  }
}


const String _svg_8isoop =
    '<svg viewBox="0.0 301.8 375.0 509.9" ><path transform="translate(0.0, 281.19)" d="M 0 169.9021759033203 C 0 126.0115585327148 30.69034004211426 87.64903259277344 74.69020843505859 76.54041290283203 L 287.2831420898438 22.86715507507324 C 331.6454772949219 11.66701316833496 375 43.96819686889648 375 88.22039794921875 L 375 530.5276489257812 L -6.505213034913027e-16 530.5276489257812 L 0 169.9021759033203 Z" fill="#9bdce7" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_1i58gx =
    '<svg viewBox="184.8 767.3 7.2 13.2" ><path transform="translate(184.8, 767.31)" d="M 7.165123462677002 13.1683349609375 L 0 6.58416748046875 L 7.165123462677002 0 L 7.165123462677002 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
