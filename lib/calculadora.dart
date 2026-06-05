
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String operacion = "";
  String resultado = "0";
  String numeroActual = "";
  List<String> elementos = [];

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
              children:[
                Text(
                  operacion,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(height: 10),
                Text(
                  resultado,
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
          Row(children: [boton("CA"), boton("CE"), boton("<-"), boton("")]),
          Row(children: [boton("7"), boton("8"), boton("9"),boton("/")]),
          Row(children: [boton("4"), boton("5"), boton("6"), boton("*")]),
          Row(children: [boton("1"), boton("2"), boton("3"), boton("-")]),
          Row(children: [boton("0"), boton("."), boton("="), boton("+")]),
        ],
      ),
      ),
    );
    
  }//build
  void actionboton(String valor){
    setState(() {
      switch (valor) {
        case "CA":
        operacion = "";
        resultado = "0";
        break;
        case "CE":
        operacion = "";
        break;
        case "<-":
        if (operacion.isNotEmpty){
          operacion = operacion.substring(0, operacion.length - 1);
        }
        break;
        case "+":
        case "-":
        case "*":
        case "/":
        if (numeroActual.isNotEmpty){
          elementos.add(numeroActual);
          elementos.add(valor);
          numeroActual = "";
          operacion += valor;
        }
        print(elementos);
        
        break;
        default:
        operacion += valor;
        numeroActual += valor;
      }
    }
    );
  }
  Widget boton(String texto){
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          actionboton(texto);
        }, 
        child: Text("$texto")),
    );
  }
}
  



