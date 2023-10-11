import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/main.dart';

import 'edit_page.dart';
import 'log.dart';

class view extends StatelessWidget {


  control c2 = Get.put(control());
DATA()
{
  c2.database1().then((value) {
    c2.get();
  });
}
  @override
  Widget build(BuildContext context) {
  DATA();
    return Scaffold(
      appBar: AppBar(),
      body:  Obx(() =>(c2.dis.value==true)?ListView.builder  (
        itemCount: c2.name.length,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane:
            ActionPane(motion: ScrollMotion(), children: [
              SlidableAction(
                onPressed: (context) {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(title: Text("yor are syore this ${c2.strname.value} deta is delete"),actions: [
                      TextButton(onPressed: () async {
                        c2.delete(c2.id[index]);
                        Navigator.pop(context);
                        c2.get().then((value) {
                          c2.dis.value=true;
                        },);
                        }, child: Text("Yes")),
                      TextButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: Text("No")),
                    ],);
                  },);

                },
                icon: Icons.delete,label: "Delete",),
              SlidableAction(onPressed: (context) {
                c2.edit(index,context);
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                //   return update();
                //   },));
              },icon: Icons.edit,label: "Edit",)
            ]),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                FileImage(File(c2.img1.value[index])),
              ),
              title: Text("${c2.name.value[index]}"),
              subtitle: Text("${c2.contact.value[index]}"),
            ),
          );
        },
      ):Center(child: CircularProgressIndicator())),
      drawer: Drawer(backgroundColor: Color(0xFF020236),shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.cyanAccent)),
          child: Column(
        children: [
          UserAccountsDrawerHeader(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.white),color: Color(
              0xFF020236)),currentAccountPicture:CircleAvatar(backgroundImage: FileImage(File(c2.str_img.value))),
              accountName: Text("${c2.strname.value}",style: TextStyle(color: Colors.white),),
              accountEmail: Text("${c2.stremail.value}",style: TextStyle(color: Colors.white),)),
          ListTile(leading: Text("Gender :"),title: Text("${c2.gender.value}",style: TextStyle(color: Colors.white),),),
          ListTile(leading: Text("Hobby :"),title: Text("${c2.strhobby.value}"),),
          ListTile(leading: Text("Date of Birth :"),title: Text("${c2.dd.value}/${c2.mm.value}/${c2.yy.value}"),),
      Spacer(),
          ElevatedButton.icon(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return login();
            },));
          }, icon: Icon(Icons.logout), label: Text("Logout"),)
        ],
      )),
    );
  }
}
