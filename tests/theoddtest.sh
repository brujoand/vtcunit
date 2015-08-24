#! /usr/bin/env bash

function setup() {
  ooops
}

function check_that_we_can_have_newlines() {
  lang=$(echo -e "Some weird Runtim Exception:\nthis one has newlines, many\n new lines\n yes many\n hoho")
  assert_equals "$lang" "$lang"
}
