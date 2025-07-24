import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devery Travel App',
      theme: ThemeData(
        // Você pode manter sua primarySwatch se tiver outras telas
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false, // Remove o banner de debug
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Imagem de Fundo (contém todas as ilustrações e o gradiente)
          Positioned.fill(
            child: Image.asset(
              'assets/images/image_background.png',
              fit: BoxFit.cover, // Cobrirá toda a área disponível
            ),
          ),

          // 2. Conteúdo da Tela (Logo, Texto, Botões)
          // Utilizamos Padding para dar um respiro nas laterais e um Column para organizar verticalmente
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Centraliza os elementos na coluna
              children: [
                SizedBox(
                  height: screenSize.height * 0.08,
                ), // Espaço para o topo
                // Logo "Devery" e ícone de coração (Alinhado à direita na imagem)
                // Utilizamos um Row alinhado à MainAxisAlignment.end
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Devery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Ícone de coração (ou um asset de imagem pequeno se for parte do logo)
                    const Icon(
                      Icons.favorite, // Utilizando o ícone padrão do Flutter
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),

                // Spacer para empurrar o conteúdo abaixo para a parte inferior da tela
                const Spacer(),

                // Texto "Vamos embarcar nessa jornada Juntos!"
                // Alinhado à esquerda no design
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Vamos embarcar nessa aventura',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Text(
                        'Juntos!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40), // Espaço entre o texto e o botão
                // Botão "Cadastrar",
                SizedBox(
                  width: double.infinity, // Ocupa toda a largura disponível
                  height: 60, // Altura do botão
                  child: ElevatedButton(
                    onPressed: () {
                      // Ação ao clicar no botão Cadastrar
                      print('Botão Cadastrar clicado!');
                      // Exemplo de navegação para uma tela de cadastro
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white, // Cor de fundo do botão (branco)
                      foregroundColor: const Color(
                        0xFF337733,
                      ), // Cor do texto  do botão (verde escuro)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ), // Borda arredondada
                      ),
                      elevation: 5, // Pequena sombra para dar profundidade
                    ),
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Espaço entre o botão e o link
                // Link "Já tem uma conta? Faça Login"
                GestureDetector(
                  onTap: () {
                    // Ação ao clicar no link Login
                    print('Link Login clicado!');
                    // Exemplo de navegação para uma tela de login
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Já tem uma conta? ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Faça Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline, // Sublinhado
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 40,
                ), // Espaço para a parte inferior da tela
              ],
            ),
          ),
        ],
      ),
    );
  }
}
