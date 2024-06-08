import 'package:flutter/material.dart';
import 'package:astolphus/add_pet/add_pet.dart';
import 'package:astolphus/config/config.dart';
import 'package:astolphus/notifications/notifications.dart';
import 'package:astolphus/profile/profile.dart';
import 'package:astolphus/utils/google_maps.dart';
import 'package:astolphus/historico/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:
          2, // TABS DINAMICAS DE ACORDO COM O NÚMERO DE PET, SE N QUISEREM UTILIZAR USEM APENAS 'RETURN SCAFFOLD'
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Astolphus',
            style: TextStyle(
                color: Color.fromRGBO(105, 37, 190, 1),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          )),
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu,
                  color: Color.fromRGBO(105, 37, 190, 1)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person,
                  color: Color.fromRGBO(105, 37, 190, 1)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserProfile()));
              },
            ),
          ],
          bottom: const TabBar(
            labelColor: Color.fromRGBO(105, 37, 190, 1),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color.fromRGBO(105, 37, 190, 1),
            tabs: [
              Tab(
                  icon: Icon(Icons.pets),
                  text:
                      "Pet1"), // alterar valores dinamicamente, pet1/pet2 ou nome dos mesmos
              Tab(icon: Icon(Icons.pets), text: "Pet2"),
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(105, 37, 190, 1),
                  ),
                  child: Text(
                    'Navegação',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home,
                      color: Color.fromRGBO(105, 37, 190, 1)),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.pets,
                      color: Color.fromRGBO(105, 37, 190, 1)),
                  title: const Text('Adicionar PET'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddPet()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications,
                      color: Color.fromRGBO(105, 37, 190, 1)),
                  title: const Text('Notificações'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Notifications()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings,
                      color: Color.fromRGBO(105, 37, 190, 1)),
                  title: const Text('Configurações'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Configuration()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.history,
                      color: Color.fromRGBO(105, 37, 190, 1)),
                  title: const Text('Histórico'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => MapScreen(idPet: '1', data: '07-06-2024')
                        )
                    );
                  }
                )
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: GoogleMaps()),
            Center(child: GoogleMaps()),
          ],
        ),
      ),
    );
  }
}
