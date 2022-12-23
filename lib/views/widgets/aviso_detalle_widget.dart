import 'package:flutter/material.dart';

import '../../models/models.dart';

class AvisoDetalle extends StatelessWidget {
  const AvisoDetalle({required this.aviso, Key? key}) : super(key: key);

  final Aviso aviso;

  final textStyle = const TextStyle(
    fontSize: 20,
    overflow: TextOverflow.ellipsis,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

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
        color: const Color.fromARGB(255, 46, 102, 148).withOpacity(0.5),
        shadowColor: Colors.black54,
        elevation: 10.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ListTile(
                    title: Text("Aviso: ", style: leadingTextStyle),
                    subtitle: Text(aviso.descripcion.toString(),
                        style: titleTextStyle)),
                ListTile(
                    title: Text("Inmueble: ", style: leadingTextStyle),
                    subtitle: Text(aviso.inmueble!.descripcion.toString(),
                        style: titleTextStyle)),
                ListTile(
                    title: Text("Dirección: ", style: leadingTextStyle),
                    subtitle: Text(
                        "${aviso.inmueble!.localidad!.title.toString()} ${aviso.inmueble!.prov}",
                        style: titleTextStyle)),
                ListTile(
                    title: Text("Valor: ", style: leadingTextStyle),
                    subtitle:
                        Text(aviso.valor.toString(), style: titleTextStyle)),
                ListTile(
                    title: Text("Tipo Operación: ", style: leadingTextStyle),
                    subtitle: Text(aviso.tipoOperacion!.title.toString(),
                        style: titleTextStyle)),
                ListTile(
                    title: Text("Estado: ", style: leadingTextStyle),
                    subtitle: Text(aviso.estadoAviso!.title.toString(),
                        style: titleTextStyle)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
