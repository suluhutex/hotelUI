import 'package:flutter/material.dart';

class ForgotPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            ShaderMask(
              shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                          child: Container(
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/room3.jpg'),
                    fit: BoxFit.fitWidth,
                  )
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 170),
              padding: EdgeInsets.all(23),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  //topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(45.0),
                ),
                color: Colors.white,
              ),
              child: Form(
                //key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Reset your password',
                          style: Theme.of(context).textTheme.title.apply(
                              color: Colors.black87,
                              fontSizeDelta: 2,
                              fontWeightDelta: 2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Container(
                        color: Color(0xfff5f5f5),
                        child: TextFormField(
                          onChanged: (value) {
                            // setState(() {
                            //   memail = value;
                            //});
                          },
                          validator: (value) {
                            if (value.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                    .hasMatch(value)) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.person_outline),
                              labelStyle: TextStyle(fontSize: 14)),
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: MaterialButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, '/hotellists');
                          // if (_formKey.currentState.validate()) {
                          //   //todo: set is loading
                          //   await model.handleSignIn(memail, mpassword);
                          //   //todo: set stop loading
                          //   if(model.user == null){
                          //     //todo: user not logged in
                          //   } else{
                          //     //todo: user is logged in
                          //     Navigator.pushNamed(context, '/shoppinglist');
                          //}

                          //}
                        }, //since this is only a UI app
                        child: Text(
                          'SENT TO EMAIL',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.purple,
                        elevation: 0,
                        minWidth: 400,
                        height: 40,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text(
                            'Back to Login',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
