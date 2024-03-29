import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/widgets/custom_book_image.dart';
import 'package:bookly/core/routes/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../../constant.dart';
import '../../../../core/utils/app_styles.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushReplacement( AppRouter.kDetailseView,extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??"",),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                   Text(
                    bookModel.volumeInfo.authors?[0]??bookModel.volumeInfo.authors![1],
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                         BookRating(rating: bookModel.volumeInfo.averageRating?.round()?? 0,
                         count: bookModel.volumeInfo.ratingsCount?? 0,
                         ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
