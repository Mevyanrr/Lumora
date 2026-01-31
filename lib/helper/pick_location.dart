import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lumora/helper/map_services.dart';

class PickLocationPage extends StatefulWidget{
  const PickLocationPage({super.key});

  @override
  State<PickLocationPage> createState() => PickLocationState();
}

  class PickLocationState extends State<PickLocationPage> {
    LatLng? selectedLatLng;
    String address = "pilih lokasi";

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: const Text("Pilih Lokasi")),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(-7.9666, 112.6326),
                zoom: 14),
                onTap: (LatLng) async {
                  setState(() {
                    selectedLatLng = LatLng;
                  });

                  final addr = await MapServices.instance.getAddressFromLatLng(LatLng.latitude, LatLng.longitude);

                  setState(() {
                    address = addr;
                  });
                },
                markers: selectedLatLng == null ? {} : {
                  Marker(
                    markerId: const MarkerId("selected"),
                    position: selectedLatLng!
                  )
                }
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(address),
                        SizedBox(height: 8,),
                        ElevatedButton(
                          onPressed: selectedLatLng == null ? null : () {
                            Navigator.pop(context, {
                              "lat": selectedLatLng!.latitude,
                              "lng": selectedLatLng!.longitude,
                              "address": address
                            });
                          }, child: Text("Pilih Alamat"),
                          )
                      ],
                    ),
                  ))
              ],
        ),
      );
    }
  }

