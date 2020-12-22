import 'package:flutter/material.dart';

class FromDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final loginFormKey = GlobalKey<FormState>();
  String username, password;
  AutovalidateMode autovalidate = AutovalidateMode.disabled;

  void submitLoginForm() {
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      debugPrint('username:$username');
      debugPrint('password:$password');
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Login...')));
    } else {
      autovalidate = AutovalidateMode.always;
    }
  }

  String validatorUsername(value) {
    if (value.isEmpty) {
      return 'username is required';
    }
    return null;
  }

  String validatorPassword(value) {
    if (value.isEmpty) {
      return 'password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: loginFormKey,
        child: Column(
          children: [
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'username', helperText: ''),
              onSaved: (value) {
                username = value;
              },
              validator: validatorUsername,
              autovalidateMode: autovalidate,
            ),
            TextFormField(
              obscureText: true,
              decoration:
                  InputDecoration(labelText: 'password', helperText: ''),
              onSaved: (value) {
                password = value;
              },
              validator: validatorPassword,
              autovalidateMode: autovalidate,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  elevation: 0.0,
                  onPressed: submitLoginForm),
            )
          ],
        ));
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController.text = 'moren';
    textEditingController.addListener(() {
      debugPrint(textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: '用户名',
          hintText: '请输入用户名',
          // border: InputBorder.none
          filled: true,
          border: OutlineInputBorder()),
      // onChanged: (value) {
      //   debugPrint(value);
      // },
      onSubmitted: (value) {
        debugPrint(value);
      },
    );
  }
}
