import 'package:bloc_app/pages/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.indigoAccent,
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/city.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: TextFormField(
                  controller: _controller,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  decoration: InputDecoration(
                      labelText: 'Enter a city',
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.indigoAccent,
                      focusColor: Colors.white,
                      hoverColor: Colors.white,
                      border: OutlineInputBorder(),

                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  if(_controller.text != '') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(city: _controller.text),
                      ),
                    );
                  }
                },
                child: Text('Search', style: TextStyle(fontSize: 20.0, color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
