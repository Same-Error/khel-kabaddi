import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../View/videos_view.dart';
import '../Controller/seasons_api_controller.dart';

class VideoSeasonsView extends StatefulWidget {
  const VideoSeasonsView({super.key});

  @override
  State<VideoSeasonsView> createState() => _VideoSeasonsViewState();
}

class _VideoSeasonsViewState extends State<VideoSeasonsView> {
  SeasonsController controller = Get.put(SeasonsController());

  @override
  void initState() {
    super.initState();
    controller.getSeasons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "VIDEOS",
            style: GoogleFonts.exo(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF1976D2),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF1976D2),
                const Color(0xFF448AFF),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: GetBuilder<SeasonsController>(builder: (controller) {
            return controller.getseasons == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2,
                      ),
                      itemCount: controller.getseasons!.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => VideosView(),
                              arguments: {
                                'id': controller.getseasons![i].id ?? '',
                                'catName':
                                    controller.getseasons![i].catName ?? '',
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                controller.getseasons![i].catName ?? '',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bungeeSpice(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
          }),
        ));
  }
}
