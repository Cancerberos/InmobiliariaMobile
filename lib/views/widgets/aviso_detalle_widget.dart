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
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Aviso: ", style: textStyle),
                    Text("Inmueble: ", style: textStyle),
                    Text("Dirección: ", style: textStyle),
                    Text("Valor: ", style: textStyle),
                    Text("Tipo Operación: ", style: textStyle),
                    Text("Estado Aviso:  ", style: textStyle),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(aviso.descripcion.toString(), style: textStyle),
                    Text(aviso.inmueble!.descripcion.toString(),
                        style: textStyle),
                    Text(
                        "${aviso.inmueble!.localidad!.title} ${aviso.inmueble!.prov}",
                        style: textStyle),
                    Text(aviso.valor.toString(),
                        style: textStyle, softWrap: true),
                    Text(aviso.tipoOperacion!.title.toString(),
                        style: textStyle),
                    Text(aviso.estadoAviso!.title.toString(), style: textStyle),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
