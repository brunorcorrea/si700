import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  Future<String?> futureResult;

  FeedbackScreen({required this.futureResult});

  Widget successMessage() {
    return Center(
        child: Column(
      children: [
        Icon(Icons.check_circle, color: Colors.green, size: 100),
        Text(
          "Dados submetidos com sucesso!",
          style: TextStyle(fontSize: 20),
        )
      ],
    ));
  }

  Widget errorMessage(AsyncSnapshot<String?> snapshot) {
    return Center(
      child: Column(
        children: [Icon(Icons.error), Text(snapshot.data!)],
      ),
    );
  }

  Widget unknownErrorMessage() {
    return const Center(
        child: Column(
      children: [Icon(Icons.error), Text("Ocorreu um erro desconhecido")],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: futureResult,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data == "success") {
              return successMessage();
            } else {
              return errorMessage(snapshot);
            }
          } else {
            return unknownErrorMessage();
          }
        });
  }
}
