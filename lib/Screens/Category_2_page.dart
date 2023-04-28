import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optuae/constants/colors.dart';
import 'package:optuae/constants/global_data.dart';
import 'package:optuae/constants/images_url.dart';
import 'package:optuae/Functions/navigation_functions.dart';
import 'package:optuae/Widget/Dropdown.dart';
import 'package:optuae/Widget/round_edged_button.dart';
import '../constants/Textstyles.dart';
import '../Widget/appbar.dart';
import '../Widget/custom_text_field.dart';
import 'Category_detail_page.dart';

class Category_2_page extends StatefulWidget {
  const Category_2_page({Key? key}) : super(key: key);

  @override
  State<Category_2_page> createState() => _Category_2_pageState();
}

class _Category_2_pageState extends State<Category_2_page> {
  TextEditingController search = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  bool isChecked=false;
  bool isChecked2=false;
  List car=[
    {"img": MyImages.homecar1, "title": "Nose cut BMW...", "subtitle": "Mercedes-Benz C-Class 2011-2014 W204", "price": "\$2,868"},
    {"img": MyImages.homecar2, "title": "Nose cut BMW...", "subtitle": "Mercedes-Benz C-Class 2011-2014 W204", "price": "\$2,868"},
    {"img": MyImages.car1, "title": "Nose cut BMW...", "subtitle": "Mercedes-Benz C-Class 2011-2014 W204", "price": "\$2,868"},
    {"img": MyImages.car2, "title": "Nose cut BMW...", "subtitle": "Mercedes-Benz C-Class 2011-2014 W204", "price": "\$2,868"},
    {"img": MyImages.car3, "title": "Nose cut BMW...", "subtitle": "Mercedes-Benz C-Class 2011-2014 W204", "price": "\$2,868"},
    {"img": MyImages.homecar1, "title": "Nose cut BMW...", "subtitle": "Mercedes-Benz C-Class 2011-2014 W204", "price": "\$2,868"},
    {"img": MyImages.homecar2, "title": "Nose cut BMW...", "subtitle": "Mercedes-Benz C-Class 2011-2014 W204", "price": "\$2,868"},
    {"img": MyImages.car1, "title": "Nose cut BMW...", "subtitle": "Mercedes-Benz C-Class 2011-2014 W204", "price": "\$2,868"},
    {"img": MyImages.car2, "title": "Nose cut BMW...", "subtitle": "Mercedes-Benz C-Class 2011-2014 W204", "price": "\$2,868"},
    {"img": MyImages.car3, "title": "Nose cut BMW...", "subtitle": "Mercedes-Benz C-Class 2011-2014 W204", "price": "\$2,868"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: appBar(
          context: context,
          title: "Nose Cuts",
          titleStyle: MyStyle.black50016,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size_width*0.045),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              SizedBox(height: size_height*0.02,),
              Text("Nose Cuts" , style: MyStyle.black70030,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: size_width/1.31,
                    child: CustomTextField(
                      controller: search,
                      myheight: size_height*0.06,
                      hintText: 'Enter part number or name',
                      bgColor: MyColors.white,
                      preffix: Icon(Icons.search),
                      hintcolor: MyColors.lightblack.withOpacity(0.45),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: MyColors.lightgrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                          ),
                          builder: (context) {
                            return StatefulBuilder(builder: (BuildContext context,
                                StateSetter setState) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: size_width*0.04, vertical: size_height*0.03),
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 5,

                                  alignment: WrapAlignment.start,
                                  children: [
                                    Text("Availability", style: MyStyle.black60016,),
                                    SizedBox(height: size_height * 0.02),

                                    Row(
                                      children: [
                                        SizedBox(
                                          height: size_height*0.02,
                                          width: size_width*0.06,
                                          child: Transform.scale(
                                            scale: 1.2,
                                            child: Theme(

                                              child: Checkbox(
                                                side: MaterialStateBorderSide.resolveWith(
                                                      (Set<MaterialState> states) {
                                                    if (states.contains(MaterialState.selected)) {
                                                      return const BorderSide(width: 1, color: MyColors.black);
                                                    }
                                                    return const BorderSide(width: 1, color: MyColors.black);
                                                  },
                                                ),
                                                checkColor: MyColors.black,
                                                activeColor: MyColors.primaryColor,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                value: isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },
                                              ),
                                              data: ThemeData(
                                                unselectedWidgetColor: MyColors.black, // Your color
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: size_width*0.02,),
                                        Text('In stock(692)', style: MyStyle.black50015,),
                                        Spacer(),
                                        Text('(692)', style: MyStyle.black60015,),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(
                                          height: size_height*0.02,
                                          width: size_width*0.06,
                                          child: Transform.scale(
                                            scale: 1.2,
                                            child: Theme(

                                              child: Checkbox(
                                                side: MaterialStateBorderSide.resolveWith(
                                                      (Set<MaterialState> states) {
                                                    if (states.contains(MaterialState.selected)) {
                                                      return const BorderSide(width: 1, color: MyColors.black);
                                                    }
                                                    return const BorderSide(width: 1, color: MyColors.black);
                                                  },
                                                ),
                                                checkColor: MyColors.black,
                                                activeColor: MyColors.primaryColor,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                value: isChecked2,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked2 = value!;
                                                  });
                                                },
                                              ),
                                              data: ThemeData(
                                                unselectedWidgetColor: MyColors.black, // Your color
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: size_width*0.02,),
                                        Text('Out of stock(304)', style: MyStyle.black50015,),
                                        Spacer(),
                                        Text('(304)', style: MyStyle.black60015,),
                                      ],
                                    ),
                                    SizedBox(height: size_height * 0.025),

                                    Text("Price", style: MyStyle.black60016,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: size_width/2.5,
                                          child: CustomTextField(
                                            controller: from,
                                            hintText: '\$ From',
                                            bgColor: MyColors.white,
                                            contentBottomPadding: 5,
                                            hintcolor: MyColors.lightblack.withOpacity(0.45),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size_width/2.5,
                                          child: CustomTextField(
                                            controller: to,
                                            hintText: '\$ To',
                                            bgColor: MyColors.white,
                                            contentBottomPadding: 5,
                                            hintcolor: MyColors.lightblack.withOpacity(0.45),
                                          ),
                                        ),

                                      ],
                                    ),

                                    SizedBox(height: size_height * 0.015),

                                    RoundEdgedButton(
                                      text: 'Apply',
                                      fontSize: 20,
                                      height: size_height*0.07,
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                    ),
                                    SizedBox(height: size_height * 0.015),

                                    Align(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, fontFamily: 'nunito', decoration: TextDecoration.underline),)),
                                    )


                                  ],
                                ),
                              );
                            });
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: MyColors.primaryColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: Image.asset(MyImages.filter, height: size_height*0.04,),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: size_height*0.02,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nose cut', style: MyStyle.black60018,),
                  DropDown(label: 'Sort By', buttonwidth: size_width*0.3, buttonheight: size_height*0.035, isRight: false,
                    items: ['Recommended', 'Hot selling', 'From A to Z', 'From Z to A', 'Ascending Price', 'Descending Price', 'Old one first', 'New one first'],)
                ],
              ),
              SizedBox(height: size_height*0.02,),

              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing:size_width*0.025,
                      crossAxisSpacing: size_width*0.03,
                      childAspectRatio: 0.8
                  ),
                  children: [
                    for(int index=0;index<car.length;index++)
                    GestureDetector(
                      onTap: (){
                        push(context: context, screen: Category_detail_page());
                      },
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: size_height*0.15,
                                    width: size_width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                            image: AssetImage(car[index]['img']),
                                            fit: BoxFit.cover
                                        )
                                    ),),
                                  Positioned(
                                      bottom: 10,
                                      right: 5,
                                      child: RoundEdgedButton(text: 'Контрактная', height: size_height*0.02, fontSize: 9, width: size_width/5,))
                                ],
                              ),

                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: size_width*0.02, vertical: size_height*0.01),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Wrap(
                                      children: [
                                        SizedBox(
                                            width: size_width/2.5,
                                            child: Text(car[index]['title'], style: MyStyle.black60013,)),
                                      ],
                                    ),
                                    SizedBox(height: size_height*0.005,),
                                    Wrap(
                                      children: [
                                        SizedBox(
                                            width: size_width/2.5,
                                            child: Text(car[0]['subtitle'], style: MyStyle.lb40009,)),
                                      ],
                                    ),
                                    SizedBox(height: size_height*0.005,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(car[index]['price'], style: MyStyle.black60016,),
                                        RoundEdgedButton(
                                          text: 'In stock'.toUpperCase(),
                                          width: size_width*0.14,
                                          verticalPadding: 2,
                                          fontSize: 8,
                                          borderRadius: 2,
                                          color: MyColors.black,
                                          border_color: MyColors.black,
                                          textColor: MyColors.white,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size_height*0.02,),



            ]
        ),
      ),
    );
  }
}
