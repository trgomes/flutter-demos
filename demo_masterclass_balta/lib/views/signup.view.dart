import 'package:demo_masterclass_balta/controllers/signup.controller.dart';
import 'package:demo_masterclass_balta/view-models/view-models.signup.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  final _controller = new SignupController();

  var model = new SignupViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text("Cadastre-se"),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Nome inválido';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.name = val;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email inválida';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.email = val;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Senha inválida';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    model.password = val;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                model.busy
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          ),
                        ),
                      )
                    : FlatButton(
                        color: Theme.of(context).primaryColor,
                        child: Text("Cadastrar"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          }

                          setState(() {
                            model.busy = true;
                          });

                          _controller.create(model).then((data) {
                            print(data.token);
                            setState(() {
                              model.busy = false;
                            });
                          });
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
