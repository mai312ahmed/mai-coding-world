import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/cubits/cubits/testimonails_cubit.dart';

class AddTestimonialsSection extends StatelessWidget {
  AddTestimonialsSection({super.key});
  final nameController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestimonailsCubit, TestimonailsState>(
      listener: (context, state) {
        if (state.loadStatus == LoadTestimonailsStatus.loaded) {
          nameController.clear();
          contentController.clear();
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            BigText(text: "addTestimonial", fontSize: 20),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: LabelText(label: "your_name"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contentController,
              maxLines: 4,
              decoration: InputDecoration(
                label: LabelText(label: "write_testimonial"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    color: index < state.rating ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    context.read<TestimonailsCubit>().setRate(index + 1);
                  },
                );
              }),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed:
                  state.addStatus == AddTestimonailsStatus.adding
                      ? null
                      : () {
                        final name = nameController.text.trim();
                        final content = contentController.text.trim();
                        if (name.isEmpty || content.isEmpty) return;
                        context.read<TestimonailsCubit>().addTestimonails(
                          name,
                          content,
                        );
                      },
              child:
                  state.addStatus == AddTestimonailsStatus.adding ||
                          state.loadStatus == LoadTestimonailsStatus.loading
                      ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: CircularProgressIndicator(),
                      )
                      : LabelText(label: "submit_testimonial"),
            ),
          ],
        );
      },
    );
  }
}
