import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/features/project%20details%20page/view/project_details_page.dart';
import 'package:mai_coding_world/models/project_model/project_model.dart';

class ViewDetails extends StatelessWidget {
  const ViewDetails({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetailsPage(project: project),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          LabelText(label: "viewDetails", color: Colors.black),
          SizedBox(width: 8),
          Icon(
            Icons.arrow_forward,
            size: 16,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
