App.messages = App.cable.subscriptions.create('RequestsChannel', {
  received: function(data) {

    return $('.bullshit-div').append('<div class="row"><div class="col s12 m6"><div class="card orange darken-1"><div class="card-content white-text"><div class="row"><div class="col 4"></div><div class="col 6 offset-s2"><h1 class="card-title center">' + data.request.name +'</h1></div></div></div><div class="card-action white center"><h6> Request made at' + data.request.created_at + '</h6></div></div></div></div></div>');
  },

});
