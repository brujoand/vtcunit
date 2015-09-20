# vtcunit
This is a varnishtest runner which outputs xml in unit 4 format. For automation profit.
Based on my previous work on Bauta.
Seems to be working well, but could probably be slimmed down a bit.

All you need is a varnish folder. Put some vtc in there.
If you want to keep the container running after tests have completed add -e "KEEP_RUNNING=true"
to the docker run command. If you would also like to run your custom vcl's when the tests are
completed just add them to the varnish folder. Varnish will load 'default.vcl' and anything 
that file includes.

Build and run with docker:

```
$ docker build .
# lots of output
Successfully built 59f1e8f42bf8

$ docker run -it -v /Users/brujoand/src/vtcunit/varnish/:/etc/varnish 59f1e8f42bf8
    + /tests/a00000.vtc
    + /tests/a00001.vtc
    + /tests/a00002.vtc
[Total] tests: 3 failures: 0 errors: 0 time: 0s
```
The varnish folder is mounted with read & write and should contain test-reports/tests.xml after the run.
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

Also, there is an automated build at ducker hub so you could also do:

```
docker pull brujoand/vtcunit
```
