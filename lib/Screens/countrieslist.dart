import 'package:covid_tracker/Screens/countriesdetails.dart';
import 'package:covid_tracker/Services/WorldStateServies.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class CountiresList extends StatefulWidget {
  const CountiresList({super.key});

  @override
  State<CountiresList> createState() => _CountiresListState();
}

class _CountiresListState extends State<CountiresList> {
  final CountriesStateServices _countriesStateServices=CountriesStateServices();
  TextEditingController _searchcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         
        elevation: 0,
         backgroundColor: Color.fromARGB(221, 0, 0, 0)
         
      ),
     backgroundColor: Color.fromARGB(221, 0, 0, 0), 
     body: SafeArea(
      child:Column(
        children: [
               SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            
            child: TextField(
              onChanged: (value){
                setState(() {
                  
                });
              },
              controller: _searchcontroller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search with country name",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder:      OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.white),
             
                borderRadius: BorderRadius.circular(20)),
              
              focusedBorder:  OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.amberAccent),
             
                borderRadius: BorderRadius.circular(20))
              
              ),
              
              
            ),
            
          ),
        SizedBox(height: MediaQuery.of(context).size.height*0.03),
        Expanded(
          flex: 1,
          child: FutureBuilder(
            future: _countriesStateServices.CountriesStateServicesResponse(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                itemCount:snapshot.data?.length,
                itemBuilder: (context,index){
                  String name=snapshot.data![index]['country'];
                  if(_searchcontroller.text.isEmpty){
   return InkWell(
    onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CountriesDetailScreen(
                    image: snapshot.data![index]['countryInfo']['flag'],
                                    name: snapshot.data![index]['country'] ,
                                    totalCases:  snapshot.data![index]['cases'] ,
                                    totalRecovered: snapshot.data![index]['recovered'] ,
                                    totalDeaths: snapshot.data![index]['deaths'],
                                    active: snapshot.data![index]['active'],
                                    test: snapshot.data![index]['tests'],
                                    todayRecovered: snapshot.data![index]['todayRecovered'],
                                    critical: snapshot.data![index]['critical'] ,
                  )));


              
            },
     child: ListTile(
                      leading: Image(
                        height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.2,
                        fit: BoxFit.cover,
                        image: NetworkImage(snapshot.data![index]["countryInfo"]["flag"]) ,
                      
                      ),
                      title: Text(snapshot.data![index]["country"],
                      style: TextStyle(color: Colors.white),),
                      subtitle:Text("Total Cases: "+snapshot.data![index]["cases"].toString(),
                        style: TextStyle(color: Colors.white,fontSize: 14)
                      ),
                    ),
   );
                  }
                  else if(name.toLowerCase().contains(_searchcontroller.text.toLowerCase())){
                       return ListTile(
                    leading: Image(
                      height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width*0.2,
                      fit: BoxFit.cover,
                      image: NetworkImage(snapshot.data![index]["countryInfo"]["flag"]) ,
                    
                    ),
                    title: Text(snapshot.data![index]["country"],
                    style: TextStyle(color: Colors.white),),
                    subtitle:Text("Total Cases: "+snapshot.data![index]["cases"].toString(),
                      style: TextStyle(color: Colors.white,fontSize: 14)
                    ),
                  );

                  }
                  else{
                    return Container();
                  }
               
                }                
                );
              }
              else{
               
               
              return ListView.builder(
                itemCount:7,
                itemBuilder: (context,index){
               return Shimmer.fromColors(
           
                 baseColor: Colors.grey.shade700,
                  highlightColor: Colors.grey.shade100,
                  child: Column(
                    children: [
                      // height: MediaQuery.of(context).size.height*0.2,
                      //width: MediaQuery.of(context).size.width*0.2,
    ListTile(
                    leading:Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width*0.2,
                    ),
                    title: Container(height: MediaQuery.of(context).size.height*0.01,
                   width: MediaQuery.of(context).size.width*0.02,
                    color: Colors.white,
                    ),
                    subtitle:Container(height: MediaQuery.of(context).size.height*0.01,
                   width: MediaQuery.of(context).size.width*0.02,
                    color: Colors.white,
                    ),
                  )
                    ],
                  )
                  
                     );
                }                
                );

               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
              
               








































              }
              
                  

                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
              
          
          },),
          ) 
        
        
        ],
      )
       ),
    );
  }
}