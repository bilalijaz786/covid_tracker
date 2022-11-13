import 'package:flutter/material.dart';
class CountriesDetailScreen extends StatefulWidget {
    String image ;
  String  name ;
  int totalCases , totalDeaths, totalRecovered , active , critical, todayRecovered , test;
   CountriesDetailScreen({super.key,
    required this.image ,
    required this.name ,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
   
   
   });

  @override
  State<CountriesDetailScreen> createState() => _CountriesDetailScreenState();
}

class _CountriesDetailScreenState extends State<CountriesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        elevation: 0,
         backgroundColor: Color.fromARGB(221, 0, 0, 0),
        title: Center(child: Text(widget.name)),
        ),
        backgroundColor: Color.fromARGB(221, 0, 0, 0), 

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          

          children: [
         Card(
          color: Colors.grey.shade700,
          shadowColor: Colors.black,
        
          child: Column(
            children: [
              Image(
                
                 height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width*0.2,
                
                image: NetworkImage(widget.image)),
                        ReusableRow(title: 'Cases', value: widget.totalCases.toString(),),
                        ReusableRow(title: 'Recovered', value:  widget.totalRecovered.toString(),),
                        ReusableRow(title: 'Death', value:  widget.totalDeaths.toString(),),
                        ReusableRow(title: 'Critical', value: widget.critical.toString(),),
                        ReusableRow(title: 'Today Recovered', value:widget.totalRecovered.toString(),),
                         ReusableRow(title: 'Total active cases', value:widget.active.toString()),
                         ReusableRow(title: 'Tests', value:widget.test.toString(),),
                         
                      
            ],
          ),
         )
          ],
          
        ),
    );
  }
}
class ReusableRow extends StatelessWidget {
   ReusableRow({super.key,required this.title,required this.value});
  String title ,value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
      child: Column(
      
       
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
            children: [
              Text(title,style: TextStyle(color: Colors.white),),
              Text(value,style: TextStyle(color: Colors.white),),

            ],
          )
        ],
      ),
    );
  }
}