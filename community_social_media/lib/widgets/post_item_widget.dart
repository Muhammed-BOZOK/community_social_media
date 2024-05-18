import 'package:community_social_media/const/context_extension.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostItemWidget extends StatelessWidget {
  PostItemWidget({
    super.key,
    required this.post,
    this.onPressedToAddComment,
    this.onPressedToLike,
  });

  final PostModel post;
  final Function()? onPressedToAddComment;
  final Function()? onPressedToLike;

  final double iconSize = 35;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Card(
        color: const Color(0xFFEEF5FF),
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(children: [
          _itemHeader(context),
          if (post.description != null) _itemDescription(context),
          _itemBody(context),
          _itemBottom(),
        ]),
      ),
    );
  }

  Widget _itemBottom() {
    return Row(
      children: [
        IconButton(
            onPressed: onPressedToLike,
            icon: Icon(
              Icons.favorite_border_rounded,
              size: iconSize,
              color: Colors.blue,
            )),
        IconButton(
            onPressed: onPressedToAddComment,
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
              size: iconSize,
              color: Colors.blue,
            ))
      ],
    );
  }

  Padding _itemDescription(BuildContext context) {
    debugPrint('${post.description}');
    return Padding(
      padding: context.paddingHorizontalLow,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '${post.description}',
          maxLines: 3,
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }

  Widget _itemBody(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalDefault,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
            /* decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(post.postImageUrl!),
              fit: BoxFit.cover,
            ),
          ), */
            ),
      ),
    );
  }

  Widget _itemHeader(BuildContext context) {
    Color iconColor = Colors.blue;
    return Padding(
      padding: context.paddingAllLow,
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.person_2_rounded,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: context.paddingLeftLow,
                      child: Text(
                        post.userName ?? 'User Name',
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_rounded,
                    size: 35,
                    color: iconColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 0.1,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}