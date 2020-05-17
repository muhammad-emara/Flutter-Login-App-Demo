import 'package:flutter/material.dart';

class LoginSignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignupPage> {
  final _formKey = new GlobalKey<FormState>();
  bool _isLoading = false;
  String _email;
  String _password;
  bool _isloginForm = false;
  String _errorMessage;
  bool _isLoginForm;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Login App"),
      ),
      /* body: new Container(
        child: new Text("Hello There !"),
      ),*/
      body: Stack(
        children: <Widget>[_showForm(), showCircularProgress()],
      ),
    );
  }

  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/drnutrition-logo.png'),
        ),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Your Email',
            icon: new Icon(
              Icons.email,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email is required' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Your Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password is requires' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showPrimaryButton() {
    if (_isloginForm == null) {
      _isloginForm = false;
    }
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
          onPressed: validateAndSubmit,
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.deepPurple,
          child: new Text(
            _isloginForm ? "Login" : "Register",
            style: new TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget showSecondaryButton() {
    return new FlatButton(
        onPressed: toggleFomMode,
        child: new Text(
          _isloginForm ? 'Register' : 'Have an Account? sing in',
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
        ));
  }

  Widget showErrorMessge() {
    if (_errorMessage != null && _errorMessage.length > 0) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0, color: Colors.red, fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget _showForm() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
          child: new ListView(
        shrinkWrap: true,
        children: <Widget>[
          showLogo(),
          showEmailInput(),
          showPasswordInput(),
          showPrimaryButton(),
          showSecondaryButton(),
          showErrorMessge()
        ],
      )),
    );
  }

  void toggleFomMode() {
    resetForm();
    setState(() {
      _isloginForm = !_isloginForm;
    });
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }
}
