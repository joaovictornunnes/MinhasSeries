import 'package:flutter/material.dart';
import 'package:segunda_prova_app/ui/telaDetalhe.dart';
import 'cadastroPage.dart';
import 'listPage.dart';
import 'telaAltera.dart';
import 'telaSobre.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final idController = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Minhas Séries"),
      ),
      body: HomeBody(context),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
//questão 4; criar o floatingactionbutton
  // ignore: non_constant_identifier_names
  Widget HomeBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            //FloatingActionButton
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CadastroPage(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Digite o ID da série',
                  ),
                  keyboardType: TextInputType.number,
                  controller: idController,
                ),
                TextButton(
                  // ignore: unnecessary_null_comparison
                  onPressed: idController != null
                      ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TelaAltera(
                                id: int.parse(idController.text),
                              ),
                            ),
                          )
                      : null,
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                      minimumSize: const Size(150, 50)),
                  child: const Text("Alterar dados da Série"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListPage(),
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                minimumSize: const Size(150, 50)),
              child: const Text("Catálogo das Séries")
            ),
          ),
          AppBar(
            title: const Text('Sobre'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaSobre()),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
