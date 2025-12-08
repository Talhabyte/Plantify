import '../models/disease_model.dart';

class DiseaseData {
  // Contains the full static list of diseases for the guide screen.
  static const List<Disease> diseaseGuideList = [
    Disease(
      name: "Powdery Mildew",
      description:
          "Powdery mildew is a fungal disease that appears as white to gray, powdery patches on plant surfaces, such as leaves, stems, and flowers.",
      imageAssetPath: "assets/images/powderymildew2.jpeg",
    ),
    Disease(
      name: "Leaf Spot",
      description:
          "Leaf spot is a common plant disease caused by fungi or bacteria, identified by spots on leaves that can be yellow, brown, or black, and may have rings or angular shapes.",
      imageAssetPath: "assets/images/leafspot.jpeg",
    ),
    Disease(
      name: "Bacterial Blight",
      description:
          "Bacterial blight is a plant disease caused by various bacteria, most commonly Xanthomonas species, that causes symptoms like spots, wilting, and death of plant tissues.",
      imageAssetPath: "assets/images/bacterialblight.jpeg",
    ),
    Disease(
      name: "Root Rot",
      description:
          "Root rot is a plant disease caused by excessive moisture in the soil, which suffocates roots by depriving them of oxygen and creates an environment for harmful fungal or bacterial pathogens to thrive.",
      imageAssetPath: "assets/images/rootrot.jpeg",
    ),
    Disease(
      name: "Mosaic Virus",
      description:
          "A mosaic virus is a type of plant virus that causes a mottled or mosaic pattern of yellow and green on infected foliage.",
      imageAssetPath: "assets/images/MosaicVirus.jpeg",
    ),
    Disease(
      name: "Rust Disease",
      description:
          "Rust disease symptoms include yellow, orange, or brown pustules on leaves and stems, which can lead to yellowing, leaf distortion, and premature leaf drop.",
      imageAssetPath: "assets/images/RustDisease.jpeg",
    ),
    Disease(
      name: "Anthracnose",
      description:
          "Anthracnose is a fungal disease that causes sunken, dark lesions on leaves, stems, and fruits, leading to blighting, premature defoliation, and, in severe cases, branch dieback.",
      imageAssetPath: "assets/images/Anthracnose.jpeg",
    ),
    Disease(
      name: "Downy Mildew",
      description:
          "Downy mildew is a plant disease that causes yellow, angular spots on the upper leaf surface and a fuzzy, cottony growth on the underside, which can lead to defoliation, wilting, and plant death.",
      imageAssetPath: "assets/images/downymildew.jpeg",
    ),
  ];
}
