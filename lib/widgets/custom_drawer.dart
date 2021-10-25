import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          AppBar(
              backgroundColor: Colors.white,
              leading: BackButton(
                color: Colors.teal,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Menu',
                style: TextStyle(fontSize: 20, color: Colors.teal),
              )),
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: _size.height / 20, horizontal: _size.width / 10),
              child: ListView(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, color: Colors.teal),
                        const Text(
                          '  First Page',
                          style: TextStyle(color: Colors.teal, fontSize: 22),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, color: Colors.teal),
                        const Text(
                          '  Second Page',
                          style: TextStyle(color: Colors.teal, fontSize: 22),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, color: Colors.teal),
                        const Text(
                          '  Third Page',
                          style: TextStyle(color: Colors.teal, fontSize: 22),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
