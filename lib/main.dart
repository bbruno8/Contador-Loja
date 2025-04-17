import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  // Função decrement para o botão saiu
  void decrement() {
    //usamos setState para redesenhar a tela toda vez que usar a função
    setState(() {
      count--;
    });
    print(count);
  }

  //Confere se está vazio ou se está cheio
  bool get isEmpty => count == 0;

  bool get isFull => count == 20;

  // Função increment para o botão entrou
  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/imagem_fundo.jpg'),
              //Deixa a imagem do tamanho da tela
              fit: BoxFit.cover),
        ),
        child: Column(
          //Alinha os itens da coluna no centro da tela
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? "Lotado" : "Pode entrar!",
              // Estilizando o texto
              style: TextStyle(
                  // Aumentando o tamanho da letra
                  fontSize: 30,
                  color: isFull ? Colors.red : Colors.black),
            ),
            const SizedBox(height: 15),
            Text(
              "$count",
              style: TextStyle(
                  fontSize: 50, color: isFull ? Colors.red : Colors.black),
            ),
            const SizedBox(height: 25),
            Row(
              //Alinha os itens da coluna no centro da coluna
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  // Ao ser pressionado o botão vai retornar a função definida, caso isEmpty for verdadeiro vai desabilitar o botão.
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    //Ao precissionar o botão da um leve efeito de toque da cor preta.
                    foregroundColor: Colors.black,
                    //Cor de fundo do botão definida como branca.
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    //Tamanho do botão de forma fixa, aumentado de todos os lados.
                    fixedSize: const Size(100, 100),
                    //Definindo formatos para o botão.
                    shape: RoundedRectangleBorder(
                      //Adicionando uma pequena linha em volta do botão da cor preta com tamanho 2.
                      side: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      //Arredonda o botão.
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Saiu",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                //Usamos esse comando [const SizedBox(width: 20),]para dar um espaço entre os widgets.
                // Ex: Abaixo temos um botão e acima temos outro, usamos o Sizebox para dar espaço entre eles.
                const SizedBox(width: 20),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Entrou",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
