import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/domain/entity/blog_entity.dart';
import 'package:flutter_application_1/src/presentation/views/blog/bloc/blog_bloc.dart';
import 'package:flutter_application_1/src/presentation/views/blog/detail_widget.dart';
import 'package:flutter_application_1/src/presentation/widgets/card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

class BlogScreen extends StatelessWidget {
  final BlogBloc bloc;
  BlogScreen({Key? key, required this.bloc}) : super(key: key) {
    bloc.add(GetBlog());
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchInput = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Blog',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w800),
        ),
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<BlogBloc, BlogState>(
          builder: (context, state) {
            List<BlogEntity> blogs = [];
            List<BlogEntity> searchBlogs = [];
            if (state is BlogLoaded) {
              blogs = state.blogs;
              searchBlogs = blogs;
            }
            if (state is SearchBlogLoaded) {
              searchBlogs = state.blogs;
              blogs = state.allBlogs;
            }
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: searchInput,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.amber,
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (value) {
                      bloc.add(SearchBlog(searchValue: value, allBlogs: blogs));
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.amber, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.amber, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.amber,
                      hintText: "Search by tittle",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 500,
                          ),
                          child: gridBootstrap(
                              blogs: searchBlogs, context: context))),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget gridBootstrap(
      {required List<BlogEntity> blogs, required BuildContext context}) {
    return BootstrapContainer(fluid: true, children: [
      ...List.generate(
        blogs.length,
        (index) => BootstrapCol(
          sizes: 'col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3',
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailWidget(
                      blogEntity: blogs[index],
                    ),
                  ),
                );
              },
              child: ScoreAndResultScoreCard(
                blog: blogs[index],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
