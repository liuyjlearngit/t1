function getToken() {
  return window.localStorage.getItem('token');
}

function getUsername() {
  return window.localStorage.getItem('username');
}

function setToken(token) {
  window.localStorage.setItem('token', token);
}

function setUsername(username) {
  window.localStorage.setItem('username', username);
}

(function () {
  var token = getToken();
  if (!token) {
    window.location.href = WEB_ROOT + "/login"
  }
  $('#username').text(getUsername())

  $('#logout').click(function () {
    setToken('');
    setUsername('');
    window.location.href = WEB_ROOT + "/login"
  });
})();

