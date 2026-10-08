class MeetingRequest {
  String requestId;
  String senderId;
  String recipientId;
  String status;

  // constructor
  MeetingRequest({required this.requestId, required this.senderId, required this.recipientId, this.status = 'pending'});

  void create() {
    // TODO: Implement meeting request creation
  }
  
  void accept() {
    // TODO: Implement meeting request acceptance
  }
  
  void reject() {
    // TODO: Implement meeting request rejection
  }
}
