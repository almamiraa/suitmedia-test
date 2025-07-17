import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';
import '../widgets/user_tile.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<User> users = [];
  int page = 1;
  int totalPages = 1;
  bool isLoading = false;
  bool isRefreshing = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchUsers();
    _scrollController.addListener(_scrollListener);
  }

  Future<void> fetchUsers({bool refresh = false}) async {
    if (isLoading) return;
    setState(() => isLoading = true);

    final currentPage = refresh ? 1 : page;
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$currentPage&per_page=10'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> userJson = data['data'];
      final List<User> fetchedUsers = userJson
          .map((u) => User.fromJson(u))
          .toList();

      setState(() {
        if (refresh) {
          users = fetchedUsers;
          page = 2;
        } else {
          users.addAll(fetchedUsers);
          page++;
        }
        totalPages = data['total_pages'];
      });
    }

    setState(() {
      isLoading = false;
      isRefreshing = false;
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !isLoading &&
        page <= totalPages) {
      fetchUsers();
    }
  }

  Future<void> _refresh() async {
    setState(() => isRefreshing = true);
    await fetchUsers(refresh: true);
  }

  void _selectUser(BuildContext context, User user) {
    Provider.of<UserProvider>(
      context,
      listen: false,
    ).setSelectedUser(user.fullName);
    Navigator.pop(context); // kembali ke SecondScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a user'),
        backgroundColor: const Color(0xFF2B637B),
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: users.isEmpty && !isLoading
            ? const Center(child: Text('No users available'))
            : ListView.builder(
                controller: _scrollController,
                itemCount: users.length + (isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < users.length) {
                    final user = users[index];
                    return UserTile(
                      user: user,
                      onTap: () => _selectUser(context, user),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ),
      ),
    );
  }
}
