# Webdriver.io
> WebDriver bindings for Node.js

|          |                                  |
|----------|----------------------------------|
|Website   | http://webdriver.io              |
|Language  | JavaScript (Node.js)             |
|Drivers   | webdriver                        |
|Framework | Jasmine                          |
|          | Mocha                            |
|          | Cucmber                          |
|          | ...                              |

## Installation
*

## Running the test
*

## Config/folder structure
```
.
project
|   readme.md
|   wdio.conf.js
|
+---errorShots
|
+---node_modules
|
\---test
    \---specs
            test.js
```
*Note* The `node_modules` folder contains all of the installation files, not listed here.

## Example
`wdio.conf.js`
```javascript
exports.config = {
    specs: [
        './test/specs/**/*.js'
    ],
    exclude: [
    ],
    maxInstances: 10,
    capabilities: [{
        maxInstances: 5,
        browserName: 'chrome'
    }],
    sync: true,
    logLevel: 'silent',
    coloredLogs: true,
    bail: 0,
    screenshotPath: './errorShots/',
    baseUrl: 'https://automation-showcase-app.herokuapp.com',
    waitforTimeout: 10000,
    connectionRetryTimeout: 90000,
    connectionRetryCount: 3,
    framework: 'mocha',
    mochaOpts: {
        ui: 'bdd'
    },
};
```

`testc.js`
```javascript
var assert = require('assert');
describe('Automation Showcase App', function() {
  it('should have a title', function () {
      browser.url('https://automation-showcase-app.herokuapp.com');
      var title = browser.getTitle();
      assert.equal(title, 'Test App');
  });
  it('should not allow a login for invalid users', function() {
    browser.url('https://automation-showcase-app.herokuapp.com/');
    browser.clearElement('#username');
    browser.setValue('#username','error');
    browser.click('#login');
    var message = browser.getText('#message');
    assert.equal(message, 'Username was incorrect.');
  });
  it('should allow a login for valid user test', function() {
    browser.url('https://automation-showcase-app.herokuapp.com/');
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
    browser.url('https://automation-showcase-app.herokuapp.com/');
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
```
