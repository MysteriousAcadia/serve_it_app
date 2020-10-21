import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:serveit/models/service.dart';
import 'package:serveit/models/service_recents.dart';
import 'package:serveit/pages/services.dart';

import '../utils/constants.dart';

class RecentsCard extends StatelessWidget {
  final Service service;
  ServiceRecents serviceRecents;
  final Color backgroundColor;

  RecentsCard(
      {Key key, this.service, this.serviceRecents, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String statusText = "Not defined";
    if (serviceRecents.status == 0) {
      statusText = "Not confirmed";
    } else if (serviceRecents.status == 1) {
      statusText = "Confirmed";
    } else if (serviceRecents.status == 2) {
      statusText = "Completed";
    }
    void onClick() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RequestServicePage(service: service,)));
      });
    }

    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        width: 300,
        height: 300,
        child: InkWell(
          onTap: onClick,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: backgroundColor,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 0, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                serviceRecents.service.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 21,
                                  color: const Color(0xff005c7e),
                                  letterSpacing: -0.4,
                                  fontWeight: FontWeight.w700,
                                  height: 1.125,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    color: const Color(0xff005c7e),
                                    height: 1.3636363636363635,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Accepted by\n',
                                    ),
                                    TextSpan(
                                      text: serviceRecents.user.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              serviceRecents.time.toString(),
                            ),
                            Icon(Icons.album, size: 60),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(27.5, 27.5),
                        ),
                      ),
                      color: const Color(0xffffffff),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(statusText),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const String _svg_tax2sh =
    '<svg viewBox="0.0 0.0 75.4 117.4" ><path transform="matrix(-0.994522, 0.10453, -0.10453, -0.994522, 34.66, 100.84)" d="M 19.60989952087402 69.453369140625 C 15.60853576660156 69.24144744873047 10.93101978302002 66.40129852294922 10.96109199523926 62.03086853027344 C 10.98304557800293 58.85540771484375 11.40795421600342 55.73124313354492 11.26052379608154 52.54258728027344 C 11.14246368408203 49.99436569213867 10.58835411071777 47.5018310546875 9.727574348449707 45.1013298034668 C 8.899884223937988 42.79286193847656 6.900522708892822 40.69191360473633 6.576089382171631 38.28496551513672 C 6.36927604675293 36.75115966796875 6.794127941131592 34.66867828369141 7.449883460998535 33.25856399536133 C 8.247323989868164 31.54421234130859 7.908089160919189 31.65061187744141 6.848498344421387 30.03034782409668 C 4.772196769714355 26.85518455505371 2.941016435623169 23.63047790527344 1.790329813957214 19.97785186767578 C 0.1327827423810959 14.71697425842285 -0.6825079917907715 8.685235977172852 0.70778888463974 3.263154029846191 C 0.884558379650116 2.574657678604126 1.270719289779663 0.0777360200881958 2.252169609069824 0.003577137598767877 C 3.348369359970093 -0.07936908304691315 2.694576978683472 1.303197264671326 2.588415622711182 1.76070761680603 C 1.911527037620544 4.680591583251953 1.314567446708679 7.232325553894043 1.440191149711609 10.283522605896 C 1.925068140029907 22.05564498901367 9.438899040222168 30.56789398193359 13.82003211975098 40.97622299194336 C 14.0643892288208 41.51494216918945 14.56585788726807 42.7890510559082 14.91904544830322 43.63201522827148 C 15.47664165496826 44.96298980712891 15.91849231719971 47.43060684204102 16.75430107116699 48.46173858642578 C 18.32840156555176 50.40470504760742 17.08283805847168 46.70049667358398 16.81104278564453 45.99001312255859 C 16.46741104125977 45.09106826782227 16.08603096008301 44.13380432128906 15.72058963775635 43.33920288085938 C 14.05319404602051 39.6593132019043 12.18306159973145 35.63737869262695 10.46026992797852 31.84347343444824 C 19.75281715393066 30.72968673706055 24.99745559692383 42.31158828735352 26.67897605895996 49.74053573608398 C 28.06446647644043 55.86108016967773 29.01294326782227 69.93023681640625 19.60989952087402 69.453369140625" fill="#69a1ac" fill-opacity="0.55" stroke="none" stroke-width="0.9999982714653015" stroke-opacity="0.55" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-77.31, -55.25)" d="M 138.8390197753906 78.03553771972656 C 132.1498718261719 78.5662841796875 127.8553314208984 82.98033905029297 125.8563842773438 89.154296875 C 124.7789306640625 92.48129272460938 124.6552429199219 95.89915466308594 124.0564422607422 99.3184814453125 C 123.1560211181641 104.4624176025391 121.2180328369141 108.360969543457 117.4305725097656 112.0259170532226 C 116.2575836181641 113.1608047485352 115.3929290771484 114.3261795043945 114.7785949707031 115.5730361938476 C 113.5587005615234 116.8178405761719 112.4967803955078 118.2264862060547 111.716552734375 119.9487533569336 C 110.7200164794922 122.1481857299805 110.4380340576172 124.7872848510742 111.5884704589844 126.97998046875 C 111.8979797363281 127.569694519043 112.6697235107422 128.7529602050781 113.4696044921875 129.2904968261719 C 110.4749755859375 135.6684112548828 108.8283233642578 142.6536102294922 109.0138549804688 149.6300201416016 C 109.1261291503906 153.8410034179688 109.3315887451172 158.0540618896484 109.5716247558594 162.2600708007812 C 109.6361083984375 163.3893890380859 110.0039672851562 165.2544097900391 110.5561676025391 163.3603668212891 C 111.061767578125 161.6278533935547 110.4277801513672 158.9081573486328 110.3691711425781 157.0985565185547 C 110.0836791992188 148.2817535400391 109.8398132324219 140.2651214599609 113.4690093994141 132.0277709960938 C 113.8497467041016 131.164306640625 114.2533416748047 130.307861328125 114.6733703613281 129.4584503173828 C 114.6982727050781 129.444091796875 114.7211456298828 129.4267883300781 114.7442932128906 129.4100799560547 C 114.7601165771484 129.4223937988281 114.7747802734375 129.4355926513672 114.7908935546875 129.4478912353516 C 114.8175659179688 129.3998260498047 114.8545074462891 129.3429718017578 114.8972930908203 129.2793731689453 C 115.0177612304688 129.1548004150391 115.1229858398438 128.9976959228516 115.2232208251953 128.8224182128906 C 115.5450592041016 128.3763275146484 115.9093780517578 127.8519592285156 115.9114227294922 127.5650100708008 C 115.9114227294922 127.5629577636719 115.9102478027344 127.559440612793 115.9102478027344 127.5570983886719 C 118.1568756103516 123.8895111083984 120.7303161621094 120.4241638183594 123.3588562011719 117.026237487793 C 123.3392181396484 117.0511474609375 126.2101440429688 113.1420593261719 125.7664031982422 115.3036727905273 C 125.5524291992188 116.3456497192383 123.4406280517578 118.3293609619141 122.5876922607422 119.4328918457031 C 120.7010040283203 121.8876190185547 118.4854583740234 124.9983215332031 116.6444702148438 128.0061340332031 C 116.3968048095703 128.1485748291016 116.0468444824219 128.8473358154297 115.7935943603516 129.3681640625 C 115.6537780761719 129.6319732666016 115.5233612060547 129.8977966308594 115.3952789306641 130.1296539306641 C 121.9188385009766 132.2848358154297 126.9933166503906 127.9434051513672 130.4536743164062 122.8938522338867 C 130.4577789306641 122.8876953125 130.4615936279297 122.8815383911133 130.4654083251953 122.8756637573242 C 131.5185241699219 121.4805068969726 132.5971374511719 120.0950164794922 133.9448089599609 118.9920654296875 C 136.1929016113281 117.1513977050781 138.6007385253906 116.8266296386719 141.2515563964844 115.9209518432617 C 148.4806213378906 113.4509735107422 151.5540924072266 104.0822677612305 152.5301208496094 97.13076782226562 C 153.631591796875 89.28823852539062 148.244384765625 77.26224517822266 138.8390197753906 78.03553771972656" fill="#89c5cc" fill-opacity="0.55" stroke="none" stroke-width="1" stroke-opacity="0.55" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(0.99027, -0.13917, 0.13917, 0.99027, 19.76, 4.16)" d="M 28.7494945526123 0.6688234210014343 C 20.95620536804199 6.789265632629395 16.29236602783203 16.14211845397949 12.39469432830811 25.00317573547363 C 8.041837692260742 34.89993667602539 4.652410984039307 45.0946044921875 3.072973012924194 55.79839706420898 C 2.035421133041382 62.83079147338867 0.8484166264533997 69.88722229003906 0.2711247205734253 76.97618865966797 C 0.06595116853713989 79.49362945556641 -0.03669218719005585 82.03013610839844 0.01193396560847759 84.55609130859375 C 0.0160075630992651 84.76360321044922 0.1263309568166733 90.40376281738281 1.154240369796753 89.23751831054688 C 1.738830804824829 88.57423400878906 1.050716042518616 83.38837432861328 1.062497138977051 82.54219055175781 C 1.12985372543335 77.77722930908203 1.655474066734314 73.04158020019531 2.347044944763184 68.32997131347656 C 3.485570430755615 60.57214736938477 4.342309951782227 52.81550216674805 6.216401100158691 45.19044876098633 C 6.496021270751953 44.05175399780273 6.759518146514893 42.85179138183594 7.192431926727295 41.76057434082031 C 7.652603149414062 40.60018157958984 7.207966327667236 41.07237243652344 8.223562240600586 40.73031997680664 C 9.210440635681152 40.39735794067383 10.34063720703125 40.62363052368164 11.37851238250732 40.17811584472656 C 15.49629974365234 38.41041946411133 18.26787757873535 32.77348327636719 20.32339859008789 29.10795021057129 C 22.67465972900391 24.91644668579102 24.38930892944336 20.33543968200684 25.88383483886719 15.78676319122314 C 26.98149681091309 12.44469738006592 27.90066528320312 9.098821640014648 28.63810920715332 5.661057949066162 C 28.87024688720703 4.577578067779541 29.03584861755371 3.433688879013062 29.4022274017334 2.387754440307617 C 29.50100898742676 2.105585098266602 29.86386871337891 1.632899880409241 29.88936424255371 1.374354839324951 C 29.94358825683594 0.8271160125732422 29.66015625 0.4609672427177429 29.69767951965332 -4.376608227034656e-15 C 29.37702178955078 0.2161274254322052 29.06076812744141 0.4392189681529999 28.7494945526123 0.6688234210014343" fill="#89c5cc" fill-opacity="0.55" stroke="none" stroke-width="1" stroke-opacity="0.55" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-27.12, -231.98)" d="M 38 328.0000305175781 C 38 339.8170166015625 47.57950592041016 349.3964538574219 59.39643859863281 349.3964538574219 C 71.21343231201172 349.3964538574219 80.79287719726562 339.8170166015625 80.79287719726562 328.0000305175781" fill="#89c5cc" fill-opacity="0.55" stroke="none" stroke-width="1" stroke-opacity="0.55" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-80.13, -186.73)" d="M 114.1304931640625 282.82666015625 L 113 282.82666015625 C 113.0785522460938 281.4083251953125 113.1820220947266 279.9923706054688 113.4191436767578 278.5895690917969 C 114.326286315918 273.2249145507812 117.1620559692383 265.3457641601562 123.3816757202148 264.4749450683594 C 123.6111679077148 264.4427185058594 124.4552993774414 264.4371337890625 125.4776458740234 264.4972534179688 C 125.9621353149414 264.2264404296875 126.5049743652344 264.0625610351562 127.0771026611328 264.0250244140625 C 132.3725738525391 263.6346435546875 138.2861938476562 267.9066162109375 140.840576171875 272.3526611328125 C 142.8999176025391 275.93701171875 142.5528869628906 280.6439208984375 141.2811279296875 284.4522094726562 C 140.4293670654297 287.0016174316406 138.5705108642578 290.6366577148438 135.4706726074219 290.672119140625 C 131.5923461914062 290.7163696289062 131.4053344726562 285.9229736328125 131.3303070068359 283.1209106445312 C 131.2306518554688 279.3953247070312 130.7599334716797 276.1500854492188 127.8242111206055 273.6106567382812 C 127.1401214599609 273.0191650390625 126.3924102783203 272.4985961914062 125.701286315918 271.9153442382812 C 124.619140625 271.0023498535156 123.4232940673828 270.0673217773438 123.2837829589844 268.5567016601562 C 123.0914993286133 266.4727478027344 124.2677154541016 266.0975646972656 126.063850402832 266.4847412109375 C 126.3701477050781 266.5507202148438 129.4544525146484 267.9347534179688 128.997802734375 266.8408813476562 C 128.8582763671875 266.5067138671875 128.3491668701172 266.2417602539062 127.7063903808594 266.0433349609375 C 126.043327331543 265.8624877929688 124.0596160888672 265.6526489257812 123.4892425537109 265.778076171875 C 117.335563659668 267.1281127929688 114.9394607543945 275.6524047851562 114.3031387329102 281.0683288574219 C 114.2345428466797 281.6527709960938 114.1791534423828 282.2392578125 114.1304931640625 282.82666015625 Z" fill="#69a1ac" fill-opacity="0.55" stroke="none" stroke-width="1" stroke-opacity="0.55" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
