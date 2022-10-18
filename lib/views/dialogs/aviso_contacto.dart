import 'package:flutter/material.dart';

import '../../models/models.dart';

Color _formElementsColor = const Color.fromARGB(255, 3, 35, 62);
Color _formElementsColor2 = const Color.fromARGB(255, 137, 193, 238);

Future avisoContacto(Aviso aviso, BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ingrese su consulta: '),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                //controller: userController.userController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  color: _formElementsColor,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: _formElementsColor2.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Ingrese su Nombre',
                  hintStyle: TextStyle(color: _formElementsColor2),
                  labelText: 'Nombre',
                  labelStyle: TextStyle(color: _formElementsColor2),
                  suffixIcon: Icon(
                    Icons.person_add_alt_1_outlined,
                    color: _formElementsColor,
                  ),
                ),
              ),
              const Divider(),
              TextField(
                //controller: userController.userController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  color: _formElementsColor,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: _formElementsColor2.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Ingrese su Apellido',
                  hintStyle: TextStyle(color: _formElementsColor2),
                  labelText: 'Apellido',
                  labelStyle: TextStyle(color: _formElementsColor2),
                  suffixIcon: Icon(
                    Icons.person_add_alt_outlined,
                    color: _formElementsColor,
                  ),
                ),
              ),
              const Divider(),
              TextField(
                //controller: userController.userController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  color: _formElementsColor,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: _formElementsColor2.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Ingrese su Email',
                  hintStyle: TextStyle(color: _formElementsColor2),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: _formElementsColor2),
                  suffixIcon: Icon(
                    Icons.email_outlined,
                    color: _formElementsColor,
                  ),
                ),
              ),
              const Divider(),
              TextField(
                textAlignVertical: TextAlignVertical.top,
                maxLength: 120,
                minLines: 5,
                maxLines: 5,
                //controller: userController.userController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  color: _formElementsColor,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: _formElementsColor2.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Ingrese su Consulta',
                  hintStyle: TextStyle(color: _formElementsColor2),
                  labelText: 'Consulta',
                  labelStyle: TextStyle(color: _formElementsColor2),
                  suffixIcon: Icon(
                    Icons.person_add_alt_1_outlined,
                    color: _formElementsColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              showConfirmationSnackBar(aviso);
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );

void showConfirmationSnackBar(Aviso aviso) {
  SnackBar(content: Text('Ha consulta por ${aviso.descripcion}'));
}
