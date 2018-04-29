var aws = require('aws-sdk');
var ses = new aws.SES({region: 'us-east-1'});

exports.handler = function(event, context) {
  console.log("Incoming: ", event);

  var eParams = {
    Destination: {
      // TODO: Parse the to address from the event
      ToAddresses: ['contact@euterpesolutions.com']
    },
    Message: {
      Body: {
        Text: {
          Data: "Hey! Whats up boi???"
        }
      },
      Subject: {
        Data: "Email Test"
      }
    },
    Source: "contact@euterpesolutions.com"
  };


  console.log('===SENDING EMAIL===');

  var email = ses.sendEmail(eParams, function(err, data) {
    if(err) console.log(err);
    else {
      console.log("===EMAIL SENT===");
      console.log(data);

      context.succeed(event);
    }
  });
};
