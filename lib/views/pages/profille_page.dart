import 'package:flutter/material.dart';

class ProfillePage extends StatefulWidget {
  const ProfillePage({super.key});

  @override
  State<ProfillePage> createState() => _ProfillePageState();
}

class _ProfillePageState extends State<ProfillePage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
            onEditingComplete: () => setState(() {
              FocusScope.of(context).unfocus();
            }),
          ),
          Text(controller.text),
          Checkbox.adaptive(
            tristate: true,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value;
              });
            },
          ),
          CheckboxListTile.adaptive(
            tristate: true,
            title: const Text('Accept Terms and Conditions'),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value;
              });
            },
          ),
          Switch.adaptive(
            value: isSwitched,
            onChanged: (bool value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
          SwitchListTile.adaptive(
            value: isSwitched,
            onChanged: (bool value) {
              setState(() {
                isSwitched = value;
              });
            },
            title: const Text('Enable Notifications'),
          ),
          Slider.adaptive(
            value: sliderValue,
            divisions: 10,
            onChanged: (double value) {
              setState(() {
                sliderValue = value;
              });
              print(value);
            },
          ),
        ],
      ),
    );
  }
}
