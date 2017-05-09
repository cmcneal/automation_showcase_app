Feature: Verify that the correct users can login
  In order to verify that the test app login works
  As a test user
  I need to sign in as each of the test users

Scenario Outline: Sign in, sign out
  Given I can sign in as <user>
   Then I should be signed in and see <message>
    And I can sign out

Examples:
|user|message|
|alpha|You are now signed|
| test |You are now signed|
|error|Username was incorrect.|
