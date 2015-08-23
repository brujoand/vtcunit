#! /usr/bin/env bash

myname=""

function setup() {
  myname=anders
}

function cleanup() {
  echo "doing my cleanup"
}

function check_that_we_have_a_name() {
  assert_equals "$myname" "anders"
}

function check_that_fails() {
  assert_equals 10 4
}

function check_long_test_with_side_effect() {
  myname=shit
  sleep 1
  assert_equals 1 1
}

function check_if_we_have_side_effect() {
  assert_equals "$myname" "anders"
}


function check_that_we_cant_die() {
  assert_equals "ha" "ha"
  thiscommandisntreal
}
