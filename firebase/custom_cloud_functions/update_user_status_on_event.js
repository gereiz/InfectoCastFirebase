const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.updateUserStatusOnEvent = functions.firestore
  .document("events/{eventId}")
  .onCreate(async (snap, context) => {
    const newValue = snap.data();
    const appUserId = newValue.app_user_id;
    const type = newValue.type;

    try {
      const userRef = admin.firestore().collection("users").doc(appUserId);

      // Atualiza os campos baseado no tipo do evento
      if (["RENEWAL", "INITICAL_PURCHASE", "PRODUCT_CHANGE"].includes(type)) {
        await userRef.update({
          paidMember: true,
          Premium: 1,
        });
      } else if (["CANCELATION", "EXPIRATION"].includes(type)) {
        await userRef.update({
          paidMember: false,
          Premium: 0,
        });
      }
    } catch (error) {
      console.error("Error updating user status:", error);
    }
  });
