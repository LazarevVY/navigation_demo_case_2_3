import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationDemoScreen());
}

class NavigationDemoScreen extends StatefulWidget {
  const NavigationDemoScreen({Key? key}) : super(key: key);

  @override
  _NavigationDemoScreenState createState() => _NavigationDemoScreenState();
}


class _NavigationDemoScreenState extends State<NavigationDemoScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int val) {
            _messengerKey.currentState!.showSnackBar(
                SnackBar(content: Text("bottom navbar tapped ${val.toString()}")));
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm),
              label: "Item 0",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined),
              label: "Item 1",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism),
              label: "Item 2",
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text("Case 2.3. solution"),
          actions: [
            IconButton(
              onPressed: (){
                _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text("Icons.account_circle")));
              },
              icon: Icon(Icons.account_circle),
              tooltip: 'Show Snackbar',
            ),
            IconButton(
              onPressed: () {
                _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text("Icons.add_box")));
              },
              icon: Icon(Icons.add_box),
              tooltip: 'Show Snackbar',
            ),
            TextButton(
                onPressed: (){
                  _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text("Logout")));
                },
                child: Text("Logout",
                style: TextStyle(
                  color: Colors.white,
                ),),),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: const Image(image: AssetImage("assets/Google-flutter-logo.svg.png")), //Image.network("url"),
                        ),
                        const Text("Навигация по Flutter"),
                      ],
                    ),
                  )
              ),
              ListTile(
                  leading: const Icon(Icons.one_k),
                  title: const Text ("Каталог"),
                  onTap: (){
                    _messengerKey.currentState!.showSnackBar(
                        const SnackBar(content: Text("Переход в каталог")));
                  }
              ),
              ListTile(
                  leading: const Icon(Icons.two_k),
                  title: const Text ("Корзина"),
                  onTap: (){
                    _messengerKey.currentState!.showSnackBar(
                        const SnackBar(content: Text("Переход в корзину")));
                  }
              ),
              const Divider(  ),
              const Padding(padding: EdgeInsets.only(left: 10),
                child: Text("Профиль"),
              ),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text ("Настройки"),
                  onTap: (){
                    _messengerKey.currentState!.showSnackBar(
                        const SnackBar(content: Text("Переход в настройки")));
                  }
              ),
              const Divider(  ),
              Text ("Инструкция\n ..."),

            ],
          ),
        ),
      ),
    );
  }
}
