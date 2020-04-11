import 'package:flutter/material.dart';
import 'package:weathe_app/DataLayer/location.dart';

// Widget AppMode() {
//   return Container(
//     child: Switch(
//       value: !Mode.isSwitched,
//       onChanged: (value) {
//         setState(() {
//           Mode.isSwitched = value;
//         });
//       },
//       activeTrackColor: Colors.green,
//       activeColor: Colors.red,
//     ),
//   );
// }

class AppMode extends StatefulWidget {
  @override
  _AppModeState createState() => _AppModeState();
}

class _AppModeState extends State<AppMode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
        value: !Mode.isSwitched,
        onChanged: (value) {
          setState(() {
            Mode.isSwitched = !value;
          });
          print(Mode.bright);
          Mode().getBrightness();
          // Mode().getColors();
        },
        activeTrackColor: Colors.blue,
        activeColor: Colors.white,
      ),
    );
  }
}
