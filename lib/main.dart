import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:login_app/log.dart';
import 'package:login_app/new_account.dart';

void main() {
  runApp(GetMaterialApp(
    home: login(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
  ));
}

class login extends StatelessWidget {
  control c1 = Get.put(control());

  TextEditingController l1=TextEditingController();
  TextEditingController l2=TextEditingController();

  @override
  Widget build(BuildContext context) {
      c1.permission1();
     c1.database1();

    return Scaffold(
        body: Container(
          child: Stack(alignment: Alignment.center, children: [
            Container(
              margin: EdgeInsets.only(left: 65),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  //  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(15)),
              height: 220,
              width: 370,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 30,
                    width: double.infinity,
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                    alignment: Alignment.center,
                  ),
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Obx(() => TextField(controller: l1,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(errorText: (c1.email_error.value == true)
                            ? "Enter Valid Email"
                            : null,
                            errorBorder:OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.red),
                                borderRadius: BorderRadius.circular(15)) ,
                            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.red),
                                borderRadius: BorderRadius.circular(15)),
                            hintText: " Email ID",
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15))),
                      ))),
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Obx(() => TextField(
                        controller: l2,
                        obscureText: true,obscuringCharacter: "*",
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            errorText: (c1.password_error.value == true)
                                ? "Enter Valid password"
                                : null,
                            errorBorder:OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.red),
                                borderRadius: BorderRadius.circular(15)) ,
                            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.red),
                                borderRadius: BorderRadius.circular(15)),
                            hintText: " Password",
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(15))),
                      ))),
                  Text(""),
                  TextButton(
                      onPressed: () {
                        c1.login(l1.text,l2.text,context);
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white,fontSize: 17),
                      )),

                ]),
              ),
            )
          ]),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      "image/dark-wall-empty-room-with-plants-floor-3d-rendering.jpg"))),
          height: double.infinity,
          width: double.infinity,
        ),
        floatingActionButton: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return account();
            },));
          },
          child: Container(
            color: Colors.transparent,
            height: 50,
            width: 220,
            child: Text(
              "=>  Create Account",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ));
  }
}
