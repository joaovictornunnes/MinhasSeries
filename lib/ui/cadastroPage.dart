import 'package:flutter/material.dart';

import '../domain/serie.dart';
import '../helpers/serie_helper.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_rating_bar.dart';
import 'telaSobre.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Minhas Séries"),
      ),
      body: FormSerieBody(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

class FormSerieBody extends StatefulWidget {
  const FormSerieBody({
    super.key,
  });

  @override
  State<FormSerieBody> createState() => _FormLivroBodyState();
}

class _FormLivroBodyState extends State<FormSerieBody> {
  final _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final autorController = TextEditingController();
  final qntTemporadasController = TextEditingController();
  final avaliacaoController = TextEditingController();
  double rating = 0.0;
  final generoController = TextEditingController();
  final sinopseController = TextEditingController();

  final seridHelper = SerieHelper();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Cadastro de Séries",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            CustomFormField(
              controller: nomeController,
              labelText: "Nome",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione um Nome';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: autorController,
              labelText: "Autor",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione um autor';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: qntTemporadasController,
              labelText: "Quantidade De Temporadas",
              keyboard_type: TextInputType.number,
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione quantas temporada a série tem';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: generoController,
              labelText: "Gênero",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione um gênero';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: sinopseController,
              labelText: "Sinopse",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione uma sinopse';
                }
                return null;
              },
            ),
            CustomRatingBar(
              ratingFunction: (value) {
                rating = value;
              },
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Serie s = Serie(
                    nomeController.text,
                    autorController.text,
                    int.parse(qntTemporadasController.text),
                    rating,
                    generoController.text,
                    sinopseController.text,
                  );
                  SerieHelper serieHelper = SerieHelper();
                  serieHelper.saveSerie(s);
                  Navigator.pop(context);
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                "Cadastrar",
                style: Theme.of(context).textTheme.labelLarge,
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
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget HomeBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
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
