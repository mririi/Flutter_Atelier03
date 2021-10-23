import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  _validateFields() {
    final validSnackBar = SnackBar(
      content: Text(
        'Your fields are correct',
        style: TextStyle(fontSize: 16.0),
      ),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
      backgroundColor: Colors.green,
    );
    final invalidSnackBar = SnackBar(
      content:
      Text('Your fields are not correct', style: TextStyle(fontSize: 16.0)),
      action: SnackBarAction(
        label: "Not Valid!",
        textColor: Colors.white,
        onPressed: () {},
      ),
      backgroundColor: Colors.red,
    );
    if (_formKey.currentState!.validate()) {
      scaffoldKey.currentState!.showSnackBar(validSnackBar);
    } else {
      scaffoldKey.currentState!.showSnackBar(invalidSnackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("Forms"),
          ),
          body: Center(
            child: InkWell(
              onTap: _validateFields,
              child: Card(
                elevation: 8.0,
                child: Container(
                  height: 300.0,
                  width: 250.0,
                  child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your name...";
                                  }
                                  return null;
                                },
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: "Your name...",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: "Your email...",
                                  border: OutlineInputBorder(),
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty || !value.contains(".")) {
                                    return "Please enter valid email address!";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: "Your password...",
                                  border: OutlineInputBorder(),
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty || value.length < 6) {
                                    return "Please enter strong password:(";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              InkWell(
                                child: Container(
                                  height: 50.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Validate",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ),
        ));
  }
}