var assert = require('assert');
describe('Automation Showcase App', function() {
  it('should have a title', function () {
      browser.url('/');
      var title = browser.getTitle();
      assert.equal(title, 'Test App');
  });
  it('should not allow a login for invalid users', function() {
    browser.url('/');
    browser.clearElement('#username');
    browser.setValue('#username','error');
    browser.click('#login');
    var message = browser.getText('#message');
    assert.equal(message, 'Username was incorrect.');
  });
  it('should allow a login for valid user test', function() {
    browser.url('/');
    browser.clearElement('#username');
    browser.setValue('#username',' test ');
    browser.click('#login');
    var message = browser.getText('#message');
    assert.equal(message, 'You are now signed in test !');
    browser.click('#logout');
    var exists = browser.isExisting('#username');
    assert.equal(exists, true);
  });
  it('should allow a login for valid user alpha', function() {
    browser.url('/');
    browser.clearElement('#username');
    browser.setValue('#username','alpha');
    browser.click('#login');
    var message = browser.getText('#message');
    assert.equal(message, 'You are now signed in alpha !');
    browser.click('#logout');
    var exists = browser.isExisting('#username');
    assert.equal(exists, true);
  });
});
