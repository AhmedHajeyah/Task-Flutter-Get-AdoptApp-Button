import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/services/pets_services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PetsProvider extends ChangeNotifier {
  List<Pet> pets = [
    Pet(
        name: "Lucifurr",
        image: "https://i.ibb.co/P6VJ4pZ/smile-cat-1.png",
        age: 2,
        gender: "male")
  ];

  Future<void> getPetsFromService() async {
    pets = await PetServices().getPets();
    notifyListeners();
  }

  Future<void> getPetsFromServiceFirst() async {
    pets = await PetServices().getPets();
  }

  // void addPetsToService() async {
  //   pets = PetServices()
  //       .addPet(Pet(name: name, image: image, age: age, gender: gender));
  // }
}
