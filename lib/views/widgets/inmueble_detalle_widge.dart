import 'package:flutter/material.dart';

import '../../models/models.dart';

class InmuebleDetalle extends StatelessWidget {
  const InmuebleDetalle({required this.inmueble, Key? key}) : super(key: key);

  final Inmueble inmueble;

  final titleTextStyle = const TextStyle(
    fontSize: 20,
    overflow: TextOverflow.ellipsis,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  final leadingTextStyle = const TextStyle(
    fontSize: 12,
    overflow: TextOverflow.ellipsis,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 15,
      child: Card(
        color: const Color.fromARGB(255, 11, 54, 90).withOpacity(0.5),
        shadowColor: Colors.black54,
        elevation: 20.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ListTile(
                  title: Text("Descripción: ", style: leadingTextStyle),
                  subtitle: Text(inmueble.descripcion?.toString() ?? "",
                      style: titleTextStyle),
                ),
                ListTile(
                  title: Text("Cliente: ", style: leadingTextStyle),
                  subtitle: Text(inmueble.cliente?.title ?? "",
                      style: titleTextStyle),
                ),
                ListTile(
                  title:
                      Text("Fecha de Exclusividad: ", style: leadingTextStyle),
                  subtitle: Text(inmueble.fechaExclusividad?.toString() ?? "",
                      style: titleTextStyle),
                ),
                ListTile(
                  title: Text("Tipo Unidad: ", style: leadingTextStyle),
                  subtitle: Text(inmueble.tipoUnidad?.title ?? "",
                      style: titleTextStyle),
                ),
                ListTile(
                  title: Text("Localidad: ", style: leadingTextStyle),
                  subtitle: Text(inmueble.localidad?.title ?? "",
                      style: titleTextStyle),
                ),
                ListTile(
                  title: Text("Calle: ", style: leadingTextStyle),
                  subtitle: Text(inmueble.calle ?? "", style: titleTextStyle),
                ),
                ListTile(
                  title: Text("Altura: ", style: leadingTextStyle),
                  subtitle: Text(inmueble.altura ?? "", style: titleTextStyle),
                ),
                ListTile(
                  title: Text("Edificación: ", style: leadingTextStyle),
                  subtitle:
                      Text(inmueble.edificacion ?? "", style: titleTextStyle),
                ),
                ListTile(
                  title: Text("Piso: ", style: leadingTextStyle),
                  subtitle: Text(inmueble.piso ?? "", style: titleTextStyle),
                ),
                ListTile(
                  title: Text("Departamento: ", style: leadingTextStyle),
                  subtitle:
                      Text(inmueble.departamento ?? "", style: titleTextStyle),
                ),
                ListTile(
                  title: Text("Latitud: ", style: leadingTextStyle),
                  subtitle: Text(inmueble.latitud ?? "", style: titleTextStyle),
                ),
                ListTile(
                  title: Text("Longitud: ", style: leadingTextStyle),
                  subtitle:
                      Text(inmueble.longitud ?? "", style: titleTextStyle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
