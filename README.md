# bauta

Motivation:
I have applications running in docker containers, on remote servers and lot's of stuff, that's not really tightly coupled, but which interact and/or depend on each other. So I wanted a way to be able to test them as a part of my build process in relevant applications.

Problem:
So that's possible to to within the app. I could run integrationtests from my scala web app, and so forth, but I need to a lot of dirty work, which bash is perfect for. Also, most of the tests I want require only a simple curl command and a regexp, which might not be the best fit for say scala. 

Solution:
I wrote Bauta. A script which takes a folder as input. Finds all .sh/.bash files, and executes pre-approved functions. "Tests" if you will. There are two types of tests:

  - ``` function setup() ``` / ``` function cleanup() ``` Are optional and will run before / after all tests in the same file
  - ``` function _test_put_a_name_here_but_keep_test_infront>() ``` Will run the test in isolation. 

We get some pritty printout, like so:

![Screenshot output](https://raw.github.com/brujoand/bauta/master/resources/test_output.png)

And we end up (hopefully) with an xml which conforms to the unit4 spec. The benefit of this is ofc that bamboo/jenkins etc will recognize the tests, and present them as a part of your build. 


PS: There are probably hundres of these things on github. I made this in part to learn bash better. So if you stumble in here, and see something which is bad/wrong/suboptibal/nothipsterenoug. Please do let me know :) 
