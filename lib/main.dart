import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_city2/data/post_api_service.dart';
import 'package:web_city2/single_city_page.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

const kGoogleApiKey = "AIzaSyD8U8Ax2VJVC5Q3zpfn8ssMWrOO77YtBv0";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(create: (_) => PostApiService.create(),
    dispose: (_, PostApiService service) => service.client.dispose(),
    child: MaterialApp(
      title: 'Web City',
      home: MyHomePage(title: 'Web City',),
    ),);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late String city;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // placesAutoCompleteTextField(),
           TextField(
              onChanged: (String value) {
                city = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'City',
              ),
            ),
           FlatButton(onPressed: (){
             _navigateToPost(context, city);
           }, child: Text('Submit'))
          ],
        ),
      ),
    );
  }

  // placesAutoCompleteTextField() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 20),
  //     child: GooglePlaceAutoCompleteTextField(
  //         textEditingController: controller,
  //         googleAPIKey: "AIzaSyD8U8Ax2VJVC5Q3zpfn8ssMWrOO77YtBv0",
  //         inputDecoration: InputDecoration(hintText: "Search your location"),
  //         debounceTime: 800,
  //         countries: [],
  //         isLatLngRequired: true,
  //         getPlaceDetailWithLatLng: (Prediction prediction) {
  //           print("placeDetails" + prediction.lng.toString());
  //         },
  //         itmClick: (Prediction prediction) {
  //           controller.text = prediction.description!;
  //
  //           controller.selection = TextSelection.fromPosition(
  //               TextPosition(offset: prediction.description!.length));
  //         }
  //       // default 600 ms ,
  //     ),
  //   );
  // }
}

void _navigateToPost(BuildContext context, String city) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => SingleCityPage(cityId: city,),
    ),
  );
}

