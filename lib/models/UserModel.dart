class UserModel {
  String key;
  String userId;
  String fName;
  String lName;
  String email;
  String username;
  String homeTown;
  String currentCity;
  String dateofbirth;
  String displayName;
  String webSite; //urisn hunii too
  String profilePic;
  String createdAt;
  String facebookUserID;
  String inviter; //ooriig ni urisn hun
  bool isVerified; //irgenii batalgaajuulalt ilgeesn eseh
  bool emailisVerified;
  bool facebookisVerified;
  bool registerisVerified; // irgenii batalgaajuulalt batlagdsan eseh
  String fcmToken;
  List<String> rewardList;
  List<String> adList;
  String wallet;
  UserModel({
     this.key,
     this.userId,
     this.fName,
     this.lName,
     this.email,
     this.username,
     this.homeTown,
     this.currentCity,
     this.dateofbirth,
     this.displayName,
     this.webSite,
     this.profilePic,
     this.createdAt,
     this.facebookUserID,
     this.inviter,
     this.isVerified,
     this.emailisVerified,
     this.facebookisVerified,
     this.registerisVerified,
     this.fcmToken,
     this.wallet,
     this.rewardList,
     this.adList,
    // required this.notificationList,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    if (rewardList == null) {
      rewardList = [];
    }
    key = map['key'];
    userId = map['userId'];
    fName = map['fName'];
    lName = map['lName'];
    email = map['email'];
    username = map['username'];
    homeTown = map['homeTown'];
    currentCity = map['currentCity'];
    dateofbirth = map['dateofbirth'];
    displayName = map['displayName'];
    webSite = map['webSite'];
    profilePic = map['profilePic'];
    createdAt = map['createdAt'];
    facebookUserID = map['facebookUserID'];
    inviter = map['inviter'];
    isVerified = map['isVerified'] ?? false;
    emailisVerified = map['emailisVerified'] ?? false;
    facebookisVerified = map['facebookisVerified'] ?? false;
    registerisVerified = map['registerisVerified'] ?? false;
    fcmToken = map['fcmToken'];
    wallet = map['wallet'];

    if (map['rewardList'] != null) {
      rewardList = List<String>.empty(growable: true);
      map['rewardList'].forEach((value) {
        if ((rewardList.length == 0 || rewardList.any((x) => x != value)) &&
            value.isNotEmpty) {
          rewardList.add(value);
        }
      });
    }
    if (map['adList'] != null) {
      adList = List<String>.empty(growable: true);
      map['adList'].forEach((value) {
        if ((adList.length == 0 || adList.any((x) => x != value)) &&
            value.isNotEmpty) {
          adList.add(value);
        }
      });
    }
  }

  toJson() {
    return {
      'key': key,
      "userId": userId,
      "fName": fName,
      "lName": lName,
      "email": email,
      "username": username,
      "homeTown": homeTown,
      "currentCity": currentCity,
      "dateofbirth": dateofbirth,
      'displayName': displayName,
      'webSite': webSite,
      'profilePic': profilePic,
      'createdAt': createdAt,
      'facebookUserID': facebookUserID,
      'inviter': inviter,
      'isVerified': isVerified,
      'emailisVerified': emailisVerified,
      'facebookisVerified': facebookisVerified,
      'registerisVerified': registerisVerified,
      'fcmToken': fcmToken,
      'rewardList': rewardList,
      'adList': adList,
      'wallet': wallet
    };
  }

  UserModel copyWith({
     String key,
     String userId,
     String fName,
     String lName,
     String email,
     String username,
     String homeTown,
     String currentCity,
     String dateofbirth,
     String contact,
     String bio,
     String displayName,
     String webSite,
     String profilePic,
     String coverPic,
     String createdAt,
     String facebookUserID,
     String inviter,
     bool isVerified,
     bool emailisVerified,
     bool facebookisVerified,
     bool registerisVerified,
     bool phoneisVerified,
     int status,
     int followers,
     int following,
     String fcmToken,
     String wallet,
     List<String> followersList,
     List<String> followingList,
     List<String> rewardList,
     List<String> adList,
  }) {
    return UserModel(
        key: key,
        userId: userId,
        fName: fName,
        lName: lName,
        email: email,
        username: username,
        homeTown: homeTown,
        currentCity: currentCity,
        dateofbirth: dateofbirth,
        displayName: displayName,
        webSite: webSite,
        profilePic: profilePic,
        createdAt: createdAt,
        facebookUserID: facebookUserID,
        inviter: inviter,
        isVerified: isVerified,
        emailisVerified: emailisVerified,
        facebookisVerified: facebookisVerified,
        registerisVerified: registerisVerified,
        fcmToken: fcmToken,
        rewardList: rewardList,
        adList: adList,
        wallet: wallet);
  }

  String getRewardNum() {
    return this.rewardList.length.toString();
  }
}
