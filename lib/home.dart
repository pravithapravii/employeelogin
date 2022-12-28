import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loginpage/employees/emp.dart';
// import 'package:sample5/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
//create a dummy list of movies
//used imdb data

  static List<employee> main_movies_list = [
    employee(1, "Richard", "Associate software engineer"),
    employee(2, "Aparna", "Associate software engineer"),
    employee(3, "Pravitha", "Associate software engineer"),
    employee(4, "Riswana", "Associate software engineer"),
    employee(5, "Hridhya", "Associate software engineer"),
    employee(6, "Prathap", "Associate software engineer"),
    employee(7, "Ajmal", "Associate software engineer"),
    employee(8, "Shameel", "Team Leader"),
    employee(9, "Gejo", "Associate software engineer"),
    employee(10, "Anu basheer", "Project manager"),
    employee(11, "Christeena", "HR")
  ];
  //Creating the lsit that we're going to dosplay and filter
  List<employee> display_list = List.from(main_movies_list);
  void updateList(String value) {
    //this is the function that will filter out list
    // we will be back to thid list after a while
    //now lets write our search fumction

    setState(() {
      display_list = main_movies_list
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 36, 65),
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        elevation: 0.0,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         signout(context);
        //       },
        //       icon: Icon(Icons.exit_to_app)),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search for employees",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: name of the employee",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: display_list.length,
                itemBuilder: ((context, index) => ListTile(
                      contentPadding: EdgeInsets.all(8.0),
                      leading: Text(
                        '${display_list[index].number!}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        display_list[index].name!,
                        style: const TextStyle(
                          color: Colors.white60,
                        ),
                      ),
                      subtitle: Text(
                        display_list[index].designation!,
                        style: TextStyle(color: Colors.amber),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  // signout(BuildContext ctx) async {
  //   final _sharedprefs = await SharedPreference.getInstance();
  //   await _sharedprefs.clear();
  //   // await _sharedprefs.setBool(SAVE_KEY_NAME, true);
  //   Navigator.of(ctx).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (ctx) => ScreenLogin()), (route) => false);
  // }
}


// class CustomSearch extends SearchDelegate {
//   List<String> allData = [
//     'aparna',
//     'richard',
//     'pravitha',
//     'ajmal',
//     'prathap',
//     'riswana',
//     'hridhya',
//     'gijo',
//     'shameel'
//   ];
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: const Icon(Icons.clear),
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var item in allData) {
//       if (item.toLowerCase().contains(query.toUpperCase())) {
//         matchQuery.add(item);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: (context, index) {
//           var result = matchQuery[index];
//           return ListTile(
//             title: Text(result),
//           );
//         });
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var item in allData) {
//       if (item.toLowerCase().contains(query.toUpperCase())) {
//         matchQuery.add(item);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: (context, index) {
//           var result = matchQuery[index];
//           return ListTile(
//             title: Text(result),
//           );
//         });
//   }
// }
