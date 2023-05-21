class Repo {
  int? totalCount;
  bool? incompleteResults;
  List<Items>? items;

  Repo({this.totalCount, this.incompleteResults, this.items});

  Repo.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['incomplete_results'] = this.incompleteResults;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  Owner? owner;
  bool? private;
  String? htmlUrl;
  String? description;
  bool? fork;
  String? url;
  String? createdAt;
  String? updatedAt;
  String? pushedAt;
  String? homepage;
  dynamic? size;
  dynamic? stargazersCount;
  dynamic? watchersCount;
  String? language;
  dynamic? forksCount;
  dynamic? openIssuesCount;
  String? masterBranch;
  String? defaultBranch;
  dynamic? score;
  String? archiveUrl;
  String? assigneesUrl;
  String? blobsUrl;
  String? branchesUrl;
  String? collaboratorsUrl;
  String? commentsUrl;
  String? commitsUrl;
  String? compareUrl;
  String? contentsUrl;
  String? contributorsUrl;
  String? deploymentsUrl;
  String? downloadsUrl;
  String? eventsUrl;
  String? forksUrl;
  String? gitCommitsUrl;
  String? gitRefsUrl;
  String? gitTagsUrl;
  String? gitUrl;
  String? issueCommentUrl;
  String? issueEventsUrl;
  String? issuesUrl;
  String? keysUrl;
  String? labelsUrl;
  String? languagesUrl;
  String? mergesUrl;
  String? milestonesUrl;
  String? notificationsUrl;
  String? pullsUrl;
  String? releasesUrl;
  String? sshUrl;
  String? stargazersUrl;
  String? statusesUrl;
  String? subscribersUrl;
  String? subscriptionUrl;
  String? tagsUrl;
  String? teamsUrl;
  String? treesUrl;
  String? cloneUrl;
  String? mirrorUrl;
  String? hooksUrl;
  String? svnUrl;
  dynamic? forks;
  int? openIssues;
  int? watchers;
  bool? hasIssues;
  bool? hasProjects;
  bool? hasPages;
  bool? hasWiki;
  bool? hasDownloads;
  bool? archived;
  bool? disabled;
  String? visibility;
  License? license;

  Items(
      {this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.owner,
      this.private,
      this.htmlUrl,
      this.description,
      this.fork,
      this.url,
      this.createdAt,
      this.updatedAt,
      this.pushedAt,
      this.homepage,
      this.size,
      this.stargazersCount,
      this.watchersCount,
      this.language,
      this.forksCount,
      this.openIssuesCount,
      this.masterBranch,
      this.defaultBranch,
      this.score,
      this.archiveUrl,
      this.assigneesUrl,
      this.blobsUrl,
      this.branchesUrl,
      this.collaboratorsUrl,
      this.commentsUrl,
      this.commitsUrl,
      this.compareUrl,
      this.contentsUrl,
      this.contributorsUrl,
      this.deploymentsUrl,
      this.downloadsUrl,
      this.eventsUrl,
      this.forksUrl,
      this.gitCommitsUrl,
      this.gitRefsUrl,
      this.gitTagsUrl,
      this.gitUrl,
      this.issueCommentUrl,
      this.issueEventsUrl,
      this.issuesUrl,
      this.keysUrl,
      this.labelsUrl,
      this.languagesUrl,
      this.mergesUrl,
      this.milestonesUrl,
      this.notificationsUrl,
      this.pullsUrl,
      this.releasesUrl,
      this.sshUrl,
      this.stargazersUrl,
      this.statusesUrl,
      this.subscribersUrl,
      this.subscriptionUrl,
      this.tagsUrl,
      this.teamsUrl,
      this.treesUrl,
      this.cloneUrl,
      this.mirrorUrl,
      this.hooksUrl,
      this.svnUrl,
      this.forks,
      this.openIssues,
      this.watchers,
      this.hasIssues,
      this.hasProjects,
      this.hasPages,
      this.hasWiki,
      this.hasDownloads,
      this.archived,
      this.disabled,
      this.visibility,
      this.license});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    private = json['private'];
    htmlUrl = json['html_url'];
    description = json['description'];
    fork = json['fork'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pushedAt = json['pushed_at'];
    homepage = json['homepage'];
    size = json['size'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    language = json['language'];
    forksCount = json['forks_count'];
    openIssuesCount = json['open_issues_count'];
    masterBranch = json['master_branch'];
    defaultBranch = json['default_branch'];
    score = json['score'];
    archiveUrl = json['archive_url'];
    assigneesUrl = json['assignees_url'];
    blobsUrl = json['blobs_url'];
    branchesUrl = json['branches_url'];
    collaboratorsUrl = json['collaborators_url'];
    commentsUrl = json['comments_url'];
    commitsUrl = json['commits_url'];
    compareUrl = json['compare_url'];
    contentsUrl = json['contents_url'];
    contributorsUrl = json['contributors_url'];
    deploymentsUrl = json['deployments_url'];
    downloadsUrl = json['downloads_url'];
    eventsUrl = json['events_url'];
    forksUrl = json['forks_url'];
    gitCommitsUrl = json['git_commits_url'];
    gitRefsUrl = json['git_refs_url'];
    gitTagsUrl = json['git_tags_url'];
    gitUrl = json['git_url'];
    issueCommentUrl = json['issue_comment_url'];
    issueEventsUrl = json['issue_events_url'];
    issuesUrl = json['issues_url'];
    keysUrl = json['keys_url'];
    labelsUrl = json['labels_url'];
    languagesUrl = json['languages_url'];
    mergesUrl = json['merges_url'];
    milestonesUrl = json['milestones_url'];
    notificationsUrl = json['notifications_url'];
    pullsUrl = json['pulls_url'];
    releasesUrl = json['releases_url'];
    sshUrl = json['ssh_url'];
    stargazersUrl = json['stargazers_url'];
    statusesUrl = json['statuses_url'];
    subscribersUrl = json['subscribers_url'];
    subscriptionUrl = json['subscription_url'];
    tagsUrl = json['tags_url'];
    teamsUrl = json['teams_url'];
    treesUrl = json['trees_url'];
    cloneUrl = json['clone_url'];
    mirrorUrl = json['mirror_url'];
    hooksUrl = json['hooks_url'];
    svnUrl = json['svn_url'];
    forks = json['forks'];
    openIssues = json['open_issues'];
    watchers = json['watchers'];
    hasIssues = json['has_issues'];
    hasProjects = json['has_projects'];
    hasPages = json['has_pages'];
    hasWiki = json['has_wiki'];
    hasDownloads = json['has_downloads'];
    archived = json['archived'];
    disabled = json['disabled'];
    visibility = json['visibility'];
    license =
        json['license'] != null ? new License.fromJson(json['license']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['private'] = this.private;
    data['html_url'] = this.htmlUrl;
    data['description'] = this.description;
    data['fork'] = this.fork;
    data['url'] = this.url;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['pushed_at'] = this.pushedAt;
    data['homepage'] = this.homepage;
    data['size'] = this.size;
    data['stargazers_count'] = this.stargazersCount;
    data['watchers_count'] = this.watchersCount;
    data['language'] = this.language;
    data['forks_count'] = this.forksCount;
    data['open_issues_count'] = this.openIssuesCount;
    data['master_branch'] = this.masterBranch;
    data['default_branch'] = this.defaultBranch;
    data['score'] = this.score;
    data['archive_url'] = this.archiveUrl;
    data['assignees_url'] = this.assigneesUrl;
    data['blobs_url'] = this.blobsUrl;
    data['branches_url'] = this.branchesUrl;
    data['collaborators_url'] = this.collaboratorsUrl;
    data['comments_url'] = this.commentsUrl;
    data['commits_url'] = this.commitsUrl;
    data['compare_url'] = this.compareUrl;
    data['contents_url'] = this.contentsUrl;
    data['contributors_url'] = this.contributorsUrl;
    data['deployments_url'] = this.deploymentsUrl;
    data['downloads_url'] = this.downloadsUrl;
    data['events_url'] = this.eventsUrl;
    data['forks_url'] = this.forksUrl;
    data['git_commits_url'] = this.gitCommitsUrl;
    data['git_refs_url'] = this.gitRefsUrl;
    data['git_tags_url'] = this.gitTagsUrl;
    data['git_url'] = this.gitUrl;
    data['issue_comment_url'] = this.issueCommentUrl;
    data['issue_events_url'] = this.issueEventsUrl;
    data['issues_url'] = this.issuesUrl;
    data['keys_url'] = this.keysUrl;
    data['labels_url'] = this.labelsUrl;
    data['languages_url'] = this.languagesUrl;
    data['merges_url'] = this.mergesUrl;
    data['milestones_url'] = this.milestonesUrl;
    data['notifications_url'] = this.notificationsUrl;
    data['pulls_url'] = this.pullsUrl;
    data['releases_url'] = this.releasesUrl;
    data['ssh_url'] = this.sshUrl;
    data['stargazers_url'] = this.stargazersUrl;
    data['statuses_url'] = this.statusesUrl;
    data['subscribers_url'] = this.subscribersUrl;
    data['subscription_url'] = this.subscriptionUrl;
    data['tags_url'] = this.tagsUrl;
    data['teams_url'] = this.teamsUrl;
    data['trees_url'] = this.treesUrl;
    data['clone_url'] = this.cloneUrl;
    data['mirror_url'] = this.mirrorUrl;
    data['hooks_url'] = this.hooksUrl;
    data['svn_url'] = this.svnUrl;
    data['forks'] = this.forks;
    data['open_issues'] = this.openIssues;
    data['watchers'] = this.watchers;
    data['has_issues'] = this.hasIssues;
    data['has_projects'] = this.hasProjects;
    data['has_pages'] = this.hasPages;
    data['has_wiki'] = this.hasWiki;
    data['has_downloads'] = this.hasDownloads;
    data['archived'] = this.archived;
    data['disabled'] = this.disabled;
    data['visibility'] = this.visibility;
    if (this.license != null) {
      data['license'] = this.license!.toJson();
    }
    return data;
  }
}

class Owner {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? receivedEventsUrl;
  String? type;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  bool? siteAdmin;

  Owner(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.receivedEventsUrl,
      this.type,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.siteAdmin});

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    siteAdmin = json['site_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['avatar_url'] = this.avatarUrl;
    data['gravatar_id'] = this.gravatarId;
    data['url'] = this.url;
    data['received_events_url'] = this.receivedEventsUrl;
    data['type'] = this.type;
    data['html_url'] = this.htmlUrl;
    data['followers_url'] = this.followersUrl;
    data['following_url'] = this.followingUrl;
    data['gists_url'] = this.gistsUrl;
    data['starred_url'] = this.starredUrl;
    data['subscriptions_url'] = this.subscriptionsUrl;
    data['organizations_url'] = this.organizationsUrl;
    data['repos_url'] = this.reposUrl;
    data['events_url'] = this.eventsUrl;
    data['site_admin'] = this.siteAdmin;
    return data;
  }
}

class License {
  String? key;
  String? name;
  String? url;
  String? spdxId;
  String? nodeId;
  String? htmlUrl;

  License(
      {this.key, this.name, this.url, this.spdxId, this.nodeId, this.htmlUrl});

  License.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    url = json['url'];
    spdxId = json['spdx_id'];
    nodeId = json['node_id'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['name'] = this.name;
    data['url'] = this.url;
    data['spdx_id'] = this.spdxId;
    data['node_id'] = this.nodeId;
    data['html_url'] = this.htmlUrl;
    return data;
  }
}
