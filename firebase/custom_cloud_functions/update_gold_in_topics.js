const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.updateGoldInTopics = functions
  .region("southamerica-east1")
  .runWith({
    memory: "1GB",
  })
  .https.onCall(async (data, context) => {
    // Write your code below!

    try {
      const db = admin.firestore();
      const topicsSnapshot = await db.collection("topics").get();

      const batch = db.batch();

      topicsSnapshot.forEach((doc) => {
        batch.update(doc.ref, { Gold: 0 });
      });

      await batch.commit();

      return {
        message:
          'Todos os documentos na coleção "topics" foram atualizados para Gold = 1.',
      };
    } catch (error) {
      console.error("Erro ao atualizar documentos:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Erro ao atualizar documentos",
      );
    }

    // Write your code above!
  });
