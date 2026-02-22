import 'package:flutter/material.dart';

class PhoneUsername extends StatelessWidget {
  const PhoneUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enger UserName',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  )),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Latin Characters, formal Name and opt(emoji/symbols)',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Mohammad',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3))),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                  child: Divider(
                thickness: 2,
              )),
              SizedBox(height: double.infinity),
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(2),
                  color: Colors.green,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      )))
            ],
          ),
        ),
      )),
    );
  }
}
