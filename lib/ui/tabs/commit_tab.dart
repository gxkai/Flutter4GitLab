import 'package:F4Lab/api.dart' show ApiEndPoint;
import 'package:F4Lab/model/commit.dart';
import 'package:F4Lab/ui/page/PageCommitDiff.dart';
import 'package:F4Lab/util/date_util.dart';
import 'package:F4Lab/widget/comm_ListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommitTab extends CommListWidget {
  final int projectId;
  final int mrIId;

  CommitTab(this.projectId, this.mrIId);

  @override
  State<StatefulWidget> createState() => _CommitState(projectId, mrIId);
}

class _CommitState extends CommListState {
  final int projectId;

  _CommitState(this.projectId, int mrIId)
      : super(ApiEndPoint.mergeRequestCommit(projectId, mrIId));

  @override
  Widget childBuild(BuildContext context, int index) {
    final Commit commit = Commit.fromJson(data[index]);
    return Card(
      child: ListTile(
        title: Text(commit.title),
        subtitle: Text(datetime2String(commit.createdAt)),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PageCommitDiff(projectId, commit)));
        },
      ),
    );
  }
}
