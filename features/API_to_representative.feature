Feature: display list of representatives near the specified location

  As a website user
  So that I can browse representatives of my county

Scenario: restrict to representatives of my county
  Given I am on the representatives page
  When I fill in "address" with "Berkeley"
  And I press "Search" button
  Then I should see the following representatives: Henry C. Levy, Melissa Wilk
  And I should not see the following representatives: VACANT, Susan Owens, Steve Hobbs