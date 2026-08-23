import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/reviews/presentation/widgets/custom_rating_bar.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({
    super.key,
    required this.onSubmit,
    this.initialComment = '',
    this.initialRating = 0,
    required this.isEdit,
  });

  final void Function(String comment, double rating) onSubmit;

  final String initialComment;
  final double initialRating;

  final bool isEdit;

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  late final TextEditingController _commentController;
  late double _rating;

  @override
  void initState() {
    super.initState();

    _commentController = TextEditingController(text: widget.initialComment);

    _rating = widget.initialRating;
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final comment = _commentController.text.trim();

    widget.onSubmit(comment, _rating);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.isEdit ? localization.edit_review : localization.add_review,
          style: theme.textTheme.bodyLarge,
        ),
        vGap(10),
        Align(
          alignment: Alignment.center,
          child: CustomRatingBar(
            isReadOnly: false,
            initialRating: _rating,
            itemSize: 20,
            onRatingUpdate: (rating) {
              setState(() => _rating = rating);
            },
          ),
        ),
        vGap(10),
        TextField(
          controller: _commentController,
          maxLines: 3,
          decoration: InputDecoration(
            fillColor: theme.colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.colorScheme.outline),
            ),
            hintText: localization.review_hint_text,
            hintStyle: theme.textTheme.bodySmall!.copyWith(
              color: Colors.grey[500],
            ),
          ),
        ),
        vGap(10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _handleSubmit,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.send),
                hGap(20),
                Text(localization.submit_review),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
