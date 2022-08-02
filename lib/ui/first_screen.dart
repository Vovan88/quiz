import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:quiz/ui/quations_screen.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FirstPage> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstPage> {
  String? category;
  String? difficult;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> categorys = [
      const DropdownMenuItem(
        value: "Linux",
        child: Text("Linux"),
      ),
      const DropdownMenuItem(
        value: "DevOps",
        child: Text("DevOps"),
      ),
      const DropdownMenuItem(
        value: "Docker",
        child: Text("Docker"),
      ),
    ];
    List<DropdownMenuItem<String>> difficults = [
      const DropdownMenuItem(
        value: "Easy",
        child: Text("Easy"),
      ),
      const DropdownMenuItem(
        value: "Medium",
        child: Text("Medium"),
      ),
      const DropdownMenuItem(
        value: "Hard",
        child: Text("Hard"),
      )
    ];

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                      hint: const Text(
                        'Select category',
                      ),
                      autovalidateMode: AutovalidateMode.disabled,
                      autofocus: false,
                      validator: (value) {
                        if (value == null) {
                          return 'Must not empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      items: categorys,
                      icon: const SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.green,
                            size: 30.0,
                          ),
                        ),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (cat) {
                        category = cat!;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                      hint: const Text(
                        'Select difficulty',
                      ),
                      autovalidateMode: AutovalidateMode.disabled,
                      autofocus: false,
                      validator: (value) {
                        if (value == null) {
                          return 'Must not empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      items: difficults,
                      icon: const SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.green,
                            size: 30.0,
                          ),
                        ),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (diff) {
                        difficult = diff!;
                      }),
                ),
                TextButton(
                    onPressed: () {
                      if (category == null) {
                        showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      height: 100,
                                      color: Colors.grey,
                                      child: const Center(
                                          child: Text("Choose category"))));
                            });

                        return;
                      }
                      if (difficult == null) {
                        showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      height: 100,
                                      color: Colors.grey,
                                      child: const Center(
                                          child: Text("Choose difficult"))));
                            });
                        return;
                      }

                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) {
                          return QuationsPage(
                              category: category!, difficult: difficult!);
                        }),
                      );
                    },
                    child: const Text("GO"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
