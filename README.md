# everand-top-charts
SwiftUI coding take home project from Scribd to implement a sample Top Charts screen

Notes:
- I made a simple json file to contain the list of books to show on the UI. I try to mimic as much as possible as if this json is the result I would get from a rest api
- The data model is simple, it's a Book that contains a property of either an ebook or an audiobook, and the filtering will leverage this property
- I fetch the entities objects of books from this local file and then I persist them using SwiftData. Why? Because I try to mimic real usecase scenario as much as possible. So the idea is that whatever I fetched from the backend get persisted locally, and because SwiftData gels so nicely with SwiftUI, it takes very little boilerplate code to update the UI automatically.

Things I wish to do if I had more time:
- Actually show cover image for each book as opposed to a stock Book icon from SF Symbols
- Implement more testing code especially on the various views I have
- Make the book list to be really long, test the performance, and maybe implement pagination leveraging the SwiftData Query
