Usage: 
======

Have an input file called "input.txt" in the same directory as cardhandler.rb and card.rb.
Simply run cardhandler.rb to process the input file and receive output through stdout.

The input is processed and a summary report is generated, which includes a list of the errors that occurred as well as the actual summary of the remaining balances of the current accounts.

I personally added the feature of reporting errors as they come up, since the example output given in the coding challenge description completely ignored what type or how many errors occurred, which I thought was too vague.

Ruby was used as the language of choice as it is the language that I am most comfortable writing code in. Additionally, it allowed for very readable code.

Successfully tested on Ruby 1.9.3.

Example:
========
input.txt:
----------
Add Tom 4111111111111111 $1000
Add Lisa 5454545454545454 $3000
Add Quincy 1234567890123456 $2000
Charge Tom $500
Charge Tom $800
Charge Lisa $7
Credit Lisa $100
Credit Quincy $200


Result:
-------
Error! Add Quincy 1234567890123456 $2000
: Card number is invalid - doesn't pass Luhn10 test. 

Error! Charge Tom $800
: Charge amount exceeds limit on the card. 

Error! Credit Quincy $200: That card does not exist. 

Summary: 
Lisa: $-93
Quincy: error
Tom: $500


