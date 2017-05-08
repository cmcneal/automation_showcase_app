exports.config = {
  framework: 'jasmine',
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['spec.js'],
  getPageTimeout: 15000,
  jasmineNodeOpts: {defaultTimeoutInterval: 15000}
}
