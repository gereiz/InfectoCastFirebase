const admin = require("firebase-admin/app");
admin.initializeApp();

const updateUserStatusOnEvent = require("./update_user_status_on_event.js");
exports.updateUserStatusOnEvent =
  updateUserStatusOnEvent.updateUserStatusOnEvent;
