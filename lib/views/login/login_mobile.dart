part of login_view;

class _LoginMobile extends StatefulWidget {
  final LoginViewModel viewModel;

  _LoginMobile(this.viewModel);

  @override
  __LoginMobileState createState() => __LoginMobileState();
}

class __LoginMobileState extends State<_LoginMobile> {
  
    final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var email, password;
  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          
          backgroundColor: Colors.white,
          body: formSetup(context)),
    );
  }

  Widget formSetup(BuildContext context) {
    return new Form(
        key: _formKey,
        child: SingleChildScrollView(
                  child: Column(
          
          
            children: <Widget>[
             
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 50, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Login",style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w600,fontSize: 30),),
                  
                     Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child:    TextFormField(
                      autocorrect: false,
                      validator: (val) {
                        if (val.length == 0)
                          return "Please enter email";
                        else if (!val.contains("@"))
                          return "Please enter valid email";
                        else
                          return null;
                      },
                      onSaved: (val) => email = val,
                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.black)),
                        filled: true,
                        contentPadding: EdgeInsets.only(
                            bottom: 10.0, left: 10.0, right: 10.0),
                        labelText: "Email ID",
                      ),
                    ),
                    ),
                  Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: TextFormField(
                        autocorrect: false,
                        validator: (val) {
                          if (val.length == 0)
                            return "Please enter password";
                          else if (val.length <= 3)
                            return "Your password should be more then 6 char long";
                          else
                            return null;
                        },
                        onSaved: (val) => password = val,
                        style: TextStyle(color: Colors.black),
                        decoration: new InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.black)),
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              bottom: 10.0, left: 10.0, right: 10.0),
                          labelText: "Create Password",
                        ),
                      ),
                    ),
                    
                  Padding(
                      padding:
                          const EdgeInsets.only( top: 30),
                      child: RaisedButton(
                          splashColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                        widget.viewModel.loginUser(email,password);
                              _scaffoldKey.currentState
                                  .showSnackBar(new SnackBar(
                                content: new Text(
                                    "Your email: $email and Password: $password"),
                              ));
                            }
                          },
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                
                              ],
                            ),
                          )),
                    ),
                   
                  ],
                ),
              )
            ],
          ),
        ));
  }
}