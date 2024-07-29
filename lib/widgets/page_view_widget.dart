import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class PageViewWidget extends StatefulWidget {
 final String imagepath;
 final String title;
 final String subtitle;
 final int currentPageIndex;
 final void Function(int) onUpdateCurrentPageIndex;




 PageViewWidget({required this.onUpdateCurrentPageIndex,required this.imagepath,required this.title,
     required this.subtitle,required this.currentPageIndex,super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {



  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset(widget.imagepath),
            ),
            Text(widget.title),
            Text(widget.subtitle,style: TextStyle(color: Colors.grey),),
            SizedBox(height: 20,),
            DotsIndicator(
              dotsCount: 4, // needed
              position: widget.currentPageIndex,
              decorator: DotsDecorator(
                shape:   RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                size: const Size(30.0, 7.0),
                activeSize: const Size(30.0, 7.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed:(){
                      if (widget.currentPageIndex == 0) {
                        return;
                      }
                      widget.onUpdateCurrentPageIndex(widget.currentPageIndex - 1);
                    setState(() {

                    });
                      } ,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                      backgroundColor: Color(0xffF5BB06), // <-- Button color
                      foregroundColor: Colors.red, // <-- Splash color
                    ),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      if (widget.currentPageIndex == 0) {
                        return;
                      }
                      widget.onUpdateCurrentPageIndex(widget.currentPageIndex + 1);

                    },
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                      backgroundColor: Color(0xffF5BB06), // <-- Button color
                      foregroundColor: Colors.red, // <-- Splash color
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      );
  }

}
