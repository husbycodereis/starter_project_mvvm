import 'package:flutter/material.dart';
import '../../../extensions/context_extensions.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _selectedValueIndex = 0;
  final List<String> imageUrls = List.generate(3, (index) => 'https://picsum.photos/300/200');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: buildPageView(),
          ),
          Expanded(child: buildListViewCirleIndicator()),
        ],
      ),
    );
  }

  PageView buildPageView() {
    return PageView.builder(
        onPageChanged: _changeValue,
        controller: PageController(viewportFraction: 0.9),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            child: Image.network(imageUrls[index]),
          );
        });
  }

  void _changeValue(int index) {
    setState(() {
      _selectedValueIndex = index;
    });
  }

  ListView buildListViewCirleIndicator() {
    return ListView.builder(
      itemCount: imageUrls.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(context.dynamicWidth(0.01)),
        child: CircleAvatar(
          backgroundColor: _selectedValueIndex == index
              ? context.customColors.orange
              : context.customColors.darkGrey.withOpacity(0.1),
          radius: _selectedValueIndex == index ? 7 : 5,
        ),
      ),
    );
  }
}
