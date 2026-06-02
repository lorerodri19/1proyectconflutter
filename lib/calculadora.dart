import 'package:flutter/material.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Column(
        children: [
          Expanded(child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 0, 0, 0),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const[
                Text(
                  "5 + 7",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(height: 10),
                Text(
                  "12",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ),
          Row(children: [boton("7"), boton("8"), boton("9"),boton("/")]),
          Row(children: [boton("4"), boton("5"), boton("6"), boton("*")]),
          Row(children: [boton("1"), boton("2"), boton("3"), boton("+")]),
        ],
      ),
      ),
    );
    
  }//build
  Widget boton(String texto){
    return Expanded(
      child: ElevatedButton(
        onPressed: () {}, 
        child: Text("$texto")),
    );
  }
}


