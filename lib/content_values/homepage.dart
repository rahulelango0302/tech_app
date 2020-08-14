import 'package:flutter/material.dart';
import 'package:tech_app/alldatas/news.dart';
import 'package:tech_app/content_values/article.dart';
import 'package:tech_app/models/newsdata.dart';
import 'article.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsData> articles = []; //List<NewsData>();
  bool ready = true;

  getNews() async {
    News newscontents = News();
    await newscontents.getnews();
    articles = newscontents.newsdetails;
    setState(() {
      ready = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tech",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Shots",
              style: TextStyle(color: Color(0xFF508829)),
            ),
            Icon(
              Icons.local_bar,
              color: Color(0xFFE88501),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: ready
          ? Center(child: Container(child: CircularProgressIndicator()))
          : Container(
              child: ListView.builder(
                  itemCount: articles.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TechBlogs(
                      imgUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      descrip: articles[index].description,
                      url: articles[index].url,
                    );
                  }),
            ),
    );
  }
}

class TechBlogs extends StatelessWidget {
  final String imgUrl, title, descrip, url;
  TechBlogs(
      {@required this.imgUrl,
      @required this.title,
      @required this.descrip,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FullArticle(
                      expurl: url,
                    )));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imgUrl)),
            SizedBox(
              height: 5.0,
            ),
            Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 5.0,
            ),
            Text(
              descrip,
              style: TextStyle(color: Colors.brown.shade100),
            ),
          ],
        ),
      ),
    );
  }
}
