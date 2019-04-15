///assert_in_range(got, lower, upper, [msg])
//Assert that the gotten expression is within the inclusive range between lower and upper.
{
  if (!GMASSERT_ENABLED) exit;
  
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 3:
      msg = "In-range assertion failed!";
    break;
    case 4:
      msg = argument[3];
    break;
    default:
      show_error("Expected 3 or 4 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  
  //Check types
  switch (typeof(argument[1])) {
    case "number":
    case "string":
    case "array":
    break;
    default:
      msg += " (invalid lower bound type)";
        __gma_assert_error_raw__(msg, "A real value, string or array", __gma_debug_value__(argument[1]));
    exit;
  }
  if (typeof(argument[1]) != typeof(argument[2])) {
    switch (typeof(argument[1])) {
      case "number":
        __gma_assert_error__(msg + " (mismatched range types)", "A real value for the upper bound", __gma_debug_value__(argument[2]));
      break;
      case "string":
        __gma_assert_error__(msg + " (mismatched range types)", "A string for the upper bound", __gma_debug_value__(argument[2]));
      break;
      case "array":
        __gma_assert_error__(msg + " (mismatched range types)", "An array for the upper bound", __gma_debug_value__(argument[2]));
      break;
      default:
        msg += " (invalid lower bound type)";
        __gma_assert_error_raw__(msg, "A real value, string or array", __gma_debug_value__(argument[1]));
      break;
    }
    exit;
  }
  
  //Check assertion
  if (!(__gma_less_than_or_equal__(argument[0], argument[2]) && __gma_less_than_or_equal__(argument[1], argument[0]))) {
    switch (typeof(argument[1])) {
      case "number":
        __gma_assert_error_raw__(msg, "A real value between " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
      case "string":
        __gma_assert_error_raw__(msg, "A string that lies between " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
      case "array":
        __gma_assert_error_raw__(msg, "An array with pairwise values all between " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
      default:
        __gma_assert_error_raw__(msg + " (unsupported type)", "A value comparable to " + __gma_debug_value__(argument[1]) + " and " + __gma_debug_value__(argument[2]), __gma_debug_value__(argument[0]));
      break;
    }
  }
}
