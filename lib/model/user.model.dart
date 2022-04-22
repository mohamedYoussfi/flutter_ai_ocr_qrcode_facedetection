class User {
  String login;
  String avatarUrl;
  double score;
  User(this.login, this.avatarUrl, this.score);
  User.fromJson(Map<String,dynamic> user) :
        login = user['login'],
        avatarUrl=user['avatar_url'],
        score=user['score'];
}