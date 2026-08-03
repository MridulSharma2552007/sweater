import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sweater/core/theme/app_text_theme.dart';
import 'package:sweater/core/theme/theme.dart';

class Onboardroot extends StatefulWidget {
  const Onboardroot({super.key});

  @override
  State<Onboardroot> createState() => _OnboardrootState();
}

class _OnboardrootState extends State<Onboardroot> {

  void incrementPageIndex(int index){
    index+=index;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
            Text('Skip intro',style: AppTextTheme.textTheme.labelSmall,)
              ],
            ),
          )
,
          SizedBox(
            height: 5,
          
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,itemBuilder: (context,index){
            
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: AnimatedContainer(duration: Duration(milliseconds: 800),height: 0,width: 60,
                decoration: BoxDecoration(
                  
                 
                 color: index == 0
        ? AppTheme.accentRust(context)
        : AppTheme.line(context),borderRadius: BorderRadius.circular(100)),),
              );
            },),
          )
        ],
     
      ),
      
    );
  }
}