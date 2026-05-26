import 'package:flutter/material.dart';

class Tarjeta extends StatelessWidget {
  const Tarjeta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, /*quita la banda DEBUG*/
      title: 'Tarjeta',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tarjeta Informacion'),
        ),
        body: Center(
          child: Container(
            //tamaño de contenedor 
            width: 600,
            height: 300,
            //Espacio interno del contenedor 
            margin: const EdgeInsets.all(20),
            //color de contenedor 
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 158, 243, 161),
              borderRadius: BorderRadius.circular(20),
            ),
            //contenido del contenedor 
            //filas
            child: Row(
              //espacio entre filas 
              mainAxisAlignment: MainAxisAlignment.start,
              //hijos del contenedor 
              children: [
                SizedBox(width:125),
                //hijo 1
                Column(
                  //centrar elementos columna
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //hijos del contenedor 
                  children: [
                    //hijo1
                    Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 50,
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Juan Peréz',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    Row(
                      children: [
                      Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'juan@gmail.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '3001234567',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                      Icons.location_on,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'bogota',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )   
                      ],
                    ),            
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}