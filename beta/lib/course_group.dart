import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            'Course Group',
            style: TextStyle(fontWeight: FontWeight.w700),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: Center(
            child: DropShadowImage(

              image: Image(
                  height: 200,
                  image: AssetImage(
                    './assets/images/splash.png',
                  )),
            ),
          )),
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: SearchAnchor(
              viewHintText: 'SOmething...',
                builder: (BuildContext context, SearchController controller) {
              return Container(
                height: 45,
                child: SearchBar(
                  // constraints: BoxConstraints(
                    // maxHeight: 1000
                  // ),
                  surfaceTintColor: MaterialStateProperty.all(Colors.white),
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0 ,)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search, color: Colors.green,),
                ),
              );
            }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            }),
          )
        ],
      ),
    ));
  }
}
