import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serveit/blocs/settings_bloc/settings_bloc_bloc.dart';
import 'package:serveit/components/button.dart';
import 'package:serveit/components/checkbox.dart';
import 'package:serveit/models/settings.dart';

import '../../utils/constants.dart';
// import 'package:adobe_xd/specific_rect_clip.dart';

class OnboardingInPage extends StatelessWidget {
  SettingsBloc settingsBloc;
  @override
  Widget build(BuildContext context) {
    
    settingsBloc = BlocProvider.of<SettingsBloc>(context);
    settingsBloc.add(GetSettingsEvent());
    final provideServices = BlocBuilder<SettingsBloc,SettingsState>(
      bloc: settingsBloc,
      builder: (context, state) {
        var value = false;
        var disabled = true;
        if (state is SettingsLoaded) {
          value = state.settings.isProvideServicesEnabled;
          disabled = false;
        }
        return (LabeledCheckbox(
          label: "Provide Services",
          onChanged: (value) =>
              {settingsBloc.add(UpdateProvideEvent(value: value))},
          padding: EdgeInsets.zero,
          value: value,
          disabled: disabled,
        ));
      },
    );
    final receiveServices = BlocBuilder<SettingsBloc,SettingsState>(
      bloc: settingsBloc,
      builder: (context, state) {
        var value = false;
        var disabled = true;
        if (state is SettingsLoaded) {
          value = state.settings.isReceiveServicesEnabled;
          disabled = false;
        }
        return (LabeledCheckbox(
          label: "Receive Services",
          onChanged: (value) =>
              {settingsBloc.add(UpdateReceiveEvent(value: value))},
          padding: EdgeInsets.zero,
          value: value,
          disabled: disabled,
        ));
      },
    );

    return Scaffold(
      backgroundColor: const Color(0xff11d68a),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'You\'re onboard!',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 36,
                    color: const Color(0xffffffff),
                    letterSpacing: -0.7250000000000001,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  child: SvgPicture.string(
                    _svg_170zv1,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                Text(
                  'Do you want to..',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 33,
                    color: const Color(0xffffffff),
                    letterSpacing: -0.7250000000000001,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                provideServices,
                receiveServices,
                Text(
                  'You can change these in Settings later',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: const Color(0xffffffff),
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: Button(
                    "Setup your Profile",
                    const Color(0xff9bdce7),
                    Constants.buttonTextStyle.copyWith(color: Constants.white),
                    () => {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ivuv51 =
    '<svg viewBox="68.9 81.5 190.3 107.5" ><path transform="translate(-222.06, -246.96)" d="M 467.9869384765625 419.760009765625 L 342.3636169433594 419.760009765625 C 340.0486450195312 419.75732421875 338.1726684570312 417.88134765625 338.1699829101562 415.5663452148438 L 338.1699829101562 338.1076049804688 C 338.1726684570312 335.7926330566406 340.0486450195312 333.9166259765625 342.3636169433594 333.9139709472656 L 467.9869384765625 333.9140014648438 C 470.3018798828125 333.9166564941406 472.1779174804688 335.7926635742188 472.1806030273438 338.1076049804688 L 472.1805419921875 415.5663452148438 C 472.1779174804688 417.88134765625 470.3018798828125 419.75732421875 467.9869384765625 419.7599792480469 Z" fill="#e6e6e6" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-173.54, -305.03)" d="M 249.5726470947266 494.0477294921875 C 248.4833984375 494.0496520996094 247.4676208496094 493.4986267089844 246.8752899169922 492.5845336914062 L 242.91845703125 486.4713745117188 C 241.9585266113281 484.9839172363281 242.3834075927734 483.0001831054688 243.8683319091797 482.0363159179688 L 294.8184204101562 449.0582580566406 C 296.3057861328125 448.0983581542969 298.2894287109375 448.5233764648438 299.2529602050781 450.0083618164062 L 303.2097778320312 456.1215209960938 C 304.1723327636719 457.6083068847656 303.7470092773438 459.5939331054688 302.2598876953125 460.5560302734375 L 251.3102874755859 493.5341186523438 C 250.7929840087891 493.869873046875 250.1893615722656 494.0483093261719 249.5726470947266 494.0477294921875 Z" fill="#9bdce7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-173.78, -322.73)" d="M 251.3943481445312 510.8191528320312 L 272.6927490234375 498.9265747070312 C 274.072509765625 498.1560974121094 274.6038208007812 496.4377136230469 273.899658203125 495.02294921875 L 268.965576171875 485.1098022460938 C 268.5709228515625 484.31689453125 267.8419494628906 483.7423400878906 266.978759765625 483.5438842773438 C 266.1155700683594 483.3454284667969 265.2088623046875 483.5439453125 264.5075378417969 484.0848693847656 L 244.2174987792969 499.7349243164062 C 242.8478240966797 500.6245727539062 242.4552917480469 502.4541625976562 243.3394775390625 503.827392578125 L 247.2970581054688 509.9417114257812 C 248.1870727539062 511.3141479492188 250.0203247070312 511.7067260742188 251.3943481445312 510.8191528320312 Z" fill="#cccccc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-231.4, -241.39)" d="M 361.2452697753906 322.9140014648438 C 359.2025756835938 322.9161987304688 357.5472412109375 324.5715637207031 357.5450134277344 326.6142578125 L 357.5450134277344 404.072998046875 C 357.5472412109375 406.1156921386719 359.2025756835938 407.7710571289062 361.2453002929688 407.7732543945312 L 486.8690795898438 407.7732543945312 C 488.9117431640625 407.7710571289062 490.5670776367188 406.1156921386719 490.5693359375 404.072998046875 L 490.5693359375 326.6142578125 C 490.5670776367188 324.5715637207031 488.9117431640625 322.9161987304688 486.8690795898438 322.9139709472656 L 361.2452697753906 322.9140014648438 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bg30m0 =
    '<svg viewBox="55.5 114.0 49.9 173.9" ><path transform="translate(-165.36, -384.44)" d="M 236.7479858398438 672.3749389648438 L 229.4658813476562 672.3749389648438 C 227.6956176757812 672.3729248046875 226.2610473632812 670.9383544921875 226.2589721679688 669.1680908203125 L 226.2589874267578 608.4769287109375 C 226.2610168457031 606.7066650390625 227.6955871582031 605.2720336914062 229.4658813476562 605.27001953125 L 236.7478942871094 605.27001953125 C 238.5181732177734 605.2720947265625 239.9527587890625 606.7066650390625 239.9547729492188 608.4769287109375 L 239.9547729492188 669.1680908203125 C 239.9527282714844 670.9382934570312 238.5182189941406 672.3728637695312 236.7479858398438 672.3749389648438 Z" fill="#2f2e41" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-180.15, -384.44)" d="M 265.9400024414062 672.3749389648438 L 258.6578674316406 672.3749389648438 C 256.8876037597656 672.3729248046875 255.4530334472656 670.9383544921875 255.4509582519531 669.1680908203125 L 255.4509735107422 608.4769287109375 C 255.4530029296875 606.7066650390625 256.8876037597656 605.2720947265625 258.6578674316406 605.27001953125 L 265.9398803710938 605.27001953125 C 267.7101440429688 605.2720947265625 269.1447143554688 606.7066650390625 269.1467895507812 608.4769287109375 L 269.1467895507812 669.1680908203125 C 269.1447143554688 670.9382934570312 267.710205078125 672.372802734375 265.9400024414062 672.3749389648438 Z" fill="#2f2e41" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-159.82, -316.03)" d="M 251.6058807373047 546.962890625 L 218.5193939208984 546.962890625 C 216.7491302490234 546.9608154296875 215.3145446777344 545.5262451171875 215.3125 543.7559814453125 L 215.3125 487.95654296875 C 215.3236083984375 478.1855163574219 223.2417602539062 470.2672424316406 233.0128173828125 470.2560119628906 L 251.6056823730469 470.2560119628906 C 253.3759460449219 470.2580871582031 254.8105010986328 471.692626953125 254.8125762939453 473.4629211425781 L 254.8125762939453 543.7559814453125 C 254.8105010986328 545.5261840820312 253.3760681152344 546.960693359375 251.6058807373047 546.962890625 Z" fill="#cccccc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-204.05, -274.75)" d="M 302.6387939453125 405.5587768554688 L 302.611328125 404.5720520019531 C 304.447021484375 404.52099609375 306.0653991699219 404.4058227539062 307.2814636230469 403.5173950195312 C 307.9790649414062 402.978759765625 308.4078979492188 402.1632995605469 308.4563598632812 401.2832641601562 C 308.4996337890625 400.74462890625 308.289306640625 400.216552734375 307.8875732421875 399.8551635742188 C 307.08056640625 399.1729431152344 305.7816162109375 399.3936157226562 304.8346252441406 399.8281860351562 L 304.0181884765625 400.2025756835938 L 305.5838317871094 388.7611694335938 L 306.5614013671875 388.8951110839844 L 305.2294921875 398.62744140625 C 306.51611328125 398.2492370605469 307.7078857421875 398.41162109375 308.5242919921875 399.1015625 C 309.1597290039062 399.6563110351562 309.4992980957031 400.4762573242188 309.442138671875 401.31787109375 C 309.3838195800781 402.5007019042969 308.8059692382812 403.5973510742188 307.8632507324219 404.314208984375 C 306.3005676269531 405.4561767578125 304.2703857421875 405.5128784179688 302.6387939453125 405.5587768554688 Z" fill="#2f2e41" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_afsd0l =
    '<svg viewBox="138.5 91.9 111.7 4.0" ><path transform="translate(-585.72, -232.49)" d="M 726.1640014648438 324.4140014648438 C 725.062744140625 324.4140014648438 724.1699829101562 325.3067932128906 724.1699829101562 326.4080505371094 C 724.1699829101562 327.5093078613281 725.062744140625 328.402099609375 726.1640014648438 328.402099609375 L 833.841796875 328.402099609375 C 834.943115234375 328.402099609375 835.8358764648438 327.5093078613281 835.8358764648438 326.4080505371094 C 835.8358764648438 325.3067932128906 834.943115234375 324.4140014648438 833.841796875 324.4140014648438 L 726.1640014648438 324.4140014648438 Z" fill="#9bdce7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_170zv1 =
    '<svg viewBox="56.8 80.4 58.9 146.1" ><path transform="translate(-179.27, -325.19)" d="M 285.3633422851562 551.7633666992188 C 284.17529296875 551.7623291015625 283.08447265625 551.1065673828125 282.5262451171875 550.0578002929688 L 254.076171875 496.4479370117188 C 253.2484283447266 494.8832397460938 253.84326171875 492.9437561035156 255.4059448242188 492.1121826171875 L 261.8380432128906 488.6986083984375 C 263.4028015136719 487.8709106445312 265.3422546386719 488.4654541015625 266.1742858886719 490.0278930664062 L 294.6241455078125 543.6377563476562 C 295.4520263671875 545.2025756835938 294.8573303222656 547.1422119140625 293.2946166992188 547.9739990234375 L 286.8622741699219 551.3875732421875 C 286.4009399414062 551.6337280273438 285.88623046875 551.7627563476562 285.3633422851562 551.7633666992188 Z" fill="#9bdce7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-177.19, -324.43)" d="M 249.9553527832031 495.5733947753906 L 262.4289855957031 517.8201904296875 C 263.0772705078125 519.2614135742188 264.7432861328125 519.9393310546875 266.2136535644531 519.360107421875 L 276.5162048339844 515.301513671875 C 277.3402709960938 514.9768676757812 277.9757080078125 514.30029296875 278.248046875 513.45751953125 C 278.5203552246094 512.6146240234375 278.4010009765625 511.6942138671875 277.9226989746094 510.94873046875 L 264.0854187011719 488.3948974609375 C 263.3175354003906 486.9534301757812 261.5286560058594 486.4041748046875 260.0841674804688 487.1663818359375 L 251.1837921142578 491.5672607421875 C 249.7394866943359 492.3353271484375 249.1898345947266 494.1278076171875 249.9553527832031 495.5734252929688 Z" fill="#cccccc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-161.16, -240.26)" d="M 252.3758544921875 344.4349975585938 C 255.5606384277344 344.138916015625 258.22705078125 342.0299072265625 259.6409606933594 339.2077026367188 C 261.1040344238281 336.2474975585938 261.1185913085938 332.7776489257812 259.6803894042969 329.8052978515625 C 258.1795959472656 326.729736328125 255.6755981445312 324.2574157714844 252.5811767578125 322.7958679199219 C 248.9819946289062 321.0525512695312 244.9173278808594 320.5699157714844 240.958251953125 320.7297973632812 C 233.497802734375 321.0310363769531 225.2784881591797 323.1255187988281 220.6923522949219 329.4869689941406 C 218.5349731445312 332.3717651367188 217.5974273681641 335.98876953125 218.081787109375 339.558349609375 C 218.662109375 343.3044738769531 220.9421691894531 346.548828125 223.3765716552734 349.3452758789062 C 225.9279937744141 352.2761535644531 228.8721923828125 354.9158935546875 230.8886871337891 358.2734375 C 232.6335144042969 361.1786499023438 233.5721130371094 364.8371276855469 232.4049377441406 368.1339721679688 C 232.1266784667969 368.9154357910156 231.7135467529297 369.64208984375 231.1843109130859 370.2808837890625 C 230.5808258056641 371.0091247558594 231.622314453125 372.0618286132812 232.2308959960938 371.3274536132812 C 234.3305969238281 368.7936401367188 234.755126953125 365.4488830566406 234.0939178466797 362.2962036132812 C 233.365966796875 358.8252868652344 231.2660827636719 355.890869140625 228.9698944091797 353.2694702148438 C 224.501953125 348.1686401367188 217.8478546142578 342.5988159179688 219.7258148193359 334.9785766601562 C 220.6075744628906 331.6757202148438 222.6140899658203 328.7839965820312 225.3993988037109 326.802001953125 C 228.3858337402344 324.63671875 231.9317321777344 323.4454345703125 235.5348510742188 322.7984619140625 C 242.4297485351562 321.5604858398438 250.7794799804688 321.68994140625 255.9888610839844 327.0621032714844 C 258.1539306640625 329.2948608398438 259.6430358886719 332.4146118164062 259.2442321777344 335.5808715820312 C 258.8845520019531 338.43603515625 257.0615539550781 341.2364196777344 254.3962097167969 342.4273071289062 C 253.7559204101562 342.7117919921875 253.0735168457031 342.8900146484375 252.3758850097656 342.9549560546875 C 251.4354248046875 343.0423583984375 251.4263000488281 344.5233154296875 252.3758850097656 344.43505859375 Z" fill="#2f2e41" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pweslw =
    '<svg viewBox="0.0 0.0 13.7 9.5" ><path transform="translate(0.0, 0.0)" d="M 11.98160648345947 4.146218822919864e-14 L 4.694473743438721 6.59888744354248 L 1.510286569595337 4.296683788299561 L 0 6.006241321563721 L 4.027430534362793 8.923883438110352 L 4.870674133300781 9.533616065979004 L 5.638402938842773 8.838415145874023 L 13.69326496124268 1.544309735298157 L 11.98160648345947 0 L 11.98160648345947 4.146218822919864e-14 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_1i58gx =
    '<svg viewBox="184.8 767.3 7.2 13.2" ><path transform="translate(184.8, 767.31)" d="M 7.165123462677002 13.1683349609375 L 0 6.58416748046875 L 7.165123462677002 0 L 7.165123462677002 0" fill="none" stroke="#ffffff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
