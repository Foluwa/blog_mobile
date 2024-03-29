import 'package:blog_mobile/models/Post.dart';
import 'package:blog_mobile/pages/PostDetails/PostDetails.dart';
import 'package:blog_mobile/widgets/bottom_bar_widget.dart';
import 'package:blog_mobile/widgets/post_cell_widget.dart';
import 'package:flutter/material.dart';

class BlogHome extends StatefulWidget {
  @override
  _BlogHomeState createState() => _BlogHomeState();
}

class _BlogHomeState extends State<BlogHome> {
  final data = [
    Post(
      image:
          'https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg', //'assets/images/ikigai.jpg',
      title: 'Finding your ikigai in your middle age',
      author: 'John Johny',
      date: '25 Mar 2020',
    ),
    Post(
      image:
          'https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg', //'assets/images/leader.jpg',
      title: 'How to Lead Before You Are in Charge',
      author: 'John Johny',
      date: '24 Mar 2020',
    ),
    Post(
      image:
          'https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg', //'assets/images/minimal.jpg',
      title: 'How Minimalism Brought Me',
      author: 'John Johny',
      date: '15 Mar 2020',
    ),
    Post(
      image:
          'https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg', //'assets/images/colors.jpg',
      title: 'The Most Important Color In UI Design',
      author: 'John Johny',
      date: '11 Mar 2020',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Posts Update',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg') //AssetImage('assets/images/profile.jpg'),
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 0,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book),
        backgroundColor: Color(0xFFFFD810),
        elevation: 0,
        onPressed: () {},
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for articles, author, and tags',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your daily read',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  // shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final post = data[index];
                    return PostCellWidget(
                        title: post.title,
                        image: post.image,
                        author: post.author,
                        date: post.date,
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PostDetails(
                                title: post.title,
                                image: post.image,
                                author: post.author,
                                date: post.date,
                              ),
                            ),
                          );
                        });
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Writing Contest',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 130,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          // child: Image.asset(
                          //   'assets/images/writing_1.jpg',
                          //   fit: BoxFit.cover,
                          // ),
                          child: Image.network(
                            'https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 130,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          // child: Image.asset(
                          //   'assets/images/writing_2.jpg',
                          //   fit: BoxFit.cover,
                          // ),
                          child: Image.network(
                            'https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 130,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          // child: Image.asset(
                          //   'assets/images/writing_3.jpg',
                          //   fit: BoxFit.cover,
                          // ),
                          child: Image.network(
                            'https://images.pexels.com/photos/2255441/pexels-photo-2255441.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
