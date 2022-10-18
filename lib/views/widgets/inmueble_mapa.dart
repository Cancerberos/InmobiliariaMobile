import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:inmobiliaria/models/avisos_model.dart';
import '../../controllers/controllers.dart';

class InmuebleMapa extends StatelessWidget {
  final mapController = Get.put(
    MapController(),
  );

  InmuebleMapa({required this.aviso, Key? key}) : super(key: key);

  final Aviso aviso;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width - 15,
      child: Card(
        color: Colors.lightBlueAccent[600],
        shadowColor: Colors.blueAccent,
        clipBehavior: Clip.antiAlias,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: GoogleMap(
          zoomControlsEnabled: true,
          markers: <Marker>{
            Marker(
              draggable: true,
              markerId: const MarkerId("1"),
              position: LatLng(
                double.parse(aviso.inmueble.direccion.latitud),
                double.parse(
                  aviso.inmueble.direccion.longitud,
                ),
              ),
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: InfoWindow(
                title: aviso.inmueble.descripcion,
              ),
            )
          },
          mapType: MapType.satellite,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              double.parse(aviso.inmueble.direccion.latitud),
              double.parse(
                aviso.inmueble.direccion.longitud,
              ),
            ),
            zoom: 15,
          ),
          onMapCreated: (GoogleMapController controller) {
            MapController().mapController.complete(controller);
          },
        ),
      ),
    );
  }
}
