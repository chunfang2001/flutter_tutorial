import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: MyHome()
  ));
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> item = [];

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text("Todo App"),
          )
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2, // changes position of shadow
                      ),
                    ]
                ),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                          child: Form(
                            key:_formKey,
                            child:TextFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              controller: _controller,
                              style: const TextStyle(
                                  fontSize: 18
                              ),
                              decoration: const InputDecoration(
                                labelText: "New Todo stuff",
                                hintText: "Enter Something......",
                              ),
                            ),
                          )
                        )
                    ),
                    ElevatedButton(
                        onPressed:(){
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              item.add(_controller.text);
                            });
                            _controller.clear();
                          }
                        },
                        child: const Text("submit")
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index){
                    return Column(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              item.remove(item[index]);
                            });
                          },
                          splashColor: Colors.blue[300],
                          child: Ink(
                            padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                            color: index%2==1?Colors.blue[200]:Colors.blue[100],
                            child: Align(
                                alignment: Alignment.center,
                                child:Text(
                                    item[index],
                                    style: const TextStyle(
                                        fontSize: 18
                                    )
                                )
                            ),
                          )
                        ),
                        const SizedBox(
                          height: 1,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          )
      ),
    );
  }
}


