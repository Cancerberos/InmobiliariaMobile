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
        color: const Color.fromARGB(255, 11, 54, 90).withOpacity(0.5),
        shadowColor: Colors.black54,
        elevation: 20.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Características",
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Habitaciones: ", style: textStyle),
                  Text("3", style: textStyle),
                  Icon(
                    Icons.bedroom_parent_outlined,
                    color: textStyle.color,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Baños:             ", style: textStyle),
                  Text("2", style: textStyle),
                  Icon(
                    Icons.bathtub_outlined,
                    color: textStyle.color,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Calefacción:   ", style: textStyle),
                  Text("3", style: textStyle),
                  Icon(
                    Icons.heat_pump_outlined,
                    color: textStyle.color,
                    semanticLabel: 'Calefacción',
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Metros:            ", style: textStyle),
                  Text("130", style: textStyle),
                  Icon(
                    Icons.aspect_ratio_outlined,
                    color: textStyle.color,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
