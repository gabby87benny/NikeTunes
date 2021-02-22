# NikeTunes

# Given Challenge:
Create a sample iPhone app that displays the top 100 albums across all genres using Apple’s RSS generator found here: https://rss.itunes.apple.com/en-us .

The app should: 
•    use Auto Layout
•    Not use storyboards or nibs
•    Not use any third party libraries
•    DO NOT force unwrap your code or show signs of forced unwrapping your code
•    Provide production level code with unit testing completed

# Solution:

1. Displayed the top 100 albums by fetching data from Apple's Album API using URLSession.
2. Implemented MVVM design with POP approach.
3. No storyboard, nibs, third party libraries  are employed. 
4. Displayed results in table view. Designed UI programatically using Auto layout.
5. Used custom cell to display the Album Info.
6. Designed detail view (in form of presentation) to display the above information as detail. Added "Open in iTunes" button (as instructed in challenge) and implemented the action using openUrl: API.
7. Added activity indicator that displays when network operations are in progress.
8. Added alert view presenter to display pop up messages. 
9. Handled error and propogated from network layer through UI.
10. Implemented unit test cases for controllers, view models and API layer using XCTestCase.
11. App supports iOS 13.0 and later.

Nice to do (If i have some more time) :
Add more tests towards Detail view, Cache manager, URL Session etc.

