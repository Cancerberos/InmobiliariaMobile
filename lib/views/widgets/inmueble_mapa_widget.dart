import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/controllers.dart';
import '../../models/models.dart';

class InmuebleMapa extends StatelessWidget {
  final mapController = Get.put(
    MapController(),
  );

  InmuebleMapa({required this.inmueble, Key? key}) : super(key: key);

  final Inmueble inmueble;

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
            // ignore: prefer_collection_literals
            gestureRecognizers: Set()
              ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
              ..add(
                Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer()),
              )
              ..add(
                Factory<HorizontalDragGestureRecognizer>(
                    () => HorizontalDragGestureRecognizer()),
              )
              ..add(
                Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()),
              ),
            zoomControlsEnabled: true,
            markers: <Marker>{
              Marker(
                onDragEnd: (value) {
                  inmueble.latitud = value.latitude.toString();
                  inmueble.longitud = value.longitude.toString();
                },
                draggable: true,
                markerId: const MarkerId("1"),
                position: LatLng(
                  double.parse(inmueble.latitud.toString()),
                  double.parse(inmueble.longitud.toString()),
                ),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: inmueble.descripcion,
                ),
              )
            },
            mapType: MapType.satellite,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                double.parse(inmueble.latitud.toString()),
                double.parse(inmueble.longitud.toString()),
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
