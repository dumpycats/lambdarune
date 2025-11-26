function round_to_even(arg0)
{
    var rounded = round(arg0);
    return ((rounded & 1) == 0) ? rounded : (rounded + 1);
}
