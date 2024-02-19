import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class MyAdsPage extends StatelessWidget {
  const MyAdsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Annonces'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              leading: Image.network(
                'https://via.placeholder.com/150',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: const Text('NOM DE MA PLANTE'),
              subtitle: const Text('15/06/24 au 30/06/24'),
              trailing: ElevatedButton(
                onPressed: () {
                  context.go('/annonces/$index/details');
                },
                child: const Text('DETAILS'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=>
          context.go("/annoncesMenu/mesAnnonces/add"),
        icon: const Icon(Icons.add),
        label: const Text('Ajouter une Annonce'),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
