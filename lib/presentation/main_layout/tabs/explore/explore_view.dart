import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';
import 'package:online_exam/core/widgets/title_of_view.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/view_models/subject_contract.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/view_models/subject_states.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/view_models/subject_view_model.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/widgets/subject_list_view.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  late SubjectViewModel viewModel;
  @override
  void initState() {
    viewModel = getIt<SubjectViewModel>();
    viewModel.doAction(GetAllSubjectsAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (context) => viewModel,
          child: BlocBuilder<SubjectViewModel, SubjectStates>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleOfView(
                    title: AppStrings.survey,
                    style: TextStyles.font20Black500Weight
                        .copyWith(color: AppColors.primary),
                  ),
                  verticalSpace(16),
                  AppTextFormField(
                    onChange: (value) {
                      viewModel.doAction(SerchSubjectsAction(value));
                    },
                    prefixIcon: Icons.search,
                    labelText: AppStrings.search,
                    borderRadius: 20,
                  ),
                  verticalSpace(25),
                  Text(
                    AppStrings.browseBySubject,
                    style: TextStyles.font18Black500Weight,
                  ),
                   SubjectListView(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
