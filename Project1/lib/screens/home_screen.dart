import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../widgets/search_bar.dart';
import '../widgets/header.dart';
import '../widgets/info_carrousel.dart';
import '../widgets/video.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomHeader(
        isFavorite: isFavorite,
        onFavoriteToggle: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
      endDrawer: const AppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _SearchBarHeaderDelegate(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InfoCarousel(
                items: [
                  InfoItem(
                    icon: Icons.local_shipping,
                    text: 'Frete grátis para todo o Brasil',
                  ),
                  InfoItem(icon: Icons.star, text: 'Produtos exclusivos'),
                  InfoItem(icon: Icons.lock, text: 'Compra segura'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: VideoWidget(url: 'assets/videos/nike.mp4'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250, // ajuste o valor conforme desejar
                    child: const Text(
                      'DAS PISTAS PARA AS RUAS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: 250,
                    child: Text(
                      'Feito para líderes de grupo que permanecem incomparáveis e deixam seu estilo falar por si, o Nike Air Superfly é um modelo minimalista, porém, nada modesto.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    width: 180,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Comprar',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 400,
                child: Image.asset('assets/nikeImage.jpg', fit: BoxFit.cover),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: SizedBox(
                height: 400,
                child: Image.asset('assets/nikeImage2.jpg', fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Crie o delegate para a barra de pesquisa fixa
class _SearchBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: const SearchBarApp(),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
