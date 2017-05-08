# Protractor
> an end-to-end test framework for Angular and AngularJS applications. Protractor runs tests against your application running in a real browser, interacting with it as a user would.

|          |                                  |
|----------|----------------------------------|
|Website   | http://www.protractortest.org/#/ |
|Language  | JavaScript (Node.js)             |
|Drivers   | Selenium/WebDriver               |
|          | SauceLabs                        |
|Framework | Jasmine                          |

## Installation
*

## Config/folder structure
```
.
project
|   conf.js
|   spec.js
```

## Example
`conf.js`
```javascript
exports.config = {
  framework: 'jasmine',
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['spec.js'],
  getPageTimeout: 15000,
  jasmineNodeOpts: {defaultTimeoutInterval: 15000}
};
```

`spec.js`
```javascript
describe('Automation Showcase App', function() {
  it('should have a title', function() {
    browser.waitForAngularEnabled(false);

    browser.get('https://automation-showcase-app.herokuapp.com/');

    expect(browser.getTitle()).toMatch('Test App');
  });
  it('should not allow a login for invalid users', function() {
    browser.waitForAngularEnabled(false);

    browser.get('https://automation-showcase-app.herokuapp.com/');

    element(by.id('username')).clear().then(function() {
      element(by.id('username')).sendKeys('error');
    });

    element(by.id('login')).click().then(function() {
      expect(browser.element(by.id('message')).isPresent()).toBeTruthy();
      expect(browser.element(by.id('message')).getText()).toMatch('Username was incorrect.');
    });

  });
  it('should allow a login for valid user test', function() {
    browser.waitForAngularEnabled(false);

    browser.get('https://automation-showcase-app.herokuapp.com/');


    element(by.id('username')).clear().then(function() {
      element(by.id('username')).sendKeys(' test ');
    });

    element(by.id('login')).click().then(function() {
      expect(browser.element(by.id('message')).isPresent()).toBeTruthy();
      expect(browser.element(by.id('message')).getText()).toContain('You are now signed in');

      expect(browser.element(by.id('message')).isPresent()).toBeTruthy();
      expect(browser.element(by.id('message')).getText()).toMatch('test');
    });

  });
  it('should allow a login for valid user alpha', function() {
    browser.waitForAngularEnabled(false);

    browser.get('https://automation-showcase-app.herokuapp.com/');


    element(by.id('username')).clear().then(function() {
      element(by.id('username')).sendKeys('alpha');
    });

    element(by.id('login')).click().then(function() {
      expect(browser.element(by.id('message')).isPresent()).toBeTruthy();
      expect(browser.element(by.id('message')).getText()).toContain('You are now signed in');

      expect(browser.element(by.id('message')).isPresent()).toBeTruthy();
      expect(browser.element(by.id('message')).getText()).toMatch('alpha');
    });

  });
});

```
