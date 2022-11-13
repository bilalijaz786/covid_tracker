import 'dart:convert';

import 'package:covid_tracker/Models/WorldStateModel.dart';
import 'package:covid_tracker/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class WorldStateService{


  Future <WorldStateModel> WorldStateApiResponse()async{
    final response= await http.get(Uri.parse(AppUrl.WorldStateApi));

    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      return WorldStateModel.fromJson(data);

    }
    else{
      throw Exception("Error");
    }
    

  }
}

class CountriesStateServices{


  Future <List<dynamic>> CountriesStateServicesResponse()async{
    final response= await http.get(Uri.parse(AppUrl.CountryStateApi));

    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      return data;

    }
    else{
      throw Exception("Error");
    }
    

  }
}