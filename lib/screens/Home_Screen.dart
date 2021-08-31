import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/recommended_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<FoodCategory> _foodCategories = [];

  getFoodCategories() {
    // later work on getting data from the api here
    _foodCategories = [
      FoodCategory("Fruits", "assets/oranges.jpg"),
      FoodCategory("Vegetables", "assets/banana.jpg"),
      FoodCategory("Salads", "assets/salad.jpg"),
      FoodCategory("Natural Juices", "assets/salad.jpg"),
      FoodCategory("Healthy", "assets/salad.jpg"),
      FoodCategory("Healthy", "assets/salad.jpg"),
      FoodCategory("Drinks", "assets/drink1.jpg"),
      FoodCategory("Natural Juices", "assets/salad.jpg"),
    ];
  }

  // page controller
  final _pageController = PageController(viewportFraction: 0.877);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(

                height: 57.6,
                margin: EdgeInsets.only(top: 28.8, left: 28.8,
                right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                        color: Colors.grey,
                      ),
                      child: SvgPicture.asset('assets/svg/icons8-menu.svg'),
                    ),
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Colors.grey,
                      ),
                      child: SvgPicture.asset('assets/svg/search.svg'),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text('Explore Nature', style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700
                ),),
              ),
              Container(
                height: 30,
                margin: EdgeInsets.only(left: 14.4,top: 28.8
                ),
                child:DefaultTabController(length: 4, child: TabBar(
                  labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                  indicatorPadding: EdgeInsets.only(left: 14.4, right: 14.4),
                  isScrollable: true,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.redAccent),
                  labelColor: Colors.grey,
                  unselectedLabelColor: Colors.blue,
                  unselectedLabelStyle: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,

                  ),


                  labelStyle: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),

                  tabs: [
                    Tab(
                      child: Container(
                        child: Text('Recommended'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text('Popular'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text('New Destination'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text('Hidden Gems'),
                      ),
                    )
                  ],
                ),
                  
                ),
              ),
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(

                  ),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(_foodCategories.length, (index) => Container(
                    margin: EdgeInsets.only(right: 28.8),
                    width: 333.6,
                    height: 218.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.6),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://unsplash.com/s/photos/strawberry')
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.8),
                          child: BackdropFilter(filter: ImageFilter.blur(
                            sigmaX: 19.2,
                            sigmaY: 19.2,
                          ),
                            child: Container(
                              height: 36,
                              padding: EdgeInsets.only(
                                left: 16.72,
                                right: 14.4
                              ),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/pin.svg'),
                                  SizedBox(width: 9.52,),
                                  Text('Indonesia', style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 16.8,
                                  ),)
                                ],
                              ),
                            ),
                            
                          ),
                        ))
                      ],
                    ),
                  ))
                ),
              )

            ],
          ),

        ),

      ),
    );
  }
}

class FoodCategory {
  final String name, image;

  FoodCategory(this.name, this.image);
}