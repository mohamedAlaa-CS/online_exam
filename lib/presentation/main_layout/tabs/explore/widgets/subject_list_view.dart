import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/domin/entities/explor_entity/subject_entity.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/view_models/subject_contract.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/view_models/subject_states.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/view_models/subject_view_model.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/widgets/subject_item_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

// ignore: must_be_immutable
class SubjectListView extends StatelessWidget {
  SubjectListView({super.key});
  List<SubjectEntity>? subjectsList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectViewModel, SubjectStates>(
      builder: (context, state) {
        if (state is GetAllSubjectError) {
          return Center(child: Text(state.message));
        }
        if (state is GetAllSubjectSuccess) {
          subjectsList = state.subjectList;
        }
        return Expanded(
          child: RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () async {
              context.read<SubjectViewModel>().doAction(GetAllSubjects());
            },
            child: ListView.builder(
              itemCount: subjectsList?.length ?? 6,
              itemBuilder: (context, index) => SlideInLeft(
                duration: const Duration(milliseconds: 250),
                delay: Duration(milliseconds: index * 50),
                animate: true,
                child: Skeletonizer(
                  enabled: subjectsList?.isEmpty ?? true,
                  child: SubjectItemWidget(
                    subject: subjectsList?.isEmpty ?? true
                        ? SubjectEntity(
                            id: 'index',
                            name: 'HTML',
                            image:
                                'https://themeisle.com/blog/wp-content/uploads/2024/06/Online-Image-Optimizer-Test-Image-JPG-Version.jpeg',
                          )
                        : subjectsList![index],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
