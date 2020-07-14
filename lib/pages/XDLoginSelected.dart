import 'package:flutter/material.dart';
import 'package:serveit/pages/signin_page.dart';
import './XDBarsAppleiOSUIBarsStatusBariPhoneXSOnLight.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XDLoginSelected extends StatelessWidget {
  XDLoginSelected({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(21.0, 14.83),
            child:
                // Adobe XD layer: 'Bars/Apple iOS UI/B…' (component)
                XDBarsAppleiOSUIBarsStatusBariPhoneXSOnLight(),
          ),
          Transform.translate(
            offset: Offset(154.5, 688.5),
            child:
                // Adobe XD layer: 'SKIP' (text)
                SizedBox(
              width: 66.0,
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(184.8, 767.31),
            child:
                // Adobe XD layer: 'Path' (shape)
                SvgPicture.string(
              _svg_h7mq5x,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(143.0, 113.0),
            child: SizedBox(
              width: 98.0,
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 29,
                  color: const Color(0xff000000),
                  letterSpacing: -0.7250000000000001,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(30.0, 219.0),
            child:
                // Adobe XD layer: 'form' (group)
                Stack(
              children: <Widget>[
                // Adobe XD layer: 'field' (group)
                Stack(
                  children: <Widget>[
                    // Adobe XD layer: 'field' (group)
                    Stack(
                      children: <Widget>[
                        // Adobe XD layer: 'navbar-bg' (shape)
                        Container(
                          width: 315.0,
                          height: 63.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xff7ddbe4),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x0d000000),
                                offset: Offset(0, 5),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(20.0, 22.0),
                          child:
                              // Adobe XD layer: 'Test' (text)
                              Text(
                            'Email',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Transform.translate(
                  offset: Offset(0.0, 87.0),
                  child:
                      // Adobe XD layer: 'field' (group)
                      Stack(
                    children: <Widget>[
                      // Adobe XD layer: 'field' (group)
                      Stack(
                        children: <Widget>[
                          // Adobe XD layer: 'navbar-bg' (shape)
                          Container(
                            width: 315.0,
                            height: 63.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xff7ddbe4),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x0d000000),
                                  offset: Offset(0, 5),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(20.0, 22.0),
                            child:
                                // Adobe XD layer: 'Test' (text)
                                Text(
                              'Password',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                color: const Color(0xffffffff),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(0.0, 182.0),
                  child:
                      // Adobe XD layer: 'button-dark' (group)
                      Stack(
                    children: <Widget>[
                      // Adobe XD layer: 'button' (group)
                      Stack(
                        children: <Widget>[
                          RaisedButton(
                            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage())),
                            child: Text("WOOOOW"),
                          ),
                          InkWell(
                            onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage())) ,
                            child:
                          // Adobe XD layer: 'Rectangle 3' (shape)
                          Container(
                            width: 315.0,
                            height: 60.0,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xff20bf55),
                            ),
                          )),
                          Transform.translate(
                            offset: Offset(124.5, 19.0),
                            child:
                                // Adobe XD layer: 'sign up' (text)
                                SizedBox(
                              width: 66.0,
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(8.0, 310.0),
                  child:
                      // Adobe XD layer: 'social-buttons' (group)
                      Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(-8.0, 0.0),
                        child:
                            // Adobe XD layer: 'social-button-3' (group)
                            Stack(
                          children: <Widget>[
                            // Adobe XD layer: 'Rectangle 3' (shape)
                            Container(
                              width: 158.0,
                              height: 102.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xff000000),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(70.29, 35.89),
                              child:
                                  // Adobe XD layer: 'apple-seeklogo.com' (group)
                                  Stack(
                                children: <Widget>[
                                  SvgPicture.string(
                                    _svg_y4ka9v,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(157.61, 0.0),
                        child:
                            // Adobe XD layer: 'social-button-2' (group)
                            Stack(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(0.39, 0.0),
                              child:
                                  // Adobe XD layer: 'Rectangle 3' (shape)
                                  Container(
                                width: 149.0,
                                height: 102.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x1a000000),
                                      offset: Offset(0, 1),
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(66.67, 41.88),
                              child:
                                  // Adobe XD layer: 'google' (group)
                                  Stack(
                                children: <Widget>[
                                  // Adobe XD layer: 'Shape' (shape)
                                  SvgPicture.string(
                                    _svg_vb7bkg,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(10.0, 274.0),
                  child:
                      // Adobe XD layer: 'login with' (text)
                      Text(
                    'login with',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: const Color(0xff212a37),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(47.0, 729.0),
            child:
                // Adobe XD layer: 'Have’nt Account? Sig' (text)
                SizedBox(
              width: 270.0,
              height: 19.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: const Color(0xff444444),
                  ),
                  children: [
                    TextSpan(
                      text: 'No Account ?',
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                        color: const Color(0xff000000),
                      ),
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: const Color(0xff64c6cf),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_h7mq5x =
    '<svg viewBox="184.8 767.3 7.2 13.2" ><path transform="translate(184.8, 767.31)" d="M 7.165123462677002 13.1683349609375 L 0 6.58416748046875 L 7.165123462677002 0 L 7.165123462677002 0" fill="none" stroke="#64c6cf" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_y4ka9v =
    '<svg viewBox="0.0 0.0 18.3 22.5" ><path transform="translate(0.0, 0.0)" d="M 15.28127193450928 11.93829345703125 C 15.31286430358887 15.33893203735352 18.26450729370117 16.47057151794434 18.2972412109375 16.48501014709473 C 18.27229690551758 16.56477355957031 17.82558631896973 18.09766578674316 16.7421932220459 19.6810188293457 C 15.80560302734375 21.04995346069336 14.83349132537842 22.41381072998047 13.30224227905273 22.44211196899414 C 11.79758262634277 22.46977233886719 11.31377792358398 21.54983711242676 9.593554496765137 21.54983711242676 C 7.873830318450928 21.54983711242676 7.336277484893799 22.41381072998047 5.911960601806641 22.46977233886719 C 4.433880805969238 22.52573776245117 3.308344602584839 20.98955535888672 2.363964796066284 19.6256275177002 C 0.434243381023407 16.83580207824707 -1.040462017059326 11.74209785461426 0.9396976232528687 8.303792953491211 C 1.923394799232483 6.59635591506958 3.68134331703186 5.515111446380615 5.589436054229736 5.487386703491211 C 7.040870189666748 5.45969820022583 8.410881996154785 6.463864803314209 9.298152923583984 6.463864803314209 C 10.18485450744629 6.463864803314209 11.84968662261963 5.256269931793213 13.5998592376709 5.433624267578125 C 14.33253479003906 5.464114665985107 16.38918304443359 5.729581356048584 17.70980072021484 7.662604331970215 C 17.6033763885498 7.728574752807617 15.25575733184814 9.095219612121582 15.28127193450928 11.93829345703125 M 12.45349502563477 3.587877750396729 C 13.23820209503174 2.638001680374146 13.76639175415039 1.315691590309143 13.62230110168457 0 C 12.49116134643555 0.04546073079109192 11.12344455718994 0.7537453770637512 10.31207656860352 1.703099608421326 C 9.584977149963379 2.543792486190796 8.948219299316406 3.889374494552612 9.120041847229004 5.179028511047363 C 10.38076305389404 5.276568412780762 11.66871547698975 4.538354396820068 12.45349502563477 3.587877750396729" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vb7bkg =
    '<svg viewBox="0.0 0.0 18.0 18.0" ><path transform="translate(0.0, 4.86)" d="M 3.989179611206055 6.016640663146973 L 3.362624883651733 8.355656623840332 L 1.072582006454468 8.404101371765137 C 0.3881953060626984 7.13471508026123 0 5.682374954223633 0 4.139015674591064 C 0 2.646597623825073 0.3629531264305115 1.239222645759583 1.006312489509583 0 L 1.006804704666138 0 L 3.045585870742798 0.3737812638282776 L 3.938695430755615 2.400328159332275 C 3.751769542694092 2.945285081863403 3.649886608123779 3.530285120010376 3.649886608123779 4.139015674591064 C 3.649956941604614 4.799671649932861 3.769629001617432 5.432660102844238 3.989179611206055 6.016640663146973 Z" fill="#fbbb00" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(9.2, 7.32)" d="M 8.64488697052002 0 C 8.748246192932129 0.5444296598434448 8.802140235900879 1.106683611869812 8.802140235900879 1.681312441825867 C 8.802140235900879 2.325656175613403 8.734394073486328 2.954179763793945 8.60533618927002 3.560449123382568 C 8.167219161987305 5.623523235321045 7.022425651550293 7.425000190734863 5.436562538146973 8.699835777282715 L 5.436070442199707 8.699343681335449 L 2.868117094039917 8.568316459655762 L 2.504671812057495 6.299507617950439 C 3.556968688964844 5.682374954223633 4.37934398651123 4.716597557067871 4.812539100646973 3.560449123382568 L 0 3.560449123382568 L 0 0 L 4.88274621963501 0 L 8.64488697052002 0 L 8.64488697052002 0 Z" fill="#518ef8" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(1.07, 10.88)" d="M 13.56131267547607 5.140371322631836 L 13.56180477142334 5.140863418579102 C 12.01946449279785 6.38057804107666 10.06020736694336 7.122339725494385 7.927417755126953 7.122339725494385 C 4.5 7.122339725494385 1.520121097564697 5.206640720367432 0 2.387460947036743 L 2.916597604751587 0 C 3.676640510559082 2.028445243835449 5.633402347564697 3.472418069839478 7.927417755126953 3.472418069839478 C 8.913445472717285 3.472418069839478 9.837210655212402 3.205863237380981 10.62987899780273 2.740535259246826 L 13.56131267547607 5.140371322631836 Z" fill="#28b446" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(1.01, 0.0)" d="M 13.73835945129395 2.071968793869019 L 10.82274627685547 4.458937644958496 C 10.00237464904785 3.94614839553833 9.032625198364258 3.649921894073486 7.993687629699707 3.649921894073486 C 5.647746086120605 3.649921894073486 3.654386758804321 5.160129070281982 2.932417869567871 7.261312484741211 L 0.0004921875079162419 4.860984325408936 L 0 4.860984325408936 C 1.497867226600647 1.973074197769165 4.515327930450439 0 7.993687629699707 0 C 10.17741775512695 0 12.17967224121094 0.7778671979904175 13.73835945129395 2.071968793869019 Z" fill="#f14336" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
