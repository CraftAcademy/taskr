Feature: Browse open task requests
  As a contractor,
  In order to apply for task postings,
  I need to be able to view current available tasks.

  Background:
    Given there are two reqesters having several tasks each belonging to some categories

  Scenario: View list of task requests
    Given I visit the landing page
    And I click on "Current Available Tasks"
    Then I should see "Current Available Tasks List"
    And I should see "Bad mowing machine"
    And I should not see "pipe in kitchen broken"
    And I should see "Stockholm, Sweden"
    And I should see "70"
