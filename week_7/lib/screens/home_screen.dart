import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../constants/app_constants.dart';
import '../providers/theme_provider.dart';
import '../theme/app_theme.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool _isLoading = false;
  final _searchController = TextEditingController();
  final _taskController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  List<Map<String, dynamic>> _filteredItems = [];
  String _selectedCategory = 'All';
  final List<String> _categories = [
    'All',
    'Work',
    'Personal',
    'Important',
    'Urgent',
  ];

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(AppConstants.gridItems);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _taskController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _refreshData() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Data refreshed successfully!'),
          backgroundColor: AppTheme.secondaryColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = List.from(AppConstants.gridItems);
      } else {
        _filteredItems = AppConstants.gridItems
            .where(
              (item) => item['title'].toString().toLowerCase().contains(
                query.toLowerCase(),
              ),
            )
            .toList();
      }
    });
  }

  void _filterByCategory(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'All') {
        _filteredItems = List.from(AppConstants.gridItems);
      } else {
        _filteredItems = AppConstants.gridItems
            .where((item) => item['category'] == category)
            .toList();
      }
    });
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Add New Task',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _taskController,
                decoration: InputDecoration(
                  labelText: 'Task Name',
                  prefixIcon: const Icon(Icons.task),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task name';
                  }
                  if (value.length < 3) {
                    return 'Task name must be at least 3 characters';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _taskController.clear();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Task "${_taskController.text}" added successfully!',
                    ),
                    backgroundColor: AppTheme.secondaryColor,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                _taskController.clear();
              }
            },
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          child: Text(
            'Dashboard Pro',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        backgroundColor: isDark
            ? AppTheme.primaryColor.withValues(alpha: 0.8)
            : AppTheme.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.primaryColor,
                AppTheme.primaryColor.withValues(alpha: 0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _refreshData),
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: AppTheme.primaryColor,
                    strokeWidth: 3,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Loading amazing content...',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () async => _refreshData(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome Card with Stats
                    FadeInDown(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.primaryColor.withValues(alpha: 0.1),
                              AppTheme.secondaryColor.withValues(alpha: 0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: AppTheme.primaryColor.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back! 👋',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: isDark
                                    ? Colors.white
                                    : AppTheme.textPrimaryColor,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'You have 12 tasks pending today',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: isDark
                                    ? Colors.white70
                                    : AppTheme.textSecondaryColor,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildStatCard(
                                  'Tasks',
                                  '24',
                                  Icons.task_alt,
                                  AppTheme.primaryColor,
                                ),
                                _buildStatCard(
                                  'Completed',
                                  '18',
                                  Icons.check_circle,
                                  AppTheme.secondaryColor,
                                ),
                                _buildStatCard(
                                  'Pending',
                                  '6',
                                  Icons.pending,
                                  AppTheme.accentColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Search Bar
                    FadeInLeft(
                      delay: const Duration(milliseconds: 200),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: _filterItems,
                          decoration: InputDecoration(
                            hintText: 'Search tasks, projects...',
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppTheme.primaryColor,
                            ),
                            suffixIcon: _searchController.text.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      _searchController.clear();
                                      _filterItems('');
                                    },
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: isDark ? Colors.grey[800] : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Category Filter
                    FadeInRight(
                      delay: const Duration(milliseconds: 300),
                      child: SizedBox(
                        height: 50.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _categories.length,
                          itemBuilder: (context, index) {
                            final category = _categories[index];
                            final isSelected = _selectedCategory == category;
                            return Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: FilterChip(
                                label: Text(category),
                                selected: isSelected,
                                onSelected: (_) => _filterByCategory(category),
                                backgroundColor: isDark
                                    ? Colors.grey[800]
                                    : Colors.grey[200],
                                selectedColor: AppTheme.primaryColor.withValues(
                                  alpha: 0.2,
                                ),
                                checkmarkColor: AppTheme.primaryColor,
                                labelStyle: TextStyle(
                                  color: isSelected
                                      ? AppTheme.primaryColor
                                      : null,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Quick Actions Grid
                    FadeIn(
                      delay: const Duration(milliseconds: 400),
                      child: Text(
                        'Quick Actions',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? Colors.white
                              : AppTheme.textPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        children: _filteredItems.asMap().entries.map((entry) {
                          final index = entry.key;
                          final item = entry.value;
                          return FadeInUp(
                            delay: Duration(milliseconds: 100 * index),
                            child: GestureDetector(
                              onTap: () {
                                HapticFeedback.lightImpact();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${item['title']} tapped!'),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                              child: Container(
                                height: index.isEven ? 120.h : 140.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      (item['color'] as Color).withValues(
                                        alpha: 0.8,
                                      ),
                                      item['color'] as Color,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: (item['color'] as Color)
                                          .withValues(alpha: 0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        item['icon'],
                                        size: 32.sp,
                                        color: Colors.white,
                                      ),
                                      const Spacer(),
                                      Text(
                                        item['title'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${(index + 1) * 3} items',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // Team Members Section
                    FadeIn(
                      delay: const Duration(milliseconds: 600),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Team Members',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? Colors.white
                                  : AppTheme.textPrimaryColor,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View All',
                              style: TextStyle(color: AppTheme.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    FadeInUp(
                      delay: const Duration(milliseconds: 700),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: isDark ? Colors.grey[850] : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: AppConstants.teamMembers.length,
                          separatorBuilder: (context, index) => Divider(
                            color: isDark ? Colors.grey[700] : Colors.grey[300],
                          ),
                          itemBuilder: (context, index) {
                            final item = AppConstants.teamMembers[index];
                            return ListTile(
                              contentPadding: EdgeInsets.all(16.w),
                              leading: Hero(
                                tag: 'avatar_$index',
                                child: CircleAvatar(
                                  radius: 25.r,
                                  backgroundColor: AppTheme.primaryColor
                                      .withValues(alpha: 0.1),
                                  child: Text(
                                    item['image']!,
                                    style: TextStyle(fontSize: 20.sp),
                                  ),
                                ),
                              ),
                              title: Text(
                                item['name']!,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isDark
                                      ? Colors.white
                                      : AppTheme.textPrimaryColor,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['position']!,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: isDark
                                          ? Colors.white70
                                          : AppTheme.textSecondaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Container(
                                        width: 8.w,
                                        height: 8.h,
                                        decoration: BoxDecoration(
                                          color:
                                              AppConstants
                                                  .statusColors[item['status']] ??
                                              Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: 6.w),
                                      Text(
                                        item['status']!,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color:
                                              AppConstants
                                                  .statusColors[item['status']] ??
                                              Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 16.sp,
                                color: isDark
                                    ? Colors.white54
                                    : Colors.grey[400],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) => DetailScreen(
                                          name: item['name']!,
                                          position: item['position']!,
                                          image: item['image']!,
                                          email: item['email']!,
                                          status: item['status']!,
                                        ),
                                    transitionsBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                          child,
                                        ) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: ScaleTransition(
        scale: _scaleAnimation,
        child: FloatingActionButton.extended(
          onPressed: _showAddTaskDialog,
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add),
          label: const Text('Add Task'),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24.sp),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12.sp, color: color),
          ),
        ],
      ),
    );
  }
}
