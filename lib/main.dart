import 'package:flutter/material.dart';
import 'storybrain.dart';
void main() {
  runApp(const Destini());
}
StoryBrain storyBrain = StoryBrain();
class Destini extends StatelessWidget {
  const Destini({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyStoryPage(),
    );
  }
}

class MyStoryPage extends StatefulWidget {
  const MyStoryPage({Key? key}) : super(key: key);

  @override
  State<MyStoryPage> createState() => _MyStoryPageState();
}

class _MyStoryPageState extends State<MyStoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1623705267866-71d69d886f75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGJsdWUlMjBhZXN0aGV0aWN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
        fit: BoxFit.cover)

      ),
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getTitle(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if(storyBrain.storyNumber<=2){
                        storyBrain.nextStory(1);
                      }
                      else{
                        storyBrain.restartStory();
                      }

                    });
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.deepOrange),
                  ),
                  child:  Text(
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.deepPurpleAccent),
                    ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
