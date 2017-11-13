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
* [Follow these instructions](http://webdriver.io/guide.html)

## Running the test
* Ensure that the sample app is running
* Start the selenium server
** Open a command prompt in `_selenium_server`
** Run `java -jar selenium-server-standalone-3.7.1.jar`
* Modify `wdio.conf.js`
** If you are running against the app locally, us the *Local* **baseUrl**
** If you are running against the app remotely, us the *Heroku* **baseUrl**
* Open a command prompt in this folder
** Run `wdio wdio.conf.js`

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
