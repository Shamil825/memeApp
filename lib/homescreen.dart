import 'package:flutter/material.dart';
import 'package:memeapp_api/api/get.dart';
import 'package:memeapp_api/modelclass.dart';

class myhome extends StatelessWidget {
  const myhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getcall(),
          builder: (context, AsyncSnapshot<Model?> snap) {
            if (snap.hasData) {
              return ListView.builder(
                itemCount: snap.data!.data!.memes!.length,
                itemBuilder: (context, index) {
                  return

                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 100,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       fit: BoxFit.fill,
                      //       image: NetworkImage(
                      //         snap.data!.data!.memes![index].url!,
                      //       ),
                      //     ),
                      //   ),
                      // );
                      Card(
                    color: Colors.grey[100],
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              snap.data!.data!.memes![index].url!,
                            ),
                          ),
                          title: Text(
                            snap.data!.data!.memes![index].name!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: const [
                              Text("Active"),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 16, 204, 113),
                                radius: 6,
                              )
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.network(
                              snap.data!.data!.memes![index].url!,
                              width: 400,
                              height: 500,
                              fit: BoxFit.fitHeight),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.thumb_up_alt_outlined),
                                  label: const Text(
                                    "Like",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              const VerticalDivider(
                                endIndent: 1,
                                thickness: 2,
                              ),
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.thumb_down_off_alt),
                                  label: const Text(
                                    "Dislike",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              const VerticalDivider(
                                endIndent: 1,
                                thickness: 2,
                              ),
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.comment),
                                  label: const Text(
                                    "Comment",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert_outlined))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );

                  //   FittedBox(

                  // fit: BoxFit.contain,
                  //     child: Image.network(),);
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
