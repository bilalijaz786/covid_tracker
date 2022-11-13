
import 'package:covid_tracker/Models/WorldStateModel.dart';
import 'package:covid_tracker/Screens/countrieslist.dart';
import 'package:covid_tracker/Services/WorldStateServies.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  late final AnimationController controller=AnimationController(
  duration: Duration(seconds: 3),

  
  vsync:this,)..repeat();
  WorldStateService worldStateService=WorldStateService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 0, 0, 0),
      body: SafeArea(

        child:Column(
          children: [
         SizedBox(height: MediaQuery.of(context).size.height*0.03),
         FutureBuilder(
          future: worldStateService.WorldStateApiResponse(),
          builder: (context ,AsyncSnapshot<WorldStateModel> snapshot){
              if(snapshot.hasData){
                return Column(
                  children: [
PieChart(
  
  dataMap: {
  "Total ":double.parse(snapshot.data!.cases.toString()),
  "Recovered ":double.parse(snapshot.data!.recovered.toString()),
  "Deaths":double.parse(snapshot.data!.deaths.toString()),
},
chartValuesOptions: ChartValuesOptions(
  showChartValuesInPercentage: true,
),
colorList: [
  Color(0xff33BEFF),
  Color(0xff33FFAC),
  Color(0xffFF3333)
],

chartType: ChartType.ring,
animationDuration: Duration(milliseconds: 1200),
legendOptions: LegendOptions(
  legendTextStyle: TextStyle(
          
          color: Colors.white,
        ),
  legendPosition: LegendPosition.left),
 chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
),
SizedBox(height: MediaQuery.of(context).size.height*0.03),
Padding(
  padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.06,
  horizontal: MediaQuery.of(context).size.width*0.06,
  ),
  child:   Card(
  
    color: Color.fromARGB(136, 102, 102, 102),
  
    child: Column(
  
      
  
      children: [
  
        ReusableRow(title:"Total Cases" , value: snapshot.data!.cases.toString()),
  
        ReusableRow(title: "Total Recovered Cases", value: snapshot.data!.recovered.toString()),
        ReusableRow(title: "Total Death Cases", value:snapshot.data!.deaths.toString()),
          ReusableRow(title: "Total Active Cases", value:snapshot.data!.active.toString()),
            ReusableRow(title: "Total Critical Cases", value:snapshot.data!.critical.toString()),
              ReusableRow(title: "Total Today Death Cases", value:snapshot.data!.todayDeaths.toString()),
                ReusableRow(title: "Total Today Recovered Cases", value:snapshot.data!.todayRecovered.toString()),
  
      ],
  
    ),
  
  ),
),
SizedBox(height: MediaQuery.of(context).size.height*0.06),
  GestureDetector(
    onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CountiresList()));
            },
    child: Container(
  
    
  
    height:  MediaQuery.of(context).size.height*0.06,
  
     width:  MediaQuery.of(context).size.width*0.8,
  
     decoration: BoxDecoration(
  
      color: Colors.green,
  
      borderRadius: BorderRadius.circular(10)
  
     ),
  
    child: Center(child: Text("Track Countries",style: TextStyle(color: Colors.white),)),
  
  ),
  )

                  ],
                ) ;
              }
              else{
                return Expanded(
                  flex: 1,
                  child: SpinKitFadingCircle(
                    color: Colors.white,
                    size: 50,
                    controller: controller,
                  )
                );
              }
          }
          
          ),


          ],
        )
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