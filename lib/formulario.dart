import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
bool aceptaTerminos = false;
bool notificaciones = false; // false empiza encendido y true empieza apagado

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
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return "ingresa tu nombre";
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return "ingresa tu correo";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                    return "ingresa un correo electronico valido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              //telefono
              TextFormField(
                controller: phoneController,

                keyboardType:  TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, //solo permite numeros
                ],

                decoration: InputDecoration(
                  labelText: "telefono",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return "ingresa tu numero";
                  }
                  if (value.length < 10 ){
                    return "el numero de telefono debe tener 10 digitos ";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              //contraseña
              TextFormField(
                controller: passwordController,

                obscureText: true,

                decoration: InputDecoration(
                  labelText: "contraseña",
                  border:  OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return "ingresa una contraseña";
                  }
                  if(value.length < 6) {
                    return "la contraseña debe tener al menos 6 caracteres";
                  }
                  return null;
                },
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
              //calendario
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

              const SizedBox(height: 30),
              
              //checkbox para terminos y condiciones 
              CheckboxListTile(
                title: const Text("Acepto los terminos y condiciones"),
                value: aceptaTerminos, 
                onChanged: (value){
                  setState(() {
                    aceptaTerminos = value!;//actualizar el estado del checkbox
                  });
                }),
                const SizedBox(height: 10),
                //switch para recibir notificaciones 
                SwitchListTile(
                  title: const Text("recibir notificaciones"),

                  value: notificaciones, 
                  onChanged: (value){
                    setState(() {
                      notificaciones = value;
                    });
                  }
                  ),

                const SizedBox(height: 20),
                //boton de registro
                SizedBox(
                  width: double.infinity, //espacio horizontal completo automaticamente
                  height: 50, //altura fija para el boton 

                  child: ElevatedButton(
                    onPressed: (){
                      //aqui puedes agregar la logica para validar el formulario y registrar al usuario 
                      if (_formkey.currentState!.validate() && aceptaTerminos){
                        //logica
                        print("Formulario Valido. Procesar registro...");
                      }
                      else{
                        print("Por favor, complete el formulario y acepte los terminos.");
                      }
                    }, 
                    child: const Text("Registrar"),
                    )
                )

            ],
          )
        ),
      ),
    );
  }
}
