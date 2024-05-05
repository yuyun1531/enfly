import 'package:enfly/utils/TTSUtil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _status = 'no-action';

  final formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  initState() {
    _loadUsername();
    super.initState();
    print(_status);
  }

  void _loadUsername() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _username = _prefs.getString("saved_username") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      if (_remeberMe) {
        //_controllerUsername.text = _username ?? "";
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    //final _auth = Provider.of<AuthModel>(context, listen: true);
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          key: PageStorageKey("Divider 1"),
          children: <Widget>[
            const SizedBox(
              height: 220.0,
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.person,
                    size: 175.0,
                  )),
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Username'),
                      //validator: (val) =>
                      //val.isEmpty ? 'Username Required' : null,
                      //onSaved: (val) => _username = val,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      //controller: _controllerUsername,
                      autocorrect: false,
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      //validator: (val) =>
                      //val.length < 1 ? 'Password Required' : null,
                      //onSaved: (val) => _password = val,
                      obscureText: true,
                      //controller: _controllerPassword,
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red, // background
                  backgroundColor: Colors.blue, // foreground
                ),
                onPressed: () {
                  var Ttser = TTSUtil.getInstance();
                  Ttser.initTTS();
                  Ttser.speak(
                      'Hello, my name is Chris. Im from the United States.');
                },
                child: const Text(
                  '登录',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // trailing: !globals.isBioSetup
              //     ? null
              //     : NativeButton(
              //         child: Icon(
              //           Icons.fingerprint,
              //           color: Colors.white,
              //         ),
              //         color: Colors.redAccent[400],
              //         onPressed: globals.isBioSetup
              //             ? loginWithBio
              //             : () {
              //                 globals.Utility.showAlertPopup(context, 'Info',
              //                     "Please Enable in Settings after you Login");
              //               },
              //       ),
            ),
          ],
        ),
      ),
    );
  }
}
