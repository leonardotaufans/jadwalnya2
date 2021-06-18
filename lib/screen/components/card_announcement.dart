import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard(
      {Key? key,
      required this.name,
      required this.uid,
      required this.postDate,
      required this.textContent,
      required this.initial})
      : super(key: key);

  ///todo: Delete after debugging
  final String textContent;

  final String initial;
  final String name;
  final String uid;
  final String postDate;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, _) {
      var _textTheme = Theme.of(context).textTheme;

      Widget image = FullScreenWidget(
        child: Hero(
          tag: 'image_city',
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.0)),
            child: Image.asset(
              'assets/images/city.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        child: Card(
          elevation: 2.0,
          child: Flex(
            direction: Axis.vertical,
            children: [
              AnnounceCardHeader(
                  initial: initial,
                  name: name,
                  textTheme: _textTheme,
                  uid: uid),
              SizedBox(
                height: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                ),
              ),
              AnnounceCardContent(
                  image: image,
                  content: textContent,
                  textTheme: _textTheme,
                  postDate: postDate),
            ],
          ),
        ),
      );
    });
  }
}

class AnnounceCardContent extends StatelessWidget {
  const AnnounceCardContent({
    Key? key,
    this.image,
    required this.content,
    required TextTheme textTheme,
    required this.postDate,
    this.imageUri,
  })  : _textTheme = textTheme,
        super(key: key);

  final Widget? image;
  final String content;
  final TextTheme _textTheme;
  final String postDate;
  final String? imageUri;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Visibility(
            visible: image != null,
            child: Expanded(
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(4.0)),
                  child: image),
              flex: 5,
            ),
          ),
          Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: Text(
                        '$content',
                        maxLines: 8,
                        style: _textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                            child: IconButton(
                          icon: Icon(Icons.bookmark),
                          onPressed: () {},
                        )),
                        Flexible(
                          child: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {},
                          ),
                        ),
                        Flexible(
                          child: IconButton(
                            icon: Icon(Icons.alarm),
                            onPressed: () {},
                          ),
                        ),
                        Align(
                          child: IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '$postDate',
                            style: _textTheme.subtitle1!.copyWith(fontSize: 12),
                          )),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class AnnounceCardHeader extends StatelessWidget {
  const AnnounceCardHeader({
    Key? key,
    required this.initial,
    required this.name,
    required TextTheme textTheme,
    required this.uid,
  })  : _textTheme = textTheme,
        super(key: key);

  final String initial;
  final String name;
  final TextTheme _textTheme;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              FittedBox(
                  child: CircleAvatar(
                child: Text('$initial'),
              )),
              VerticalDivider(),
              Expanded(
                flex: 4,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '$name',
                        style: _textTheme.headline5!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    TextSpan(text: '\n'),
                    TextSpan(
                        text: '$uid',
                        style: _textTheme.bodyText2!.copyWith(fontSize: 12))
                  ]),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ));
  }
}
