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
