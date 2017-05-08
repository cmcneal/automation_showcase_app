# Nightwatch.js
> an easy to use Node.js based End-to-End (E2E) testing solution for browser based apps and websites. It uses the powerful W3C WebDriver API to perform commands and assertions on DOM elements.

|         |     |
|---------|-----|
|Website  | http://nightwatchjs.org/ |
|Language | JavaScript (Node.js)     |
|Drivers  | Selenium/WebDriver       |

## Installation
*

## Config/folder structure
```
.
project
|   nightwatch.json
|
+---reports
|
\---tests
        test.js
```

## Example
`nightwatch.json`
```json
{
  "src_folders" : ["tests"],
  "output_folder" : "reports",
  "custom_commands_path" : "",
  "custom_assertions_path" : "",
  "page_objects_path" : "",
  "globals_path" : "",

  "selenium" : {
    "start_process" : true,
    "cli_args" : {
      "webdriver.chrome.driver" : "./Users/clancey/dev/src/vindex/path/chromedriver.exe"
    }
  },

  "test_settings" : {
    "default" : {
      "selenium_port"  : 9515,
      "selenium_host"  : "localhost",
      "default_path_prefix" : "",

      "desiredCapabilities": {
        "browserName": "chrome",
        "chromeOptions" : {
          "args" : ["--no-sandbox"]
        },
        "acceptSslCerts": true
      }
    }
  }
}

```

`test.js`
```javascript
module.exports = {
  'Verify title' : function (browser) {
    browser
      .url('https://automation-showcase-app.herokuapp.com')
      .waitForElementVisible('body', 1000)
      .assert.title('Test App');
  },

  'Valid user alpha can log in' : function (browser) {
    browser
      .clearValue('#username')
      .setValue('#username', 'alpha')
      .click('#login')
      .pause(1000)
      .assert.containsText('#message', 'You are now signed')
      .click('#logout');
  },

  'Valid user test can log in' : function (browser) {
    browser
      .clearValue('#username')
      .setValue('#username', ' test ')
      .click('#login')
      .pause(1000)
      .assert.containsText('#message', 'You are now signed')
      .click('#logout');
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
```
