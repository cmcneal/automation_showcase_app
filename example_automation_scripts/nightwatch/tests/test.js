module.exports = {
  'Verify title' : function (browser) {
    browser
      .url('https://automation-showcase-app.herokuapp.com')
      .waitForElementVisible('body', 1000)
      .assert.title('Test App')
  },

  'Valid user alpha can log in' : function (browser) {
    browser
      .clearValue('#username')
      .setValue('#username', 'alpha')
      .click('#login')
      .pause(1000)
      .assert.containsText('#message', 'You are now signed')
      .click('#logout')
  },

  'Valid user test can log in' : function (browser) {
    browser
      .clearValue('#username')
      .setValue('#username', ' test ')
      .click('#login')
      .pause(1000)
      .assert.containsText('#message', 'You are now signed')
      .click('#logout')
  },

  'Invalid user error can not log in' : function (browser) {
    browser
      .setValue('#username', 'error')
      .click('#login')
      .pause(1000)
      .assert.containsText('#message', 'Username was incorrect.')
      .click('#logout')
      .end();
  }
};
