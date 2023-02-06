# Food Ordering System

A ruby program that allows the user to see a menu with prices, select from the available dishes, and see an itemised receipt with a grand total price. The expected time of delivery will be texted to the user after an order is successful (using twilio-ruby).

#### User Story & Program Functions: 

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
> 
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
> 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

The `twilio-ruby` gem is used to implement this next function. Doubles are used in the 
testing process when implementing mocking.

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and
> will be delivered before 18:52" after I have ordered.

## How to use:

### To run the entire program

```
$ cd food-ordering-system
$ ruby food_app.rb
```

### To test the program using pre-coded tests

```
$ cd food-ordering-system
$ rspec
```
