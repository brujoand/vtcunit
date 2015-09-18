# vtcunit
This is a varnishtest runner which outputs xml in unit 4 format. For automation profit.
Based on my previous work on Bauta.
Seems to be working well, but could probably be slimmed down a bit.

Build and run with docker:

```
$ docker build .
# lots of output
Successfully built 59f1e8f42bf8

$ docker run -it -v /Users/brujoand/src/vtcunit/tests/:/tests 59f1e8f42bf8
    + /tests/a00000.vtc
    + /tests/a00001.vtc
    + /tests/a00002.vtc
[Total] tests: 3 failures: 0 errors: 0 time: 0s
```
Note that I've mounted a folder as /tests, this is where vtcunit will search for vtc files to test.
The tests folder is mounted with read & write and should contain a tests.log and tests.xml after the run.
The xml file is what your buildsystem will want to parse. It should look something like this:

```
<?xml version="1.0"?>
<testsuites tests="3" failures="0" errors="0" time="0">
  <testsuite name="/tests" tests="3" failures="0" errors="0" time="0">
    <testcase name="/tests/a00002.vtc" time="0">
    </testcase>
    <testcase name="/tests/a00001.vtc" time="0">
    </testcase>
    <testcase name="/tests/a00000.vtc" time="0">
    </testcase>
  </testsuite>
</testsuites>
```


Or if you would rather run without docker, on a host with varnish installed:

```
./vtcunit yourtestfolder
```

Example vtc's are borrowed from https://github.com/varnish/Varnish-Cache.
You should probably try to write something more specific..

