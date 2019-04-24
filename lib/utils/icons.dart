import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String playSvg = 'images/play.svg';
final String pauseSvg = 'images/pause.svg';
final String recordSvg = 'images/record.svg';
final String okSvg = 'images/ok.svg';
final String upSvg = 'images/up.svg';
final String downSvg = 'images/down.svg';
final String stopSvg = 'images/stop.svg';


final Widget playIcon = new SvgPicture.asset(
  playSvg,
  semanticsLabel: 'Play Icon'
);

final Widget pauseIcon = new SvgPicture.asset(
  pauseSvg,
  semanticsLabel: 'Play Icon'
);

final Widget recordIcon = new SvgPicture.asset(
  recordSvg,
  semanticsLabel: 'Play Icon'
);
final Widget stopIcon = new SvgPicture.asset(
  stopSvg,
  semanticsLabel: 'Stop Icon'
);

final Widget upIcon = new SvgPicture.asset(
  upSvg,
  semanticsLabel: 'Up Icon'
);
final Widget downIcon = new SvgPicture.asset(
  downSvg,
  semanticsLabel: 'Down Icon'
);
final Widget okIcon = new SvgPicture.asset(
  okSvg,
  semanticsLabel: 'Ok Icon'
);

Widget getDayLevel(level){
  switch (level) {
    case 'O':
    return okIcon;
    case 'U':
    return upIcon;
    case 'D':
    return downIcon;
    default:
    return okIcon;
  }
}
