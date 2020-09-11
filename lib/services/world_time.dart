import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime; //true or false if daytime or not

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    // make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    // get properties from json
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    
    // set the time property
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
    print(time);
  }

}

// WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');

//we place the future key word like here to say that the function
    //will return temporraily what's known as  a future and a future is ab it like
    //a promise in JS and it means that its a placeholder value unti ltjhe function is complete
    //it essentially wraps our void type and says : at some point i'm gonna return void
    //but only when this asyncrhonous function is fully complete so the future is a temporary placeholder value
    //to let dart know when an asynhronous function is compelte
    //so the await keyword in the loading file will know when the asynchronous function is complete
    //and then it can move on