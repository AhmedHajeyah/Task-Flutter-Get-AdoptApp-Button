import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/services/client.dart';
import 'package:dio/dio.dart';

class PetServices {
  final dioClient = Dio();

  Future<List<Pet>> getPets() async {
    List<Pet> pets = [];
    try {
      Response response = await Client.dio.get("/pets/");
      pets = (response.data as List).map((e) => Pet.fromJson2(e)).toList();
    } on DioError catch (e) {
      print(e);
    }
    return pets;
  }

  // void addPet(Pet pet) async {
  //   try {
  //     Response response = await dioClient.post(
  //         "https://coded-pets-api-crud.herokuapp.com/pets",
  //         data: pet.toJson());
  //   } on DioError catch (e) {
  //     print("error");
  //   }
  // }

// List<Pet> pets = [];
//   for (int i = 0; i < response.data.lenth; i++) {
//     Pet.fromJson2(response.data[i]);
//   }

}
