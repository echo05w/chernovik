import 'package:final_app/data/geo_service.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../../services/pixabay_service.dart';
import '../../services/geo_service.dart';
import 'map_page.dart';
import 'package:final_app/data/constants.dart';
import 'package:final_app/views/pages/course_page.dart';
import 'package:final_app/views/widgets/container_widget.dart';
import 'package:final_app/views/widgets/hero_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController imageController = TextEditingController();
  List<String> images = [];
  bool loading = false;

  // --- IMAGE SEARCH FUNCTION ---
  Future<void> searchImages() async {
    final query = imageController.text.trim();
    if (query.isEmpty) return;

    setState(() => loading = true);

    try {
      images = await PixabayService.searchImages(query, count: 6);
    } catch (e) {
      images = [];
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load images 💔')),
      );
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KValue.basicLayout,
      KValue.advancedLayout,
      KValue.settings,
      KValue.home,
      KValue.profile,
      KValue.about,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              HeroWidget(title: 'Tour App', nextPage: CoursePage()),
              const SizedBox(height: 10.0),

              // --- SEARCH BAR ---
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: imageController,
                  onSubmitted: (_) => searchImages(),
                  decoration: InputDecoration(
                    hintText: "Search images… (e.g. Tashkent museum)",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: searchImages,
                child: const Text("Search"),
              ),

              // --- IMAGES GRID ---
              if (loading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CircularProgressIndicator(),
                )
              else if (images.isNotEmpty)
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: images.length,
                  itemBuilder: (_, i) => GestureDetector(
                    onTap: () async {
                      // Get coordinates of the search query
                      final coords = await GeoService.getCoordinates(
                          imageController.text.trim());
                      if (coords != null) {
                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (_) => MapPage(
                              location: coords,
                              title: imageController.text.trim(),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Location not found 💔")),
                        );
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        images[i],
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return Container(
                            color: Colors.grey[300],
                            child: Center(
                              child: CircularProgressIndicator(
                                value: progress.expectedTotalBytes != null
                                    ? progress.cumulativeBytesLoaded /
                                        progress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.broken_image,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 10.0),

              // --- EXISTING CONTAINER WIDGETS ---
              ...List.generate(list.length, (index) {
                return ContainerWidget(
                  title: list.elementAt(index),
                  description:
                      'This is the description for item ${index + 1}.',
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
