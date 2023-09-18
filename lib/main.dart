import 'package:flutter/material.dart';

void main() => runApp(PhotoGalleryApp());

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to our Photo Gallery!',

                style: TextStyle(

                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search photos..',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: 6,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Image ${index + 1} Clicked'),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3.0,
                    child: Column(
                      children: [
                        Image.network(
                          getImageUrl(index), // Get the image URL for this index
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Photo ${index + 1}'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.network(getImageUrl(6)),
              title: Text('Sample Photo 1'),
              subtitle: Text('Subtitle 1'),
            ),
            ListTile(
              leading: Image.network(getImageUrl(7)),
              title: Text('Sample Photo 2'),
              subtitle: Text('Subtitle 2'),
            ),
            ListTile(
              leading: Image.network(getImageUrl(8)),
              title: Text('Sample Photo 3'),
              subtitle: Text('Subtitle 3'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Photos Uploaded Successfully!'),
                  ),
                );
              },
              child: Icon(Icons.upload),
            ),
          ],
        ),
      ),
    );
  }

  String getImageUrl(int index) {
    // Replace with your image URLs
    List<String> imageUrls = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwcZ3H2ViRZp4vDi5BWPo4iYNfAezhbK5CzekgV4rfMI7HYLMFlptG1eDGkNwSsoiRxUE',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5faZK-j9X1zPoftPRHc5xIb803VWrl8kvWJ1CG1DUECKVACk1k289lmkALnZJL6Ev5ss',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwcZ3H2ViRZp4vDi5BWPo4iYNfAezhbK5CzekgV4rfMI7HYLMFlptG1eDGkNwSsoiRxUE',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5faZK-j9X1zPoftPRHc5xIb803VWrl8kvWJ1CG1DUECKVACk1k289lmkALnZJL6Ev5ss',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwcZ3H2ViRZp4vDi5BWPo4iYNfAezhbK5CzekgV4rfMI7HYLMFlptG1eDGkNwSsoiRxUE',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwcZ3H2ViRZp4vDi5BWPo4iYNfAezhbK5CzekgV4rfMI7HYLMFlptG1eDGkNwSsoiRxUE',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwcZ3H2ViRZp4vDi5BWPo4iYNfAezhbK5CzekgV4rfMI7HYLMFlptG1eDGkNwSsoiRxUE',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5faZK-j9X1zPoftPRHc5xIb803VWrl8kvWJ1CG1DUECKVACk1k289lmkALnZJL6Ev5ss',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwcZ3H2ViRZp4vDi5BWPo4iYNfAezhbK5CzekgV4rfMI7HYLMFlptG1eDGkNwSsoiRxUE',

    ];

    return imageUrls[index % imageUrls.length];
  }
}


