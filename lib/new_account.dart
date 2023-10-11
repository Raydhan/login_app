import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:login_app/log.dart';
import 'package:login_app/main.dart';

class account extends StatelessWidget {
  control c = Get.put(control());
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();
  TextEditingController t4=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFbdc3c7), Color(0xFF2c3e50)])),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Stack(alignment: Alignment.topCenter, children: [
            Column(
              children: [
                Text(""),
                SizedBox(
                  height: 50,
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Camera & gallery"),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  c.get_image("camera");
                                  Navigator.pop(context);
                                },
                                child: Text("Camera")),
                            TextButton(
                                onPressed: () async {
                                  c.get_image("gallery");
                                  Navigator.pop(context);
                                },
                                child: Text("gallery")),
                          ],
                        );
                      },
                    );
                  },
                  child: Obx(
                    () => Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: GradientBoxBorder(
                              width: 7,
                              gradient: LinearGradient(colors: [
                                Color(0xFFbdc3c7),
                                Color(0xFF2c3e50),
                              ]))),
                      width: 170,
                      height: 170,
                      child: (c.img3.value && c.img.value == true)
                          ? CircleAvatar(
                              backgroundImage: FileImage(File(c.image!.path)),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.white38,
                              backgroundImage: AssetImage("image/account.png")),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Obx(() =>TextField(controller: t1,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          errorText: (c.error1.value == true)
                              ? "Enter Valid Name"
                              : null,
                          errorBorder:OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.red),
                              borderRadius: BorderRadius.circular(15)) ,
                          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.red),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: " Enter Name",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: "Enter Name",
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: GradientOutlineInputBorder(
                              gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    Color(0xFFbdc3c7),
                                    Color(0xFF2c3e50)
                                  ]),
                              borderRadius: BorderRadius.circular(15))),
                    ))),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Obx(() => TextField(controller: t2,
                      maxLength: 10,
                      cursorColor: Colors.white,
                      decoration: InputDecoration( errorText: (c.error2.value == true)
                          ? "Enter Valid Cntact"
                          : null,
                          errorBorder:OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.red),
                              borderRadius: BorderRadius.circular(15)) ,
                          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.red),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: " Enter Contact",
                          prefix: Text("+91 "),
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: "Enter Contact",
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: GradientOutlineInputBorder(
                              gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    Color(0xFFbdc3c7),
                                    Color(0xFF2c3e50)
                                  ]),
                              borderRadius: BorderRadius.circular(15))),
                    ))),
                Container(
                    margin: EdgeInsets.all(8),
                    child: Obx(() => TextField(controller: t3,
                      cursorColor: Colors.white,
                      decoration: InputDecoration( errorText: (c.error3.value == true)
                          ? "Enter Valid Email"
                          : null,
                          errorBorder:OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.red),
                              borderRadius: BorderRadius.circular(15)) ,
                          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.red),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: " Email ID",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: "Email ID",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: GradientOutlineInputBorder(
                              gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    Color(0xFFbdc3c7),
                                    Color(0xFF2c3e50)
                                  ]),
                              borderRadius: BorderRadius.circular(15))),
                    ))),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Obx(() => TextField(controller: t4,
                      obscureText: true,
                      obscuringCharacter: "*",
                      cursorColor: Colors.white,
                      decoration: InputDecoration( errorText: (c.error4.value == true)
                          ? "Enter Valid Password"
                          : null,
                          errorBorder:OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.red),
                              borderRadius: BorderRadius.circular(15)) ,
                          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.red),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: " Email Password",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: "Enter Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: GradientOutlineInputBorder(
                              gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    Color(0xFFbdc3c7),
                                    Color(0xFF2c3e50)
                                  ]),
                              borderRadius: BorderRadius.circular(15))),
                    ))),
                Text(""),
                Text(
                  "-------------------- Gender --------------------",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(""),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Radio(
                        activeColor: Colors.black,
                        value: "male",
                        groupValue: c.gender.value,
                        onChanged: (value) {
                          c.gender.value = value!;
                        },
                      ),
                    ),
                    Text("Male"),
                    Obx(
                      () => Radio(
                        activeColor: Colors.black,
                        value: "female",
                        groupValue: c.gender.value,
                        onChanged: (value) {
                          c.gender.value = value!;
                        },
                      ),
                    ),
                    Text("Female"),
                  ],
                ),
                Text(""),
                Text(
                  "-------------- Hobby --------------",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(""),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Checkbox(
                          activeColor: Colors.black,
                          value: c.hobby1.value,
                          onChanged: (value) {
                            c.hobby1.value = value!;
                          },
                        )),
                    Text("Cricket"),
                    Obx(() => Checkbox(
                          activeColor: Colors.black,
                          value: c.hobby2.value,
                          onChanged: (value) {
                            c.hobby2.value = value!;
                          },
                        )),
                    Text("Reading"),
                    Obx(() => Checkbox(
                          activeColor: Colors.black,
                          value: c.hobby3.value,
                          onChanged: (value) {
                            c.hobby3.value = value!;
                          },
                        )),
                    Text("Wreting"),
                  ],
                ),
                Text(""),
                Text(
                  "----------------- Date of Birth ----------------",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(""),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => DropdownButton(
                        value: c.dd.value,
                        alignment: Alignment.center,
                        items: [
                          DropdownMenuItem(
                            child: Text("DD"),
                            alignment: Alignment.center,
                            enabled: true,
                            value: "DD",
                          ),
                          DropdownMenuItem(
                            child: Text("1"),
                            value: "1",
                          ),
                          DropdownMenuItem(
                            child: Text("2"),
                            value: "2",
                          ),
                          DropdownMenuItem(
                            child: Text("3"),
                            value: "3",
                          ),
                          DropdownMenuItem(
                            child: Text("4"),
                            value: "4",
                          ),
                          DropdownMenuItem(
                            child: Text("5"),
                            value: "5",
                          ),
                          DropdownMenuItem(
                            child: Text("6"),
                            value: "6",
                          ),
                          DropdownMenuItem(
                            child: Text("7"),
                            value: "7",
                          ),
                          DropdownMenuItem(
                            child: Text("8"),
                            value: "8",
                          ),
                          DropdownMenuItem(
                            child: Text("9"),
                            value: "9",
                          ),
                          DropdownMenuItem(
                            child: Text("10"),
                            value: "10",
                          ),
                        ],
                        onChanged: (value) {
                          c.dd.value = value!;
                        },
                      ),
                    ),
                    Obx(
                      () => DropdownButton(
                        value: c.mm.value,
                        alignment: Alignment.center,
                        items: [
                          DropdownMenuItem(
                            child: Text("MM"),
                            alignment: Alignment.center,
                            enabled: true,
                            value: "MM",
                          ),
                          DropdownMenuItem(
                            child: Text("1"),
                            value: "1",
                          ),
                          DropdownMenuItem(
                            child: Text("2"),
                            value: "2",
                          ),
                          DropdownMenuItem(
                            child: Text("3"),
                            value: "3",
                          ),
                          DropdownMenuItem(
                            child: Text("4"),
                            value: "4",
                          ),
                          DropdownMenuItem(
                            child: Text("5"),
                            value: "5",
                          ),
                          DropdownMenuItem(
                            child: Text("6"),
                            value: "6",
                          ),
                          DropdownMenuItem(
                            child: Text("7"),
                            value: "7",
                          ),
                          DropdownMenuItem(
                            child: Text("8"),
                            value: "8",
                          ),
                          DropdownMenuItem(
                            child: Text("9"),
                            value: "9",
                          ),
                          DropdownMenuItem(
                            child: Text("10"),
                            value: "10",
                          ),
                        ],
                        onChanged: (value) {
                          c.mm.value = value!;
                        },
                      ),
                    ),
                    Obx(
                      () => DropdownButton(
                        value: c.yy.value,
                        alignment: Alignment.center,
                        items: [
                          DropdownMenuItem(
                            child: Text("YY"),
                            alignment: Alignment.center,
                            enabled: true,
                            value: "YY",
                          ),
                          DropdownMenuItem(
                            child: Text("2014"),
                            value: "2014",
                          ),
                          DropdownMenuItem(
                            child: Text("2015"),
                            value: "2015",
                          ),
                          DropdownMenuItem(
                            child: Text("2016"),
                            value: "2016",
                          ),
                          DropdownMenuItem(
                            child: Text("2017"),
                            value: "2017",
                          ),
                          DropdownMenuItem(
                            child: Text("2018"),
                            value: "2018",
                          ),
                          DropdownMenuItem(
                            child: Text("2019"),
                            value: "2019",
                          ),
                          DropdownMenuItem(
                            child: Text("2020"),
                            value: "2020",
                          ),
                          DropdownMenuItem(
                            child: Text("2021"),
                            value: "2021",
                          ),
                          DropdownMenuItem(
                            child: Text("2022"),
                            value: "2022",
                          ),
                          DropdownMenuItem(
                            child: Text("2023"),
                            value: "2023",
                          ),
                        ],
                        onChanged: (value) {
                          c.yy.value = value!;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                TextButton(
                    onPressed: () {
                      c.submit(t1.text,t2.text,t3.text,t4.text);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return login();
                      },));
                      c.get().then((value) {
                        c.dis.value=true;
                      },);
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                SizedBox(height: 50),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
