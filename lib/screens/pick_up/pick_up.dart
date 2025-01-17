import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:taxi_arf/config/pallete.dart';
import 'package:taxi_arf/utils/currency.dart';
import '../../widget/widget.dart';
import 'components/map_component.dart';
import 'components/rider_info_component.dart';
import 'components/select_car_component.dart';

class PickUpPage extends StatefulWidget {
  const PickUpPage({super.key});

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> {
  var mapController = MapComponent.mapComponentKey;

  String myAddress = '';
  String destinateAddress = '';
  double priceSelected = 0;

  bool confirmPickup = false;
  bool confirmDropOff = false;
  bool submitRequest = false;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bookmarkLocation = [
      {
        'id': 1,
        'name': 'Home',
        'address': 'Akbar Abad',
        'icon': 'home',
        'position': {'lat': -3.015727, 'lng': 114.394987}
      },
      {
        'id': 2,
        'name': 'Work',
        'address': 'bandar kh2',
        'icon': 'work',
        'position': {'lat': -3.009352, 'lng': 114.389101}
      },
      {
        'id': 3,
        'name': 'Fav 1',
        'address': 'KP3',
        'icon': 'kid_star',
        'position': {'lat': -3.024200, 'lng': 114.390096}
      },
      {
        'id': 4,
        'name': 'Fav 2',
        'address': 'cinema',
        'icon': 'kid_star',
        'position': {'lat': -3.013431, 'lng': 114.378510}
      },
      {
        'id': 5,
        'name': 'Fav 3',
        'address': 'stadium',
        'icon': 'kid_star',
        'position': {'lat': -3.0081135, 'lng': 114.3880165}
      },
    ];

    final List<Map<String, dynamic>> carList = [
      {
        'id': 1,
        'image': 'assets/car-white.png',
        'classes': 'Economy',
        'description': 'Fast',
        'price': 85000.0,
        'discount': 11.765
      },
      {
        'id': 2,
        'image': 'assets/car-black.png',
        'classes': 'Bussiness',
        'description': 'Higher class higher rate!',
        'price': 150000.0,
        'discount': 0.0
      },
      {
        'id': 3,
        'image': 'assets/car-white.png',
        'classes': 'Economy',
        'description': 'Fast!',
        'price': 85000.0,
        'discount': 11.765
      },
      {
        'id': 4,
        'image': 'assets/car-black.png',
        'classes': 'Bussiness',
        'description': 'fast!',
        'price': 150000.0,
        'discount': 0.0
      },
    ];

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            // MAPS
            MapComponent(
              key: mapController,
              onDragMyPosition: (location, street) {
                setState(() {
                  myAddress = street;
                });
              },
              onDragDestinatePosition: (location, street) {
                setState(() {
                  destinateAddress = street;
                });
              },
            ),

            // Header
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 102,
                    child: Row(
                      children: [
                        AppButtonIcon(
                          onTap: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Pallete.black1,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.keyboard_arrow_down_rounded),
                        SizedBox(width: 20),
                        Text('For Me')
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 102,
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        AppButtonIcon(
                          icon: AppSvgIcon('notifications'),
                          isNotify: true,
                        ),
                        SizedBox(width: 14),
                        AppButtonIcon(
                          icon: AppSvgIcon('person'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom sheet
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                clipBehavior: Clip.none, // agar bisa menumpuk
                children: [
                  // Header for rider info
                  Visibility(
                    visible: submitRequest,
                    child: Positioned(
                      top: -92,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        child: SizedBox(
                          height: 120,
                          width: double.infinity,
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFF21242A).withOpacity(0.6),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                border: Border.all(color: Pallete.s),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/marker/marker-white.png',
                                            height: 20,
                                          ),
                                          const SizedBox(width: 17),
                                          Text(myAddress),
                                        ],
                                      ),
                                      const Text(
                                        'Trip options',
                                        style: TextStyle(color: Pallete.color5),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/marker/marker-orange.png',
                                            height: 24,
                                          ),
                                          const SizedBox(width: 17),
                                          Text(destinateAddress),
                                        ],
                                      ),
                                      Text(formatToIRR(priceSelected)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                      child: SizedBox(
                        height: 330,
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF21242A).withOpacity(0.6),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            border: Border.all(color: Pallete.s),
                          ),
                          child: !confirmDropOff
                              ? selectDestination(bookmarkLocation)
                              : !submitRequest
                                  ? SelectCarComponent(
                                      carList: carList,
                                      onSubmit: (price) {
                                        setState(() {
                                          submitRequest = true;
                                          priceSelected = price;
                                          mapController.currentState
                                              ?.addRiderMarker();
                                        });
                                      },
                                    )
                                  : const RiderInfoComponent(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column selectDestination(List<Map<String, dynamic>> bookmarkLocation) {
    return Column(
      children: [
        const SizedBox(height: 16),

        // Selected Items
        AbsorbPointer(
          absorbing: confirmPickup,
          child: Row(
            children: [
              Expanded(
                child: AppSelectItemSmall(
                  item: bookmarkLocation,
                  onTap: (newPosition, address) {
                    mapController.currentState
                        ?.changeMarkerPosition(newPosition);
                    setState(() {
                      myAddress = address;
                    });
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  mapController.currentState?.addMarker();
                },
                child: Container(
                  height: 38,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Pallete.s),
                      gradient: LinearGradient(
                        colors: [
                          Pallete.s.withOpacity(0.6),
                          Pallete.s.withOpacity(0.6)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const AppSvgIcon(
                      'add_location_alt',
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Location input
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Column(
            children: [
              AppInputLocation(
                icon: Image.asset(
                  'assets/marker/marker-white.png',
                  height: 35,
                ),
                location: myAddress,
              ),
              AppInputLocation(
                  onTap: () {
                    mapController.currentState!.addDraggableMarker();
                  },
                  icon: Image.asset(
                    'assets/marker/marker-orange.png',
                    height: 35,
                  ),
                  location: destinateAddress),

              // Button
              AppButton(
                text: !confirmPickup ? 'CONFIRM PICKUP' : 'CONFIRM DROPOFF',
                onTap: () {
                  setState(() {
                    if (!confirmPickup) {
                      confirmPickup = true;
                      mapController.currentState!.pinMarker('myLocationMarker');
                    } else if (!confirmDropOff) {
                      confirmDropOff = true;
                      mapController.currentState!
                          .pinMarker('destinationMarker');
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
