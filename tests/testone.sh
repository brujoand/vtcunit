function check_that_we_can_match_substring() {
  string="This is a long string"
  substring="string"
  assert_is_substring_of "$substring" "$string"
}

function check_that_we_can_assert_non_empty() {
  string="heioghopp"
  assert_none_empty "$string"
  assert_none_empty "$string"
}
