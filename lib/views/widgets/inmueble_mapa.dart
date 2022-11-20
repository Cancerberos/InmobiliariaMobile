import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:inmobiliaria/models/avisos_mock_model.dart';
import '../../controllers/controllers.dart';

class InmuebleMapa extends StatelessWidget {
  final mapController = Get.put(
    MapController(),
  );

  InmuebleMapa({required this.aviso, Key? key}) : super(key: key);

  final AvisoMock aviso;

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
      ),
    );
  }
}
