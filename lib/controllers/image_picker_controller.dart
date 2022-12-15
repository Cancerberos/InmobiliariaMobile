import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/models.dart';
import '../services/avisos_service.dart';

class ImagePickerController extends GetxController {
  final AvisosServices _avisosServices = Get.put(AvisosServices());

  final _imagen = AgregarImagen(
    descripcion: (ImagenValue(value: "")),
    url: (ImagenValue(value: "")),
  ).obs;

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;

      // Crop
      // final cropImageFile = await ImageCropper().cropImage(
      //     sourcePath: selectedImagePath.value,
      //     maxWidth: 512,
      //     maxHeight: 512,
      //     compressFormat: ImageCompressFormat.jpg);
      // cropImagePath.value = cropImageFile!.path;

      // Compress
      final dir = Directory.systemTemp;
      final targetPath = "${dir.absolute.path}/temp.jpg";
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
          selectedImagePath.value, targetPath,
          quality: 90);
      compressImagePath.value = compressedFile!.path;

      Uint8List imgbytes = await compressedFile.readAsBytes();

      String imagenString = base64.encode(imgbytes);

      var imagenDetalle = ImagenDetalle(
        bytes: imagenString,
        mimeType: "image/jpeg",
        name: "",
      );

      var agregarImagenUrl = imagenDetalleToJson(imagenDetalle);

      _imagen.value.url?.value = agregarImagenUrl;
      _imagen.value.descripcion?.value = "Imagen en terreno.";
    } else {
      Get.snackbar("Error", "No ha seleccionado una imagen.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void agregarImagen() async {
    try {
      await _avisosServices.agregarImagen(_imagen.value);
    } finally {
      selectedImagePath.value = '';
    }
  }

//   void uploadImage(File file) {
//     Get.dialog(
//       const Center(
//         child: CircularProgressIndicator(),
//       ),
//       barrierDismissible: false,
//     );
//      {
//       Get.back();
//       if (resp == "success") {
//         Get.snackbar('Success', 'File Uploaded',
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.green,
//             colorText: Colors.white);
//       } else if (resp == "fail") {
//         Get.snackbar('Error', 'File upload failed',
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.red,
//             colorText: Colors.white);
//       }
//     }, onError: (err) {
//       Get.back();
//       Get.snackbar('Error', 'File upload failed',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//     });
//   }

}
