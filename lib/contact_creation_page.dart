// import 'package:flutter/material.dart';

// class HallOfFame extends StatelessWidget {
//   final List<GameResult> resultList;
//   const HallOfFame({required this.resultList, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Scores")),
//       body: SafeArea(
//         child: ListView.builder(
//           itemCount: resultList.length,
//           itemBuilder: (context, index) {
//             final GameResult result = resultList[index];
//             return ListTile(
//               title: Text(result.username),
//               subtitle: Text("${result.score} points"),
//               leading: const Icon(Icons.person),
//               trailing: const Icon(Icons.score));
//           },
//         ),
//       ),
//     );
//   }
// }