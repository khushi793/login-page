
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:toast/toast.dart';
import 'package:email_validator/email_validator.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  FlutterSecureStorage storage= new FlutterSecureStorage();
  TextEditingController fname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController pwd = new TextEditingController();
  String fname1='',lname1='',email1='',pwd1='';
  @override
  void initState(){

    super.initState();
    fname.addListener(() {
      if (fname.text != null){
        fname1=fname.text.trim();
      }
    });
    lname.addListener(() {
      if (lname.text != null){
        lname1=lname.text.trim();
      }
    });
    email.addListener(() {
      if (email.text != null){
        email1=email.text.trim();
      }
    });
    pwd.addListener(() {
      if (pwd.text != null){
        pwd1=pwd.text.trim();
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(

            color: Color(0xFFFF7979),
          child: Stack(
            children: [
               Image.asset("images/mobile.png",height: double.infinity,width: double.infinity,),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: Center(
                          child: Text('Learn to code by \nWatching others ',textDirection: TextDirection.ltr,style: TextStyle(
                            fontSize: 35,
                            color: Colors.white
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child:  Column(
                            children: [
                              Text('See how experienced developers solve'
                                ,textDirection: TextDirection.ltr,style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ),),
                              Text('problems in real-time. Watching'
                                ,textDirection: TextDirection.ltr,style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ),),
                              Text('scripted tutorials is great,but'
                                ,textDirection: TextDirection.ltr,style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ),),
                              Text('understanding how developers think is'
                                ,textDirection: TextDirection.ltr,style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ),),
                              Text('invaluable.'
                                ,textDirection: TextDirection.ltr,style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ),),
                            ],
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: Center(
                          child: SizedBox(
                            width: 300,height: 60,
                            child: ElevatedButton(

                              onPressed: () {

                                // Respond to button press
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                primary: Color(0xFF5d54a3),), // Backg
                              child: Text.rich(TextSpan(

                                text: 'Try it free 7 days',style: TextStyle(
                                fontWeight: FontWeight.bold,

                              ),children: [
                                TextSpan(
                                  text: ' then \n\t\t\t\t\t\$/mo. thereafter',style: TextStyle(
                                  fontWeight: FontWeight.normal
                                )
                                )
                              ]
                              ))
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: SizedBox(
                          height: 410,width: 300,
                          child: Card(
                              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                            elevation: 10,
                            child: SingleChildScrollView(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 260,
                                      padding: EdgeInsets.only(top: 15),
                                      child: TextFormField(
                                        controller: fname,
                                        validator:  (value) {
                                          if (value == null || value.isEmpty){
                                            return 'FullName cannot be empty';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                         // labelText: 'Label text',
                                         // errorText: 'Error message',
                                          hintText: 'First Name',
                                          border: OutlineInputBorder(),

                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 260,
                                      padding: EdgeInsets.only(top: 15),
                                      child: TextFormField(
                                        controller: lname,
                                        validator:  (value) {
                                          if (value == null || value.isEmpty){
                                            return 'Last Name cannot be empty';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                         // labelText: 'Label text',
                                          //errorText: 'Last Name cannot be empty',
                                          hintText: 'Last Name',
                                          border: OutlineInputBorder(),

                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 260,

                                      padding: EdgeInsets.only(top: 15),
                                      child: TextFormField(
                                      //  validator: ,
                                        controller: email,
                                        validator:  (value) {
                                          if(Validate(email.text)==false){
                                            return ' enter valid Email';
                                          }

                                          if (value == null || value.isEmpty) {
                                            return 'Email cannot be empty';

                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                         // labelText: 'Label text',
                                          //errorText: 'Last Name cannot be empty',
                                          hintText: 'Email Address',

                                          border: OutlineInputBorder(),

                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 260,
                                      padding: EdgeInsets.only(top: 15),
                                      child:TextFormField(
                                        controller: pwd,
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Password',
                                        ),
                                        validator:  (value) {
                                     if (value == null || value.isEmpty){
                                    return 'PassWord cannot be empty';
                                    }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Center(
                                        child: SizedBox(
                                          width: 260,height: 50,
                                          child: ElevatedButton(

                                            onPressed: () {

                                              if(_formKey.currentState!.validate()){
                                                Toast.show('Login is Complete',duration: Toast.lengthLong,gravity: Toast.bottom);
                                              }
                                              // Respond to button press
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 8,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                              primary: Color(0xFF37cc8a),),

                                            child: Text('CLAIM YOUR FREE TRAIL'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text.rich(TextSpan(
                                        text: 'By clicking the button you are agreeing \n\t\t\t\t\t to our',
                                        children:<TextSpan>[
                                          TextSpan(
                                            text: ' tearms and condition ',style: TextStyle(
                                              fontWeight: FontWeight.bold,color: Colors.red,
                                          ),
                                          )
                                        ]

                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ),
                        ),
                      )

                    ],
                  ),
                )

    ],
    )
      ),
    ));
  }
  bool Validate(String email) {
    bool isvalid = EmailValidator.validate(email);
    print(isvalid);
    return isvalid;
  }
  bool isValidinput() {

    bool isvalid = true;

    if(fname1==''){
      isvalid=false;
      Toast.show('First Name cannot be empty',duration: Toast.lengthLong,gravity: Toast.bottom);
    }
    else if(lname1 ==''){
      isvalid=false;
      Toast.show('Last Name cannot be empty',duration: Toast.lengthLong,gravity: Toast.bottom);
    }
    else if(email1==''){
      isvalid=false;
      Toast.show('Looks like this is not an email',duration: Toast.lengthLong,gravity: Toast.bottom);
    }
    else if(pwd1==''){
      isvalid=false;
      Toast.show('PassWord cannot be empty',duration: Toast.lengthLong,gravity: Toast.bottom);
    }

    return isvalid;
  }

}
void main(){

 runApp(Login());

}
