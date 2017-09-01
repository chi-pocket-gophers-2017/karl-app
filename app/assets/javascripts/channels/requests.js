App.messages = App.cable.subscriptions.create('RequestsChannel', {
  received: function(data) {
    console.log(data)
    return $('#requests').append(data.request);
  },

});