# Omega Pricing Integration App

## About

This is a sample app built as part of an interview for "Marketing Science Manager" at Telnyx. The requested time limit was 2 hours and was done with the exception of writing the README.

## Todos:

There are some "TODOs" throughout the codebase.

Other items not completed to either complete the app according to specifications or general best practices:

1. Add automated tests. I'm an RSpec user myself.
2. Fix the time zones on the updated and created at fields. They're getting set to GMT instead of US Central.
3. Store the product price (and PastPriceRecord) either in a money format or integer which is the price in pennies per requirements.
4. Use actual mocking infrastructure (this ties into setting up automated tests) instead of using the example hash hard-coded into the app.
5. Error handling. There's probably edge cases I haven't covered, some missing views, and these errors should be handled gracefully.

## Usage

Instead of using a test suite, I just tested the functionality by hitting URLs that triggered behavior and checking the console output, logs, and database.

Simple usage is to spin up a rails server with ```rails s```, then visiting ```localhost:3000```, then after seeing the Welcome screen, you should be able to go to ```localhost:3000/products/1``` and see a Product which has been saved.
