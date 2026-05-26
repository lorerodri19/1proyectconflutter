import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, /*quita la banda DEBUG*/ 
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('titulo'),
        ),
        body: Center(
          child: Container(
            //tamaño de contenedor 
            width: 300,
            height: 300,
            //Espacio interno del cotenedor 
            margin: const EdgeInsets.all(20),
            //color de contenedor 
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            //contenido del contenedor 
            //filas
            child: Row(
              //espacio entre filas
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //hijos del contenedor chil=uno children=varios 
              children: [
                //hijo 1
                Column(
                  //centrar elementos columna
                  mainAxisAlignment: MainAxisAlignment.center,
                  //hijos del contenedor 
                  children: [
                    //hijo1
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                    //hijo2
                    Text(
                      'persona',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                //hijo 2 row
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text(
                      'telefono',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
          ),
        ),
      );
  }
}