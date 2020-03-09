import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp();

export const publishNews = functions.firestore
  .document('news/{newsId}')
  .onCreate(async snapshot => {
    const news = snapshot.data();

    const payload: admin.messaging.MessagingPayload = {
      notification: {
        title: 'News',
        body: `${news.name} is ready for adoption`,
        icon: 'your-icon-url',
        click_action: 'FLUTTER_NOTIFICATION_CLICK' // required only for onResume or onLaunch callbacks
      }
    };

    return fcm.sendToTopic(`${news.name}`, payload);
  });

exports.scheduledFunction = functions.pubsub
  .schedule('every 30 minutes')
  .onRun((context) => {
    console.log('This will be run every 30 minutes!');
    return null;
  });