// import 'package:flutter/material.dart';
//
// import 'Nikki_text_app.dart';
//
// // ignore: must_be_immutable
// class HomeView extends StatelessWidget {
//   List<String> nikkiText = [];
//
//   HomeView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('体調管理アプリ'),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () async {
//               final newListText = await Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) {
//                   return TextAddPage();
//                 }),
//               );
//             },
//             icon: const Icon(Icons.plus_one),
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: nikkiText.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(nikkiText[index]),
//           );
//         },
//       ),
//     );
//   }
// }