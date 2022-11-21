import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/controllers.dart';
import '../../models/models.dart';

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
      width: MediaQuery.of(context).size.width - 30,
      child: Card(
        shadowColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 10.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GoogleMap(
            zoomControlsEnabled: true,
            markers: <Marker>{
              Marker(
                draggable: true,
                markerId: const MarkerId("1"),
                position: LatLng(
                  double.parse(aviso.inmueble!.latitud.toString()),
                  double.parse(aviso.inmueble!.longitud.toString()),
                ),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: aviso.inmueble!.descripcion,
                ),
              )
            },
            mapType: MapType.satellite,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                double.parse(aviso.inmueble!.latitud.toString()),
                double.parse(aviso.inmueble!.longitud.toString()),
              ),
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              MapController().mapController.complete(controller);
            },
          ),
        ),
      ),
    );
  }
}
