import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
  builder: (context, state) {
    if (state is SimilarBooksSuccess) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: CustomBookImage(
              imageUrl: 'https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.4QY1_z2gNBFEvf3bv-BnvgHaJW%26pid%3DApi&sp=1723593453T6f22a7691ea0b09a780bb885e0d7e6cf84033ef22ed3c340e4d0c0082c7fd140',
            ),
          ),
        ),
      );
    }
    else if(state is SimilarBooksFailure){
      return CustomErrorWidget(errMessage: state.errMessage);
    }else{
      return const CustomLoadingIndicator();
    }
  },
);
  }
}
