import 'package:alpha/services/routes.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CategoriesScreenState();
  }
}

class CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          elevation: 1,
        ),
        body: ListView(
            padding: EdgeInsets.all(8),
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          CategoriesShowRoute,
                          arguments: {'category': 'Houses'}),
                      child: Text("Houses",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade700),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          CategoriesShowRoute,
                          arguments: {'category': 'Clothes'}),
                      child: Text("Clothes",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade700),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          CategoriesShowRoute,
                          arguments: {'category': 'Gadgets'}),
                      child: Text("Gadgets",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade700),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          CategoriesShowRoute,
                          arguments: {'category': 'Jobs'}),
                      child: Text("Jobs",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade700),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          CategoriesShowRoute,
                          arguments: {'category': 'Properties'}),
                      child: Text("Properties",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade700),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          CategoriesShowRoute,
                          arguments: {'category': 'Cars'}),
                      child: Text("Cars",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade700),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          CategoriesShowRoute,
                          arguments: {'category': 'Implements'}),
                      child: Text("Implements",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade700),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          CategoriesShowRoute,
                          arguments: {'category': 'Services'}),
                      child: Text("Services",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade700),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          CategoriesShowRoute,
                          arguments: {'category': 'Arts'}),
                      child: Text("Arts",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade700),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          CategoriesShowRoute,
                          arguments: {'category': 'Wanted List'}),
                      child: Text("Wanted List",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade700),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                          CategoriesShowRoute,
                          arguments: {'category': 'Other'}),
                      child: Text("Other",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade700),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
