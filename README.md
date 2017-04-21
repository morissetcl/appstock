AppStock

Small app to manage book stock.

If you want to add new book, please use seeds.

To update quantity/stock create a new flow with Previous Quantity, New Quantity and an optionnal comment.

API:

Get all books
"/api/v1/books"

Get a specific book
"/api/v1/books/:isbn"

Update quantity by creating new flow
"/api/v1/books/:isbn/flows"


example:

curl -i -X POST    \
     -H 'Content-Type: application/json'    \
     -d '{ "flow": { "newQuantity": 29, "oldQuantity": 11, "comment": "Won Goncourt" } }'  \
     http://localhost:3000/api/v1/books/6993/flows
