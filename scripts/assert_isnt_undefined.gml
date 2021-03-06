///assert_isnt_undefined(got, [msg])
{
  if (!GMASSERT_ENABLED) exit;

  //Capture message argument
  switch (argument_count) {
    case 1:
      assert_is_defined(argument[0]);
    break;
    case 2:
      assert_is_defined(argument[0], argument[1]);
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
}
