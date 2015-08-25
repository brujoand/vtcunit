# bauta

tl;dr:
Write functions whose name begin with test_ and are declared as function _test_restofname(). Use bautas assert functions and tell us where your test folder is. Get fancy green and red unit 4 stuff in Bamboo / Jenkins etc..

Motivation:
I have applications running in docker containers, some run on remote servers, some on localhost and so on... These applications are seldom tightly coupled, but they tend to interact and/or depend on each other in some way. So I wanted a way to be able to test them as a part of my build process in relevant applications.

Problem:
So that's possible to to within the app. I could run integrationtests from my scala web app, and so forth, but I need to a lot of dirty work like curl with headers, regexp out som values, talk to a db, ssh into a remote service. Bash is perfect for these things, my scala webapp is not. 

Solution:
I wrote Bauta. A script which takes a folder as input. Finds all .sh/.bash files, and executes pre-approved functions. "Tests" if you will. There are two types of tests:

  - ``` function setup() ``` / ``` function cleanup() ``` Handlers are optional and will run before / after all tests in the same file
  - ``` function _test_put_a_name_here_but_keep_test_infront>() ``` This is a test, and we will run it in isolation from other tests.

In the end; we get some pritty prints, like so:

![Screenshot output](https://raw.github.com/brujoand/bauta/master/resources/test_output.png)

And we end up (hopefully) with an xml which conforms to the unit4 spec. The benefit of this is ofc that bamboo/jenkins etc will recognize the tests, and present them as a part of our build. 

Available functions:
  - bauta_log: takes one argument, a log statement (use -l flag to see in the pretty output)
  - assert_equals: Takes two arguments compares them by using [[ $1 == $2 ]]
  - assert_none_empty: Takes one argument removes spaces and checks if it is empty
  - assert_is_substring_of: takes two arguments a substring, and a string

PS: There are probably hundres of these things on github. I made this in part to learn bash better. So if you stumble in here, and see something which is bad/wrong/suboptibal/nothipsterenough. Please do let me know :) 
