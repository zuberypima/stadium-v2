import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:stadiumapp/view/widgets/seetGridview.dart';

class StadiumView extends StatefulWidget {
  const StadiumView({super.key});

  @override
  State<StadiumView> createState() => _StadiumViewState();
}

final SliverGridDelegate customGridDelegate =
    SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 12, // Number of columns
  mainAxisSpacing: 10.0, // Spacing between rows
  crossAxisSpacing: 10.0, // Spacing between columns
  childAspectRatio: 1.0, // Aspect ratio of the items
);

class _StadiumViewState extends State<StadiumView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(border: Border.all()),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      color: Colors.amber,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3.2,
                            child: InteractiveViewer(child: seetLayout(10, 20)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      // width: 200,
                      color: Colors.amber,
                      child: Row(
                        children: [],
                      ),
                    ),
                  ),
                  Divider(),
                  InteractiveViewer(
                    child: Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        color: Colors.amber,
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: InteractiveViewer(
                                child: GridView.custom(
                                  gridDelegate: customGridDelegate,
                                  childrenDelegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      return GridTile(
                                        child: Center(
                                            child: Icon(Icons.chair_outlined)),
                                      );
                                    },
                                    childCount: 10,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: InteractiveViewer(
                                child: GridView.custom(
                                  gridDelegate: customGridDelegate,
                                  childrenDelegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      return GridTile(
                                        child: Center(
                                            child: Icon(Icons.chair_outlined)),
                                      );
                                    },
                                    childCount: 10,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: InteractiveViewer(
                                child: GridView.custom(
                                  gridDelegate: customGridDelegate,
                                  childrenDelegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      return GridTile(
                                        child: Center(
                                            child: Icon(Icons.chair_outlined)),
                                      );
                                    },
                                    childCount:
                                        10, // Number of items in the grid
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
