import 'package:flutter/material.dart';

class SettingsPageState extends StatefulWidget {
  const SettingsPageState({super.key});

  @override
  State<SettingsPageState> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPageState> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings Page"), centerTitle: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 5),
                      content: Text("Snacbar"),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                child: Text("Open Snackbar"),
              ),
              Divider(
                color:Colors.teal,
                thickness: 5.0,
                endIndent: 200.0,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Alert title"),
                        content: Text("Alert Content"),
                        actions: [
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("CLose Button"),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                child: Text("Open Dialog"),
              ),
              DropdownButton(
                value: menuItem,
                items: const [
                  DropdownMenuItem(value: 'e1', child: Text("Element 1")),
                  DropdownMenuItem(value: 'e2', child: Text("Element 2")),
                  DropdownMenuItem(value: 'e3', child: Text("Element 3")),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
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
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  print("Image Tapped");
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),

              ElevatedButton(onPressed: () {}, child: Text("Click me")),
              FilledButton(onPressed: () {}, child: Text("Click me")),
              OutlinedButton(onPressed: () {}, child: Text("Click me")),
              CloseButton(),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
