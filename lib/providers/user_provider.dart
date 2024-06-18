import 'package:car_spotter/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.initialUser);

  void setUser(User newUser) {
    state = newUser;
  }

  void acceptFriendRequest(User newFriendRequest) {
    final updatedFriends = [...state.friends, newFriendRequest];
    final updatedFriendRequests = state.friendRequests
        .where((request) => request.id != newFriendRequest.id)
        .toList();
    state = state.copyWith(
        friends: updatedFriends, friendRequests: updatedFriendRequests);
  }

  void removeFriendRequest(User newFriendRequest) {
    final updatedFriendRequests = state.friendRequests
        .where((reuqest) => reuqest.id != newFriendRequest.id)
        .toList();
    state = state.copyWith(friendRequests: updatedFriendRequests);
  }
}

final userNotifierProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(User(username: "null", firstName: "null", lastName: "null", country: "null"));
});