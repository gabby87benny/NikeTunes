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
3. No storyboard, nibs, third party libraries  are employed. Displayed results in table view. Designed UI programatically using Auto layout.
4. Added activity indicator that displays when network operations are in progress.
5. Handled error and propogated from network layer through UI.
6. Implemented unit test cases for controllers, view models and API layer using XCTestCase.
7. App supports iOS 13.0 and later and supports both orientations.

