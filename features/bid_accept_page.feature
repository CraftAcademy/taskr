Feature: Requester to accept bid
  As a requester
  In order to agree with the chosen contractor on the task required
  I should see a page with an agreement for me to confirm

  Background:
    Given there are two reqesters having several tasks each belonging to some categories
    And the contractor exists with e-mail "con@a.com" and password "12345678" and is logged in
    And I click on "Current Available Tasks"
    And I click on "Bad mowing machine"
    And I fill in field "Quote:" with "500"
    And I check "bid_terms_of_service" checkbox
    And I click on "Make Offer"
    And I click on "Log Out"
    And I log in as requester "requester2@r.com" with password "12345678"
    And I click on "Current Available Tasks"
    And I click on "Bad mowing machine"
    And I click on "Accept Bid"

  Scenario: On bid accept page, check box and accept bid
    Given I check "tos_accept_bid" checkbox
    And I click on "OK"
    Then I should see "You now have an agreement for this task. Congratulations!"
    And I should see "Status: Contracted"
    And I should see "Contracted on: 2017"

  Scenario: On the bid accept page, cancel the acceptance and go back to the task details page
    Given I click on "Cancel"
    Then I should see "Task Details"
    And I should see "Task: Bad mowing machine"

  Scenario: On bid accept page, do not check box and get message that bid cannot be accepted
    Given I click on "OK"
    Then I should see "You need to check the box to accept the terms and conditions before a bid can be accepted."

  Scenario: After accepting a bid the status is set to 'Contracted' and it is not visible in the main list (so no new bids can be placed)
    Given I check "tos_accept_bid" checkbox
    And I click on "OK"
    And I click on "View My Tasks"
    And I click on "Bad mowing machine"
    Then I should see "Status: Contracted"
    Given I click on "Current Available Tasks"
    Then I should not see "Bad moving machine"

    Scenario: Accept bid link not visible if task status is not Open or Bidding
      Given I check "tos_accept_bid" checkbox
      And I click on "OK"
      And I click on "View My Tasks"
      And I click on "Bad mowing machine"
      Then I should not see "Accept Bid"

    Scenario: Task in Contracted state should list winning bid amount and time
      Given I check "tos_accept_bid" checkbox
      And I click on "OK"
      And I click on "View My Tasks"
      And I click on "Bad mowing machine"
      Then I should see "Winning Contractor: con@a.com - Bob Jackson"
      And I should see "Winning Bid amount: 500"
      And I should see "Contracted on: 2017"    
