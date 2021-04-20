import 'package:dictionary/controller/controller.dart';
import 'package:dictionary/network/fetchnigdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


class Homepage extends StatelessWidget {
  var controller = Get.put(Dataget());
   
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 8, right: 8),
            child: TextField(
              onSubmitted: (value) async {
                await fetchData.getData(value);
              },
              decoration: InputDecoration(
                hintText: "Search a word",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                fillColor: Colors.grey[100],
                filled: true,
                suffixIcon: Icon(Icons.search),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),

          GetBuilder<Dataget>(
            builder: (_) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.myFetchdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    var getworddata = controller.myFetchdata[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Word: " + getworddata.word,
                                style: TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  color: Colors.red,
                                  iconSize: 40,
                                  onPressed: () {
                              controller.playMusic(
                                            getworddata.phonetics[index].audio);
                                  },
                                  icon:Icon(Icons.volume_down_rounded)),
                                       
                            ],
                          ),
                          Text(
                            "Part Of Speech: " +
                                getworddata.meanings[0].partOfSpeech,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),

          // ignore: deprecated_member_use
        ],
      ),
    );
  }

  FetchData fetchData = FetchData();
}
