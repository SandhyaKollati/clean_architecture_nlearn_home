Feature: Home List Screen
  As a user of the learning app
  I want to see various sections on the home screen
  So that I can quickly access different features of the app

  Background:
    Given the app is running
    And I am on the Home List Screen

  Scenario: Viewing sections on a successful load
    When the home screen loads successfully
    Then I should see the silverAppBarWidget
    And I should see the static banners
    And I should see the "Continue From Where You Left" section

  Scenario: Loading state
    When the home screen is loading
    Then I should see a loading indicator

  Scenario: Error state
    When the home screen fails to load
    Then I should see an error message
