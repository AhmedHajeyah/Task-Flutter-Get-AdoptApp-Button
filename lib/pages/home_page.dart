import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import 'package:adopt_app/widgets/pet_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

import '../services/pets_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Pet> pets = Provider.of<PetsProvider>(context, listen: true).pets;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Adopt"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   // child: ElevatedButton(
            //   //   onPressed: () {
            //   //     context.read<PetsProvider>().getPetsFromService();
            //   //   },
            //   //   child: const Padding(
            //   //     padding: EdgeInsets.all(12.0),
            //   //     child: Text("Get All pets"),
            //   //   ),
            //   // ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Add a new Pet"),
                ),
              ),
            ),
            FutureBuilder(
                future: context.read<PetsProvider>().getPetsFromServiceFirst(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.error != null) {
                    return const Center(child: Text("Error in Network"));
                  } else {
                    return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height),
                        ),
                        physics:
                            const NeverScrollableScrollPhysics(), // <- Here
                        itemCount: context.watch<PetsProvider>().pets.length,
                        itemBuilder: (context, index) => PetCard(
                            pet: context.watch<PetsProvider>().pets[index]));
                  }
                }))
          ],
        ),
      ),
    );
  }
}
