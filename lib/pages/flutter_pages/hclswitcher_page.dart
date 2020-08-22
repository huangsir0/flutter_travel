import 'package:flutter/material.dart';
import 'package:flutter_travel/widgets/hcl_switcher.dart';

class HclSwitcherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HclSwitcher"),
      ),
      body: Center(
        
        child: HclSwitcher(
          height: 60,
          width: 120,
          label: "ZZZ",
          activeColor: Colors.orange,
          dissColor: Colors.grey,
          isOpen: true,
          onChange: (flag) {},
        ),
      ),
    );
  }
}
