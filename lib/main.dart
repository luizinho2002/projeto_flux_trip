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
        // Você pode manter seu primarySwatch se tiver outras telas, mas o gradiente sobrepõe o fundo do Scaffold
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false, // Remove o banner debug
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        // 1. Fundo com Gradiente Verde
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5CB85C), // Um verde um pouco mais claro para o topo
              Color(0xFF337733), // Um verde um pouco mais escuro para a base
            ],
            stops: [0.0, 1.0], // Começa no topo e vai até a base
          ),
        ),
        child: Stack(
          children: [
            // 2. Sua Imagem AGRUPADO das Ilustrações (sem o fundo verde, com transparência)
            // Esta imagem será posicionado SOBRE o gradiente verde
            Positioned(
              // Ajuste esse valores 'top', 'bottom', 'left', 'right' para posicionar a sua imagem das ilustrações agrupadas da melhor forma
              // Comece com 0 para ver onde ela fica e ajuste a partir
              top: 0, // Pode precisar de um valor negativo para subir
              bottom: 0, // Pode precisar de um valor negativo para descer
              left:
                  0, // Pode precisar de um valor negativo para empurrar para a esquerda
              right:
                  0, // Pode precisar de um valor negativo para empurrar para a direita
              child: Image.asset(
                'assets/images/travel_illustrations.png',
                fit: BoxFit
                    .cover, // Cobrirá a área definida e manterá a proporção
                // Experimente BoxFit.contain se 'cover' cortar demais e você quiser que tudo apareça
                // Isso pode deixar espaços vazios, que você compensaria ajustando os 'Positioned'
              ),
            ),

            // 3. Conteúdo da Tela (Logo, Texto "Vamos embarcar....", Botões)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ), // Padding lateral para todo o conteúdo
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Centraliza a coluna horizontalmente
                children: [
                  SizedBox(
                    height: screenSize.height * 0.08,
                  ), // Espaço do topo para a logo
                  // Logo "Devery" e ícone de coração
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
                      Image.asset(
                        'assets/images/icon_heart.png',
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),

                  SizedBox(height: screenSize.height * 0.25),

                  const Spacer(),

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
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Botão Cadastrar clicado!');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF337733),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
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

                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () {
                      print('Link Login clicado!');
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Já tem uma conta? ',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Faça Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
