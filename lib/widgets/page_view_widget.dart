import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:page_viewer/utlis/color_utiltiy.dart';

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
    return
      Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        SizedBox(height:40),
        widget.currentPageIndex !=3 ?
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Skip"),
            SizedBox(width: 15,)
              ]  ): SizedBox(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Image.asset(widget.imagepath),
              ),
          
              Text(widget.title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
              SizedBox(height: 15,),
              Text(widget.subtitle,style: TextStyle(color: ColorUtility.grey,fontSize: 16,fontWeight: FontWeight.w700),),
              SizedBox(height: 65,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DotsIndicator(
                  dotsCount: 4, //
                  position: widget.currentPageIndex,
                  decorator: DotsDecorator(
                    shape:   RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    size: const Size(42.0, 7.0),
                    activeSize: const Size(42.0, 7.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    activeColor: ColorUtility.deepYellow,
                    color: ColorUtility.main
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed:(){
                        if (widget.currentPageIndex == 0) {
                           null;
                        }
                        widget.onUpdateCurrentPageIndex(widget.currentPageIndex - 1);
                      setState(() {
          
                      });
                        } ,
                      child: Icon(Icons.arrow_back, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(15),
                        backgroundColor:widget.currentPageIndex == 0 ? Colors.grey:Color(0xffF5BB06), // <-- Button color
                      ),
                    ),
          
                    ElevatedButton(
                      onPressed: (){
          
                        widget.onUpdateCurrentPageIndex(widget.currentPageIndex + 1);
          
                      },
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(15),
                        backgroundColor: Color(0xffF5BB06), // <-- Button color
                      ),
                    ),
                  ],
                ),
              ),
          
            ],
          ),
        ),
      ],
    );
  }

}
