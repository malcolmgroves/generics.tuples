What is Generics.Tuples?
========================
Generics.Tuples adds generic tuple support to Delphi and AppMethod. 

Tuples give you a single type that can hold multiple other types. For example, in the following code you can see a tuple being defined to hold an Integer and a String: 

    var
      LTuple : ITuple<Integer, String>;
    begin
      LTuple := TTuple<Integer, String>.Create(10, 'Hello');


Once you have that, you can reference the individual values like so:

    
      x := LTuple.Value1 + 10;
      ShowMessage(LTuple.Value2);


Why Might This Be Useful?
-------------------------
One place this can be helpful is where you want to return multiple values from a function. You can return the multiple values inside a tuple rather than mucking around with multiple var params.

Another place is where you want to store pairs of values in a collection.


Support
----------

Currently I have support for tuples containing 2 or 3 items, but you can see how adding support for more can be achieved by looking at the code. 

It also supports objects, correctly freeing them on destruction of the tuple.