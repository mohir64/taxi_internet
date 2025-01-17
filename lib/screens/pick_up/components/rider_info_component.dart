import 'package:flutter/material.dart';
import 'package:taxi_arf/widget/app_button_icon.dart';
import 'package:taxi_arf/widget/app_svg_icon.dart';
import 'package:taxi_arf/widget/widget.dart';

import '../../../config/pallete.dart';

class RiderInfoComponent extends StatelessWidget {
  const RiderInfoComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('عجله کن'),

          const SizedBox(height: 8),

          // Driver info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(48),
                    child: Image.asset(
                      'assets/person.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('نام کاربر'),
                      Row(
                        children: [
                          Text(
                            'Hyundai Kona SUV',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            ' ',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  AppButtonIcon(
                    icon: const AppSvgIcon('phone'),
                    borderRadius: 10,
                    border: Border.all(color: Pallete.s),
                  ),
                  const SizedBox(width: 16),
                  AppButtonIcon(
                    icon: const AppSvgIcon('message', height: 18),
                    borderRadius: 10,
                    border: Border.all(color: Pallete.s),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('تا چند دقیقه دیگه اونجا هستم'),
          const SizedBox(height: 15),

          SizedBox(
            height: 30,
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Pallete.s,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 3,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Pallete.color5,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  child: Image.asset(
                    'assets/car-icon.png',
                    height: 20,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          const AppButton(
            text: 'CANCEL RIDE',
            color: Pallete.color5,
          ),
        ],
      ),
    );
  }
}
