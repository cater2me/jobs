Feature: View posts
  To display posts to a user
  A user
  Should be able to view posts

    @javascript
    Scenario: User clicks "Get Posts! and displays modal"
      When I go to the home page
      And I fill in "url" with "http://feeds.feedburner.com/PaulDixExplainsNothing"
      When I press the first "get_posts"
      Then I should see the "entry" div
      When I click on link "title"
      Then I should see the "modal" div
