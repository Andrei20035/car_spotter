import 'dart:convert';

import 'package:car_spotter/models/car_brands.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarBrandsDropdown extends StatefulWidget {
  @override
  State<CarBrandsDropdown> createState() {
    return _CarBrandsDropdownState();
  }
}

class _CarBrandsDropdownState extends State<CarBrandsDropdown> {
  List<String> _carBrands = carBrands;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.07),
          child: Text(
            'Brand',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 13,
                  color: const Color(0xFFDFA3A3),
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 2,
          ),
          height: screenHeight * 0.06,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(300),
            ),
            color: Color(0xFFD9D9D9),
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
              child: DropdownButtonFormField(
                menuMaxHeight: 400,
                icon: const ImageIcon(
                  AssetImage("assets/images/icons/arrow-square-down.png"),
                  size: 30,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                value: carBrands.isNotEmpty ? carBrands[2] : null,
                onChanged: (newValue) {},
                items: _carBrands.map((make) {
                  return DropdownMenuItem(
                    value: make,
                    child: Text(make),
                  );
                }).toList(),
              )),
        ),
      ],
    );
  }
}
