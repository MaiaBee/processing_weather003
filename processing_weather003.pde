//For Maia
//Based on using http://www.wunderground.com/ API

String API_key = "Your_Key";

float diameter;

void setup() {
  size(300, 300);
  
background(Wdegrees()+100, WindSpeed());
  diameter = getPressure(); // between 1000 and 1030 
  diameter = diameter - 1000; // subtract 1000 from the gtpressure()
  diameter = map(diameter, 0, height/2, 0, 255 ); // diamtare is between 0 to 30  and map it to a numebr between 0 to 255

  ellipse(width/2, height/2, diameter, diameter);
}

void draw(){

 // put the timer here to check wather 
}

//
//read the local file and return the atmospheric 
//pressure in a usable way
float getPressure() {
  JSONObject json_to_read;
  json_to_read = loadJSONObject("fakeweather.json");
  JSONObject new_observations = json_to_read.getJSONObject("current_observation");
  String millibars = new_observations.getString("pressure_mb");
  //int numberOfElements = results.length();
  println(millibars);
  return float(millibars);
}
Integer WindSpeed() {
    JSONObject json_to_read;
  json_to_read = loadJSONObject("fakeweather.json");
  JSONObject new_observations = json_to_read.getJSONObject("current_observation");
int Wspeed = new_observations.getInt ("wind_kph");
  println(Wspeed);
  return Wspeed;
}

Integer Wdegrees() {
  JSONObject json_to_read;
  json_to_read = loadJSONObject("fakeweather.json");
  JSONObject new_observations = json_to_read.getJSONObject("current_observation");
int Wdegrees = new_observations.getInt ("wind_degrees");
println(Wdegrees);
   return Wdegrees;
}

