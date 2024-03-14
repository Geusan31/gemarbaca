import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 1,
                          spreadRadius: 0,
                          offset: const Offset(2, 2))
                    ]),
                child: Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://i.pinimg.com/736x/07/33/ba/0733ba760b29378474dea0fdbcb97107.jpg"))),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.nama,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          controller.email,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.grey.shade600),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Setting",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 1,
                            spreadRadius: 0,
                            offset: const Offset(2, 2))
                      ]),
                  child: Row(
                    children: <Widget>[
                      Icon(CupertinoIcons.person),
                      SizedBox(width: 10),
                      Text(
                        'Edit Account',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 1,
                          spreadRadius: 0,
                          offset: const Offset(2, 2))
                    ]),
                child: Row(
                  children: <Widget>[
                    Icon(CupertinoIcons.play),
                    SizedBox(width: 10),
                    Text(
                      'Version',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
