
class OnBoardModel {
  final String image;
  final String name;

  OnBoardModel({
    required this.image,
    required this.name,
  });
}

List<OnBoardModel> onboardModels = [
  OnBoardModel(
    image: 'assets/svgs/onboard1.svg',
    name: 'We provide high quality products just for you',
  ),
  OnBoardModel(
    image: 'assets/svgs/onboard3.svg',
    name: 'Your satisfaction is our number one priority',
  ),
  OnBoardModel(
    image: 'assets/svgs/onboard3.svg',
    name: 'Lets fulfil your house needs with Funica right now',
  )
];
