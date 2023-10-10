import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_template/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_bloc_app_template/bloc/theme/app_theme.dart';
import 'package:flutter_bloc_app_template/generated/l10n.dart';
import 'package:flutter_bloc_app_template/index.dart';
import 'package:flutter_bloc_app_template/utils/string_utils.dart';

import 'settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NavigationService(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).settingsTitle),
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Builder(
                builder: (context) {
                  final navigator = NavigationService.of(context);
                  final User userData = context.select(
                    (AuthenticationBloc bloc) => bloc.state.user,
                  );
                  return Column(
                    children: [
                      const SizedBox(height: 40),
                      Stack(
                            children: [
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100), child: ItemAvatar(
                            imageUrl: userData.photo.toString(),
                            shortenUserName: userData.fullname!.getFormattedName(),
                          ),),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: ThemeData().primaryColor),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text('${userData.fullname}',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
    
                          /// -- BUTTON
                          SizedBox(
                            width: 200,
                            child: FilledButton(onPressed: () async => await navigator.navigateTo(Routes.updateProfile), child: const Text('Chỉnh sửa thông tin')),
                          ),
                          const SizedBox(height: 10),
                          Divider(color: ThemeData().hintColor)
                    ],
                  );
                }
              ),
            ),
            
            BlocConsumer<ThemeCubit, AppTheme>(
              builder: (context, state) => SettingCell.icon(
                icon: AppIcons.settingsTheme,
                title: S.of(context).themeTitle,
                expandable: true,
                onTap: () async => showBottomSheetDialog(
                  context: context,
                  padding: EdgeInsets.zero,
                  children: [
                    ThemeDialogCell<AppTheme>(
                      title: S.of(context).darkThemeTitle,
                      groupValue: state,
                      value: AppTheme.dark,
                      onChanged: (value) => updateTheme(context, value),
                    ),
                    ThemeDialogCell<AppTheme>(
                      title: S.of(context).lightThemeTitle,
                      groupValue: state,
                      value: AppTheme.light,
                      onChanged: (value) => updateTheme(context, value),
                    ),
                    ThemeDialogCell<AppTheme>(
                      title: S.of(context).yellowThemeTitle,
                      groupValue: state,
                      value: AppTheme.yellow,
                      onChanged: (value) => updateTheme(context, value),
                    ),
                    ThemeDialogCell<AppTheme>(
                      title: S.of(context).systemThemeTitle,
                      groupValue: state,
                      value: AppTheme.system,
                      onChanged: (value) => updateTheme(context, value),
                    ),
                    ThemeDialogCell<AppTheme>(
                      title: S.of(context).experimentalThemeTitle,
                      groupValue: state,
                      value: AppTheme.experimental,
                      onChanged: (value) => updateTheme(context, value),
                    ),
                  ],
                ),
              ),
              listener: (context, state) => Navigator.of(context).pop(),
            ),
            SettingCell.icon(
                icon: AppIcons.logout,
                title: 'Logout',
                onTap: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested());
                },
              ),
          ],
        ),
      ),
    );
  }

  void updateTheme(BuildContext context, AppTheme value) =>
      context.read<ThemeCubit>().updateTheme(value);
}
