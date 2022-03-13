import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int? _onSelectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 60,
              ),
              child: Row(
                children: const [
                  Text(
                    "Themes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.grey,
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: const Text(
                        "Light",
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Radio(
                          value: 0,
                          groupValue: _onSelectedValue,
                          onChanged: (value) {
                            setState(() {
                              _onSelectedValue = value as int?;
                            });
                          }),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.grey,
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: const Text(
                        "Dark",
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Radio(
                          value: 1,
                          groupValue: _onSelectedValue,
                          onChanged: (value) {
                            setState(() {
                              _onSelectedValue = value as int?;
                            });
                          }),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
