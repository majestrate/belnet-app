import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:belnet_lib/belnet_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../model/theme_set_provider.dart';

class BelnetPowerButton extends StatefulWidget {
  final VoidCallback? onPressed;
  bool? isClick;
 bool? isLoading;
  BelnetPowerButton({this.onPressed,required this.isClick, required this.isLoading});

  @override
  State<BelnetPowerButton> createState() => _BelnetPowerButtonState();
}

class _BelnetPowerButtonState extends State<BelnetPowerButton>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  getIsConnect(appModel)async{
    if (BelnetLib.isConnected==false) {
      if(!widget.isLoading!){
       // print('Checking isConnected value ${BelnetLib.isConnected}');
        AwesomeNotifications().dismiss(3);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
   // print('netvalue from disconnected ----');
    final appModel = Provider.of<AppModel>(context);
   getIsConnect(appModel);

    var whiteLoadingImage = Image.asset('assets/images/load_white.gif',
      height: MediaQuery.of(context).size.height * 0.90 / 3,  //0.98 / 3,
       width: MediaQuery.of(context).size.width * 1.78 / 3,  //1.78 / 3,
    );
    var powerOnDark =  Image.asset('assets/images/power_on-01.png',
      height: MediaQuery.of(context).size.height * 0.90 / 3,  //0.98 / 3,
       width: MediaQuery.of(context).size.width * 1.78 / 3,  //1.78 / 3,
    );
    var powerOffDark = Image.asset('assets/images/power_off_3.png',
      height: MediaQuery.of(context).size.height * 0.90 / 3,  //0.98 / 3,
      width: MediaQuery.of(context).size.width * 1.78 / 3,  //1.78 / 3,
    );
    var darkLoadingImage = Image.asset('assets/images/load_darkss.gif',
      height: MediaQuery.of(context).size.height * 0.90 / 3,  //0.98 / 3,
      width: MediaQuery.of(context).size.width * 1.78 / 3,  //1.78 / 3,
    );
    var powerOnWhite = Image.asset('assets/images/image (1).png',
      height: MediaQuery.of(context).size.height * 0.90 / 3,  //0.98 / 3,
      width: MediaQuery.of(context).size.width * 1.78 / 3,
    );
    var powerOffWhite = Image.asset('assets/images/power_off_whites.png',
      height: MediaQuery.of(context).size.height * 0.90 / 3,  //0.98 / 3,
      width: MediaQuery.of(context).size.width * 1.78 / 3,
    );



    return GestureDetector(
      onTap: widget.onPressed,
      child:appModel.darkTheme ?
          BelnetLib.isConnected
              ? powerOnDark
              : Stack(
            children: [
              powerOffDark,
              widget.isLoading!
              ? darkLoadingImage
                  : powerOffDark
            ],
          )
          :
          BelnetLib.isConnected
         ? powerOnWhite
              : Stack(
            children:[
              widget.isLoading!
              ? whiteLoadingImage
                  : powerOffWhite
            ]
          )

      // appModel.darkTheme
          //     ?
          // widget.isLoading!
          //     ? darkLoadingImage
          //     : BelnetLib.isConnected
          //     ? powerOnDark
          //     : powerOffDark
          //     :
          // widget.isLoading!
          //     ? whiteLoadingImage
          //     : BelnetLib.isConnected
          //     ? powerOnWhite
          //     : powerOffWhite

    );
  }
}
