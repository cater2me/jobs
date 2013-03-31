Feature: View posts
  To display posts to a user
  A user
  Should be able to view posts

    Scenario: User clicks "Get Posts!"
      When I go to the home page
      And I fill in "url" with "http://feeds.feedburner.com/PaulDixExplainsNothing"
      When I press "get_posts"
      Then I should see "Title:"
      Then I should see "Author:"
      Then I should see "Preview:"
