import 'package:flutter/material.dart';

class DiseaseGuideScreen extends StatefulWidget {
  const DiseaseGuideScreen({super.key});

  @override
  State<DiseaseGuideScreen> createState() => _DiseaseGuideScreenState();
}

class _DiseaseGuideScreenState extends State<DiseaseGuideScreen> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleFont = size.width * 0.05;
    final textFont = size.width * 0.04;
    final searchFont = size.width * 0.04;
    final cardHeight = size.height * 0.12;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.eco_outlined,
                size: size.width * 0.08, color: const Color(0xFF284C29)),
            SizedBox(width: size.width * 0.02),
            Text("Disease Guide",
                style: TextStyle(
                    color: const Color(0xFF284C29), fontSize: titleFont)),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Column(
        children: [
          // 🔍 SEARCH BAR
          Padding(
            padding: EdgeInsets.all(size.width * 0.03),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: "Search diseases...",
                hintStyle: TextStyle(fontSize: searchFont),
                prefixIcon: Icon(Icons.search, color: const Color(0xFF284C29)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                  borderSide: const BorderSide(
                    color: Color(0xFF284C29),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                  borderSide: const BorderSide(
                    color: Color(0xFF284C29),
                    width: 2.5,
                  ),
                ),
              ),
              style: TextStyle(fontSize: searchFont),
            ),
          ),

          // LIST VIEW
          Expanded(
            child: ListView(
              children: diseaseCards
                  .where((item) =>
                      item["name"]!.toLowerCase().contains(searchQuery))
                  .map((item) => diseaseCard(item["name"]!, item["desc"]!,
                      item["img"]!, cardHeight, textFont))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ⭐ REUSABLE DISEASE CARD
  Widget diseaseCard(String name, String desc, String img, double cardHeight,
      double textFont) {
    return Padding(
      key: ValueKey(name),
      padding: EdgeInsets.symmetric(
          horizontal: cardHeight * 0.2, vertical: cardHeight * 0.1),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardHeight * 0.2)),
        elevation: 3,
        child: ListTile(
          contentPadding: EdgeInsets.all(cardHeight * 0.1),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(cardHeight * 0.15),
            child: Image.asset(img,
                height: cardHeight, width: cardHeight, fit: BoxFit.cover),
          ),
          title: Text(name,
              style: TextStyle(
                  color: const Color(0xFF284C29),
                  fontSize: textFont,
                  fontWeight: FontWeight.bold)),
          subtitle: Text(desc, style: TextStyle(fontSize: textFont * 0.85)),
        ),
      ),
    );
  }

  // ⭐ FULL DATA
  final List<Map<String, String>> diseaseCards = [
    {
      "name": "Powdery Mildew",
      "desc":
          "Powdery mildew is a fungal disease that appears as white to gray, powdery patches on plant surfaces, such as leaves, stems, and flowers.",
      "img": "assets/images/powderymildew2.jpeg",
    },
    {
      "name": "Leaf Spot",
      "desc":
          "Leaf spot is a common plant disease caused by fungi or bacteria, identified by spots on leaves that can be yellow, brown, or black, and may have rings or angular shapes.",
      "img": "assets/images/leafspot.jpeg",
    },
    {
      "name": "Bacterial Blight",
      "desc":
          "Bacterial blight is a plant disease caused by various bacteria, most commonly Xanthomonas species, that causes symptoms like spots, wilting, and death of plant tissues.",
      "img": "assets/images/bacterialblight.jpeg",
    },
    {
      "name": "Root Rot",
      "desc":
          "Root rot is a plant disease caused by excessive moisture in the soil, which suffocates roots by depriving them of oxygen and creates an environment for harmful fungal or bacterial pathogens to thrive.",
      "img": "assets/images/rootrot.jpeg",
    },
    {
      "name": "Mosaic Virus",
      "desc":
          "A mosaic virus is a type of plant virus that causes a mottled or mosaic pattern of yellow and green on infected foliage.",
      "img": "assets/images/MosaicVirus.jpeg",
    },
    {
      "name": "Rust Disease",
      "desc":
          "Rust disease symptoms include yellow, orange, or brown pustules on leaves and stems, which can lead to yellowing, leaf distortion, and premature leaf drop.",
      "img": "assets/images/RustDisease.jpeg",
    },
    {
      "name": "Anthracnose",
      "desc":
          "Anthracnose is a fungal disease that causes sunken, dark lesions on leaves, stems, and fruits, leading to blighting, premature defoliation, and, in severe cases, branch dieback.",
      "img": "assets/images/Anthracnose.jpeg",
    },
    {
      "name": "Downy Mildew",
      "desc":
          "Downy mildew is a plant disease that causes yellow, angular spots on the upper leaf surface and a fuzzy, cottony growth on the underside, which can lead to defoliation, wilting, and plant death.",
      "img": "assets/images/downymildew.jpeg",
    },
  ];
}
