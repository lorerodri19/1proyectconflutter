import 'dart:math';

import 'package:flutter/material.dart';
class Registrousuario  extends StatelessWidget {
  const Registrousuario ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Formulario(),
    );
  }
}
class Formulario extends StatefulWidget{
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
  }

class _FormularioState extends State<Formulario> {
//llave formulario 
final _formkey = GlobalKey<FormState>();
//controladores
final nombreController = TextEditingController();
final emailController = TextEditingController();
final phoneController = TextEditingController();
final passwordController = TextEditingController();
//variables del sistema 
String rol = "Usuario";
DateTime? fechaNacimiento; // este tipo de dato puede estar vacio "?" variable nulo 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de Usuario"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formkey,
          child: Column(
            children: [
              //icono principal
              const Icon(
                Icons.account_circle,
                size: 120,
                color: Color.fromARGB(255, 141, 230, 40),
              ),

              const SizedBox(height: 20),

              const Text(
                "Registro Usuario",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),
              //nombre
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(
                  labelText: "Nombre Usuario",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 20),
              //email
              TextFormField(
                controller: emailController,

                keyboardType: TextInputType.emailAddress,//va averificar que sea tipo email

                decoration: InputDecoration(
                  labelText: "Correo Electronico",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),
              //telefono
              TextFormField(
                controller: phoneController,

                keyboardType:  TextInputType.phone,

                decoration: InputDecoration(
                  labelText: "telefono",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 20),
              //contraseña
              TextFormField(
                controller: passwordController,

                obscureText: true,

                decoration: InputDecoration(
                  labelText: "contraseñas",
                  border:  OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),
              //lista
              DropdownButtonFormField(
                value: rol,

                decoration: const InputDecoration(
                  labelText: "Rol",
                  border: OutlineInputBorder(),
                ),
                items: const[
                  DropdownMenuItem(
                    value: "Usuario",
                    child: Text("Usuario"),
                  ),
                  DropdownMenuItem(
                    value: "Administrador",
                    child: Text("Administrador"),
                  ),
                  DropdownMenuItem(
                    value: "Cliente",
                    child: Text("Cliente"),
                  ),
                ],
                onChanged: (value) {
                    setState(() {
                      rol = value!;
                    });
                  },
              ),

              const SizedBox(height: 20), //espacio 

              SizedBox(
                width: double.infinity, //espacio horizontal completo automatico
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.calendar_month),

                  label: Text(
                    fechaNacimiento == null
                    ? "seleccionar Fecha de Nacimiento"
                    : "Fecha: ${fechaNacimiento!.day}/${fechaNacimiento!.month}/${fechaNacimiento!.year}",
                  ),
                  onPressed: () async {
                    DateTime? pickdate = await showDatePicker(
                      context: context,
                      initialDate:DateTime.now(), 
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2027),
                    );
                    if (fechaNacimiento !=null){
                      setState(() {
                        fechaNacimiento = pickdate;
                      });
                    }
                  }
                  )

              ),

            ],
          )
        ),
      ),
    );
  }
}
