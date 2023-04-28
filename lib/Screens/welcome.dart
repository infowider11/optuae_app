import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:optuae/Screens/preLogin.dart';
import '../constants/Textstyles.dart';
import '../constants/colors.dart';
import '../constants/global_data.dart';
import '../constants/images_url.dart';
import '../Functions/navigation_functions.dart';



class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  bool page1=false;
  bool page2=false;
  bool hide=false;
  int activeIndex_ = 0;
  final CarouselController _controller = CarouselController();


  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: Stack(
          children: [


            Stack(
              children: [
                ///dot indicator
                Positioned(
                  bottom: 40,
                  left: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [1,2].asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: activeIndex_ == entry.key ? 12:12,
                          height: 12,
                          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: activeIndex_ == entry.key ?  MyColors.black : MyColors.black.withOpacity(0.2)
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                hide==true?
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: InkWell(
                    onTap: (){
                        push(context: context, screen: pre_login());
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(right: size_width*0.03, bottom: size_height*0.01),
                      child: Container(height: 58, width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: MyColors.primaryColor,

                        ),
                        child: Icon(Icons.arrow_forward, color: MyColors.black, size: 30,),
                      ),
                    ),
                  ),
                )
                    :
                Container()
              ],
            ),


            CarouselSlider(
                  items: [
                    ///1st Image of Slider
                    SingleChildScrollView(
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: size_height/1.5,
                            width: size_width,
                            decoration: BoxDecoration(
                              color: MyColors.primaryColor,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(180)),
                              image: DecorationImage(
                                image: AssetImage(MyImages.welcome_img,)
                              )
                            ),
                          ),

                          SizedBox(height: size_height*0.03),

                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: size_width*0.06),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Welcome!", style: MyStyle.black60040,),
                                Text("Auto parts warehouse in the UAE from OPTUAE", style: MyStyle.grey60024,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),


                    ///2nd Image of Slider
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: size_height/1.5,
                            width: size_width,
                            decoration: BoxDecoration(
                                color: MyColors.primaryColor,
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(180)),
                                image: DecorationImage(
                                    image: AssetImage(MyImages.welcome_img,)
                                )
                            ),
                          ),

                          SizedBox(height: size_height*0.03),

                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: size_width*0.06),
                            child: Text("What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's "
                                "standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled "
                                "it to make a type specimen book.", style: MyStyle.grey60018,),

                          )
                        ],
                      ),
                    ),

                  ],
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height/1.19,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      autoPlayCurve: Curves.ease,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex_ = index;
                          if(activeIndex_==1){
                            hide=true;
                          }else if(activeIndex_==0){
                            hide=false;
                          }

                        });
                      }
                  ),
                ),

          ],
        ),
      ),
    );
  }
}




