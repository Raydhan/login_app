import 'dart:io';
import 'dart:math';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_app/edit_page.dart';
import 'package:login_app/view_data.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

class control extends GetxController
{
  //data view
  RxList name=[].obs;
  RxList contact=[].obs;
  RxList img1=[].obs;
  RxList id=[].obs;
  RxList email=[].obs;

  //edit page
  RxBool b=false.obs,b1=false.obs,b2=false.obs;

  RxString gender="".obs;
  RxBool img=false.obs,img3=false.obs;
  RxBool email_error=false.obs,password_error=false.obs;
  RxBool error1=false.obs,error2=false.obs,error3=false.obs,error4=false.obs;
  RxString dd="DD".obs;
  RxString mm="MM".obs;
  RxString yy="YY".obs;
  //RxList id=[].obs;

  RxBool dis=false.obs;


  RxList password=[].obs;
  RxBool hobby1=false.obs,hobby2=false.obs,hobby3=false.obs;
  ImagePicker _picker = ImagePicker();
  XFile? image;


  RxString strname="".obs,strcontact="".obs,stremail="".obs,strpassword="".obs,str_img="".obs,strhobby="".obs;

  Database? database;
 Future database1()
  async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    // open the database
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE FORM (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, contact TEXT, email TEXT, password TEXT, gender TEXT, hobby TEXT, data TEXT, month TEXT, year TEXT, image TEXT)');
        });
  }
  permission1()
  async{
    var status = await Permission.storage.status;
    if(status.isDenied)
      {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.storage,
        ].request();
        print(statuses[Permission.storage]);
      }
  }

 Future<void> get_image(String s)
 async {
   if(s=="camera") {
     image = await _picker.pickImage(source: ImageSource.camera);
     if( image! == null) {
     }
     img3.value=true;
     img.value=true;
   }
   else
     {
       image = await _picker.pickImage(source: ImageSource.gallery);
       if( image! == null) {
       }
       img3.value=true;
     }
   img.value=true;
 }

  submit(String t1,String t2,String t3,String t4)
 async {

      strname.value=t1;
      strcontact.value=t2;
      stremail.value=t3;
      strpassword.value=t4;
      error1.value=false;
      error2.value=false;
      error3.value=false;
      error4.value=false;
     var reg_Exp=r'^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$';
     RegExp rx=RegExp(reg_Exp);
     var reg_Exp1=r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
     RegExp rx1=RegExp(reg_Exp1);
     if(strname.value.isEmpty)
        {
          error1.value=true;
        }
      else if(strcontact.value.isEmpty)
        {
          error2.value=true;
        }
      else if(!rx.hasMatch(strcontact.value))
        {
          error2.value=true;
        }
      else if(stremail.value.isEmpty)
        {
          error3.value=true;
        }
      else if(!rx1.hasMatch(stremail.value))
        {
          error3.value=true;
        }
      else if(strpassword.value.isEmpty)
        {
          error4.value=true;
        }
      else
        {

          StringBuffer br=StringBuffer();
          if(hobby1==true)
            {
              br.write("Cricket");
            }
          if(hobby2==true)
            {
              if(br.length>0)
                {
                  br.write("/");
                }
              br.write("Reading");
            }
           if(hobby3==true)
             {
               if(br.length>0)
             {
               br.write("/");
             }
               br.write("Wreting");
             }
           strhobby.value=br.toString();
           var path=await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS)+"/dhruv";
           Directory dr=Directory(path);
           if(!await dr.exists())
             {
               await dr.create();
             }
           int r=Random().nextInt(99999);
           String img_name="img${r}.jpg";
           File file=File("${dr.path}/${img_name}");
           file.writeAsBytes(await image!.readAsBytes());
           str_img.value=file.path;

           print("image=${str_img.value}");
           print("hobby=${strhobby.value}");

           String insert_qur="insert into FORM values(null,'${strname.value}','${strcontact.value}','${stremail.value}','${strpassword.value}','${gender.value}','${strhobby.value}','${dd.value}','${mm.value}','${yy.value}','${str_img.value}')";
           int i=await database!.rawInsert(insert_qur);
           t1="";
           t2="";
           t3="";
           t4="";

           print("hobby :-${strhobby.value}");
            print("strimg :-${str_img.value}");
           print("insert data=${i}");
          print("record is inserted");

        }
 }

  login(String l1,String l2,context)
 async {
    String strEmail=l1;
    String strPassword=l2;
    email_error.value=false;
    password_error.value = false;
    if(strEmail.isEmpty)
    {
      email_error.value=true;
    }
    else if(strPassword.isEmpty) {
      password_error.value = true;
    }
    else
    {
      print("your data is correct");
      String cheke_qur="select * from FORM where email='$strEmail' and password='$strPassword'";
      List<Map> m=await database!.rawQuery(cheke_qur);
      if(m.length==1)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return view();
          },));
          l1="";
          l2="";
        }
    }



 }

 Future<void> get()
  async {
    name.value.clear();
    contact.value.clear();
    email.value.clear();
    id.value.clear();
    img1.value.clear();

    dis.value=false;
    String select_qur="select * from FORM";
    List<Map> m1=[];
    m1=await database!.rawQuery(select_qur);
    m1.forEach((element) {
      name.value.add(element['name']);
      contact.value.add(element['contact']);
      email.value.add(element['email']);
      id.value.add(element['id']);
      img1.value.add(element['image']);
    });
    dis.value=true;
    print("m1=${m1}");
  }

  delete(int id)
  {
    String delete1="delete from FORM where id=$id";
    database!.rawDelete(delete1);
  }


  Future<void> edit(int index,context)
  async{
    String edit1="select * from FORM where id=${id.value[index]}";
    List<Map> m=[];
      m=await database!.rawQuery(edit1);
      print("M=${m[0]}");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return update(m[0]);
      },));
  }
}
