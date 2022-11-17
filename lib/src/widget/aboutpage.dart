import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/theme_set_provider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AboutPage> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: appModel.darkTheme
                ? [
                    Color(0xFF242430),
                    Color(0xFF1C1C26),
                  ]
                : [
                    Color(0xFFF9F9F9),
                    Color(0xFFEBEBEB),
                  ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                  MediaQuery.of(context).size.height * 0.80 / 3),
              child: Container(
                  height: mHeight * 0.45 / 3,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.08 / 3,
                      right: MediaQuery.of(context).size.height * 0.08 / 3,
                      top: MediaQuery.of(context).size.height * 0.13 / 3),
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: 'About',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.09 /
                                      3,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins',
                                  color: appModel.darkTheme
                                      ? Colors.white
                                      : Colors.black),
                              children: [
                            TextSpan(
                                text: ' Belnet',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.09 /
                                            3,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Poppins',
                                    color: Color(0xff23DC27)))
                          ])),
                      GestureDetector(
                              onTap: (() {
                                Navigator.pop(context);
                              }),
                              child: Container(
                                child: SvgPicture.asset( appModel.darkTheme ? 'assets/images/About_Close_dark.svg' : 
                                    'assets/images/Close_about_white_theme.svg',
                                    width: mHeight * 0.09 / 3,
                                    height: mHeight * 0.09 / 3),
                              ),
                            )
                    ],
                  ))),
          body: Container(
              // color: Colors.black,

              // padding: EdgeInsets.only(right:mHeight*0.05/3),
              child: RawScrollbar(
            thumbColor:
                appModel.darkTheme ? Color(0xff4D4D64) : Color(0xffC7C7C7),
            //controller: scrollController,
            thumbVisibility: true,
            thickness: 8,
            radius: Radius.circular(10),
            child: Container(
              color: appModel.darkTheme ? Color(0xff111117) : Color(0xffE3E3E3),
              padding: EdgeInsets.only(right: 10.0),
              child: SingleChildScrollView(
                  child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: appModel.darkTheme
                        ? [
                            Color(0xFF242430),
                            Color(0xFF1C1C26),
                          ]
                        : [
                            Color(0xFFF9F9F9),
                            Color(0xFFEBEBEB),
                          ],
                  ),
                ),
                padding: EdgeInsets.only(
                    left: mHeight * 0.10 / 3, right: mHeight * 0.06 / 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      """BelNet is a decentralized VPN service built on top of the Beldex Network.The BelNet dVPN utilizes Beldex masternodes to route your connection.\n\n A unique onion routing protocol is used to encrypt and route your data.""",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          color: appModel.darkTheme
                              ? Color(0xffA1A1C1)
                              : Color(0xff56566F)),
                    ),
                    Text(
                      "\nWhat are exit nodes?",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          color:
                              appModel.darkTheme ? Colors.white : Colors.black),
                    ),
                    Text(
                      """Exit nodes on the Beldex network helps you browse the internet without exposing your IP address. They also hide your geographical location.BelNet has several uses and chief among them are,""",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          color: appModel.darkTheme
                              ? Color(0xffA1A1C1)
                              : Color(0xff56566F)),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "\nUnblockching content:",
                            style: TextStyle(
                                fontSize: mHeight * 0.060 / 3,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                color: appModel.darkTheme
                                    ? Colors.white
                                    : Colors.black),
                            children: [
                          TextSpan(
                              text:
                                  """ Certain websites may be blocked in your region. BelNet can be used to unblock these websites. For example, a streaming platform may be restricted in your region. With BelNet, you can unblock this website, pay for the streaming service and enjoy watching the content that you love!""",
                              style: TextStyle(
                                  fontSize: mHeight * 0.060 / 3,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'Poppins',
                                  color: appModel.darkTheme
                                      ? Color(0xffA1A1C1)
                                      : Color(0xff56566F)))
                        ])),
                    RichText(
                        text: TextSpan(
                            text: "\nMasking your IP & Location:",
                            style: TextStyle(
                                fontSize: mHeight * 0.060 / 3,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                color: appModel.darkTheme
                                    ? Colors.white
                                    : Colors.black),
                            children: [
                          TextSpan(
                              text:
                                  """ The websites that you visit only see the exit node’s IP address while your IP remains concealed. It is also hidden from your Internet Service Provider (ISP), mobile network operator, and even prying regulators. Your online activity remains truly anonymous!""",
                              style: TextStyle(
                                  fontSize: mHeight * 0.060 / 3,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'Poppins',
                                  color: appModel.darkTheme
                                      ? Color(0xffA1A1C1)
                                      : Color(0xff56566F)))
                        ])),
                    RichText(
                        text: TextSpan(
                            text: "\nSecurity:",
                            style: TextStyle(
                                fontSize: mHeight * 0.060 / 3,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                color: appModel.darkTheme
                                    ? Colors.white
                                    : Colors.black),
                            children: [
                          TextSpan(
                              text:
                                  """ You are protected from hackers and malicious actors that try to steal your information. Since all data about you remains private when you’re browsing, there’s very little window of opportunity for bad actors to pilfer your personal and private information. """,
                              style: TextStyle(
                                  fontSize: mHeight * 0.060 / 3,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'Poppins',
                                  color: appModel.darkTheme
                                      ? Color(0xffA1A1C1)
                                      : Color(0xff56566F)))
                        ])),
                    RichText(
                        text: TextSpan(
                            text: "\nProtects your identity:",
                            style: TextStyle(
                                fontSize: mHeight * 0.060 / 3,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                color: appModel.darkTheme
                                    ? Colors.white
                                    : Colors.black),
                            children: [
                          TextSpan(
                              text:
                                  """ Masking your IP also protects your identity online. Your browsing history, purchase history, and any financial information is only available to you. That means, no more cookies, trackers, and relevant ads that pursue you no matter where you go.""",
                              style: TextStyle(
                                  fontSize: mHeight * 0.060 / 3,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'Poppins',
                                  color: appModel.darkTheme
                                      ? Color(0xffA1A1C1)
                                      : Color(0xff56566F)))
                        ])),
                    Text(
                      "\nDoes BelNet block ads? ",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          color:
                              appModel.darkTheme ? Colors.white : Colors.black),
                    ),
                    Text(
                      """BelNet conceals your IP. Thus, your browsing history remains private to the destination website and third parties. However, you may still be shown ads that aren’t relevant to your browsing history.""",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          color: appModel.darkTheme
                              ? Color(0xffA1A1C1)
                              : Color(0xff56566F)),
                    ),
                    Text(
                      "\nWhere are the current exit nodes located?",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          color:
                              appModel.darkTheme ? Colors.white : Colors.black),
                    ),
                    Text(
                      """There are currently three active exit nodes maintained by the Beldex foundation. They are located in the Netherlands (2) and France (1).""",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          color: appModel.darkTheme
                              ? Color(0xffA1A1C1)
                              : Color(0xff56566F)),
                    ),
                    Text(
                      "\nCan you set up an exit node?",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          color:
                              appModel.darkTheme ? Colors.white : Colors.black),
                    ),
                    Text(
                      """Yes, anyone can set up an exit node. Check the BelNet website for complete documentation on how to set up an exit node.Exit node contributors will be rewarded and their node will be added to the BelNet app.""",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          color: appModel.darkTheme
                              ? Color(0xffA1A1C1)
                              : Color(0xff56566F)),
                    ),
                    Text(
                      "\nWhat are MN Apps? ",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          color:
                              appModel.darkTheme ? Colors.white : Colors.black),
                    ),
                    Text(
                      """MN Apps are decentralized applications hosted on BelNet.MN Apps are privacy preserving applications and do not collect or reveal any personal information about the user.They can be accessed only by connecting to BelNet.Below is a sample MNApp that you can access by enabling BelNet:""",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          color: appModel.darkTheme
                              ? Color(0xffA1A1C1)
                              : Color(0xff56566F)),
                    ),
                    GestureDetector(
                      onTap: ()async{
                        if (!await launchUrl(
     Uri.parse("http://cw41adqqhykuxw51xmagkkb3fixyieat1josbux13jn6o973tqgy.bdx/"),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch ${Uri.parse("http://cw41adqqhykuxw51xmagkkb3fixyieat1josbux13jn6o973tqgy.bdx/")}';
    }
                      },
                      child: Text(
                        """http://cw41adqqhykuxw51xmagkkb3fixyieat1josbux13jn6o973tqgy.bdx/""",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                            fontSize: mHeight * 0.060 / 3,
                            fontFamily: "Poppins",
                            color: appModel.darkTheme
                                ? Color(0xffA1A1C1)
                                : Color(0xff56566F)),
                      ),
                    ),
                    Text(
                      "\nWhat are BNS Names?",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          color:
                              appModel.darkTheme ? Colors.white : Colors.black),
                    ),
                    Text(
                      """BNS stands for Beldex Name Service. BNS names are human readable domain names on BelNet. BNS is a censorship-free, decentralized, unstoppable domain name service. 

It has many utilities. For example, BNS names could be mapped to MN Apps to make them easily readable and discoverable.

The Beldex team is researching the possibility of mapping BNS names to BChat IDs and your wallet address so you can send and receive messages as well as BDX with your BNS name.

BNS names end with the top level domain .bdx
 Example: yourname.bdx""",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          color: appModel.darkTheme
                              ? Color(0xffA1A1C1)
                              : Color(0xff56566F)),
                    ),
                    Text(
                      "\nCredits:",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          color:
                              appModel.darkTheme ? Colors.white : Colors.black),
                    ),
                    Text(
                      """BelNet uses several protocols that were designed by the open source projects Tor, I2P, and Lokinet.\n""",
                      style: TextStyle(
                          fontSize: mHeight * 0.060 / 3,
                          fontFamily: "Poppins",
                          color: appModel.darkTheme
                              ? Color(0xffA1A1C1)
                              : Color(0xff56566F)),
                    ),
                  ],
                ),
              )),
            ),
          )),
        ));
  }

  String getMnappUrl(String data){

    return "http://cw41adqqhykuxw51xmagkkb3fixyieat1josbux13jn6o973tqgy.bdx/";
  
  }
}
