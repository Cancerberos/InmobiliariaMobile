import 'package:flutter/material.dart';

import '../../models/models.dart';

class InmuebleCaracteristicas extends StatelessWidget {
  const InmuebleCaracteristicas({Key? key, required this.aviso})
      : super(key: key);

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
        color: const Color.fromARGB(255, 46, 102, 148).withOpacity(0.5),
        shadowColor: Colors.black54,
        elevation: 20.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              "Características",
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(5),
              itemCount: aviso.inmueble?.inmueble?.length,
              itemBuilder: (context, index) {
                return generarListaCaracteristicas(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget generarListaCaracteristicas(int index) {
    return Row(
      children: [
        Text("${aviso.inmueble!.inmueble![index].tipoCaracteristica?.title}: ",
            style: textStyle),
        const Spacer(),
        Text("${aviso.inmueble!.inmueble![index].cant}", style: textStyle),
        const SizedBox(width: 120.00),
        generarIconoTipoCaracteristica(
            aviso.inmueble!.inmueble![index].tipoCaracteristica?.href),
      ],
    );
  }

  Widget generarIconoTipoCaracteristica(String? href) {
    var idTipo = (href?.substring((href.indexOf("TipoCaracteristica/")) + 19));
    Icon icon = const Icon(Icons.bathroom, color: Colors.white);
    if (idTipo == "2") {
      icon = const Icon(Icons.bedroom_parent, color: Colors.white);
    } else if (idTipo == "3") {
      icon = const Icon(Icons.outdoor_grill, color: Colors.white);
    } else if (idTipo == "4") {
      icon = const Icon(Icons.pool, color: Colors.white);
    } else if (idTipo == "5") {
      icon = const Icon(Icons.garage, color: Colors.white);
    } else if (idTipo == "6") {
      icon = const Icon(Icons.wifi, color: Colors.white);
    } else if (idTipo == "7") {
      icon = const Icon(Icons.tv, color: Colors.white);
    } else if (idTipo == "8") {
      icon = const Icon(Icons.heat_pump, color: Colors.white);
    } else if (idTipo == "9") {
      icon = const Icon(Icons.balcony, color: Colors.white);
    } else if (idTipo == "10") {
      icon = const Icon(Icons.square_foot, color: Colors.white);
    }
    return icon;
  }
}
