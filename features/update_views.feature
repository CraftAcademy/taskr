Feature: Update views
  As a user
  to get a better user experience
  it would be good to get some views updated

  Background:
    Given there are two reqesters having several tasks each belonging to some categories
    And the contractor exists with e-mail "con@a.com" and password "12345678" and is logged in

  Scenario: The common view of all tasks has a the requester full name and the description
    Given I visit the landing page
    And I click link "Current Available Tasks"
    Then I should see "Requester: James Bond"
    And I should see "Description: pipe in kitchen broken"

  Scenario: A requester should be able to see any bids on a task from the 'View My Tasks' detail page
    Given I click on "Current Available Tasks"
    And I click on "Bad mowing machine"
    And I fill in field "Quote:" with "500"
    And I check "bid_terms_of_service" checkbox
    And I click on "Make Offer"
    And I click on "Log Out"
    And I log in as requester "requester1@r.com" with password "12345678"
    And I click on "View My Tasks"
    Then I should see "Bob Jackson's Bid: 500"

  Scenario: Add link to navbar to Post New Task
    Given I click on "Post New Task"
    Then I should see "New Task"
