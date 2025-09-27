import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/theme_cubit.dart';
import '../../../core/utils/image_utils.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../cubits/users/users_cubit.dart';
import '../../cubits/users/users_state.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, theme) {
              final themeCubit = context.read<ThemeCubit>();
              return IconButton(
                icon: Icon(
                  themeCubit.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: () => themeCubit.toggleTheme(),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'profile') {
                Navigator.pushNamed(context, '/profile');
              } else if (value == 'logout') {
                context.read<AuthCubit>().logout();
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 8),
                    Text('Profile'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  SizedBox(height: 16.h),
                  Text(
                    'Loading community members...',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }

          if (state is UsersLoaded) {
            if (state.users.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.people_outline, size: 64.sp, color: Colors.grey),
                    SizedBox(height: 16.h),
                    Text(
                      'No community members yet',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(color: Colors.grey),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Be the first to complete your profile!',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: const Text('Complete Profile'),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<UsersCubit>().loadUsers();
              },
              child: ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.w),
                      leading: ImageUtils.buildProfileImage(
                        imageUrl: user['profilePicture'],
                        size: 60.r,
                      ),
                      title: Text(
                        user['name'] ?? 'Anonymous User',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: user['bio'] != null && user['bio'].isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.only(top: 4.h),
                              child: Text(
                                user['bio'],
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : null,
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                        size: 20.sp,
                      ),
                      onTap: () {
                        // TODO: Navigate to user detail page
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Viewing ${user['name'] ?? 'User'} profile',
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          }

          if (state is UsersFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64.sp, color: Colors.red),
                  SizedBox(height: 16.h),
                  Text(
                    'Oops! Something went wrong',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    state.error,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UsersCubit>().loadUsers();
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
        child: const Icon(Icons.person),
      ),
    );
  }
}
