import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String sex = 'ชาย';

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    TextEditingController myFirstName = TextEditingController();
    TextEditingController myLastName = TextEditingController();
    TextEditingController myEmail = TextEditingController();
    TextEditingController myPhone = TextEditingController();

    Future<Null> saveData() async{
      print(myFirstName.text);
      print(myLastName.text);
      print(myEmail.text);
      print(myPhone.text);
      print(sex);
      if(_formkey.currentState.validate()){
        print('Save success!!');
      }else{
        print('Save Fail!!');
      }
    }


    return Scaffold(
      appBar: AppBar(title: Text('ลงทะเบียนสมาชิก'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.save_alt), onPressed:()=> saveData())
      ],),
    body: ListView(
      children: <Widget>[
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('รายละเอียดสมาชิก',style: Theme.of(context).textTheme.title,),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'ชื่อ',
                                  labelStyle: TextStyle(fontSize: 20.0)),
                              controller: myFirstName,
                              validator: (String value){
                                if(value.isEmpty){
                                  return 'กรุณากรอกชื่อ';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'นามสกุล',
                                  labelStyle: TextStyle(fontSize: 20.0)),
                              controller: myLastName,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: 'อีเมลล์',
                                  labelStyle: TextStyle(fontSize: 20.0)),
                              controller: myEmail,
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  labelText: 'โทรศัพท์',
                                  labelStyle: TextStyle(fontSize: 20.0)),
                              controller: myPhone,
                              validator: (String value){
                                if(value.isEmpty){
                                  return 'กรุณากรอกเบอร์โทรศัพท์';
                                }
                                return null;
                              },
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: ListTile(
                                title: const Text('เพศ',style: TextStyle(fontSize: 15.0),),
                                trailing: new DropdownButton(
                                    value: sex ,style: TextStyle(fontSize: 15.0,color: Colors.black),
                                    onChanged: (String newValue){
                                      setState(() {
                                        sex = newValue;
                                      });
                                    },
                                    items: <String>['ชาย', 'หญิง',].map<DropdownMenuItem<String>>((String value){
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    },).toList()
                                ),
                              )
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        )
      ],
    ),
    );
  }
}
