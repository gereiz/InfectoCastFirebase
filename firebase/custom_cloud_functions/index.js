const admin = require("firebase-admin/app");
admin.initializeApp();

const updateUserStatusOnEvent = require("./update_user_status_on_event.js");
exports.updateUserStatusOnEvent =
  updateUserStatusOnEvent.updateUserStatusOnEvent;
const updateGoldInTopics = require("./update_gold_in_topics.js");
exports.updateGoldInTopics = updateGoldInTopics.updateGoldInTopics;
