unsigned long
udivmodsi4(unsigned long num, unsigned long den, int modwanted)
{
  unsigned long bit = 1;
  unsigned long res = 0;

  while (den < num && bit && !(den & (1L<<31)))
    {
      den <<=1;
      bit <<=1;
    }
  while (bit)
    {
      if (num >= den)
        {
          num -= den;
          res |= bit;
        }
      bit >>=1;
      den >>=1;
    }
  if (modwanted) return num;
  return res;
}

long
__udivsi3 (long a, long b)
{
  return udivmodsi4 (a, b, 0);
}

long
__umodsi3 (long a, long b)
{
  return udivmodsi4 (a, b, 1);
}

long
__divsi3 (long a, long b)
{
  int neg = 0;
  long res;

  if (a < 0)
    {
      a = -a;
      neg = !neg;
    }

  if (b < 0)
    {
      b = -b;
      neg = !neg;
    }

  res = udivmodsi4 (a, b, 0);

  if (neg)
    res = -res;

  return res;
}

long
__modsi3 (long a, long b)
{
  int neg = 0;
  long res;

  if (a < 0)
    {
      a = -a;
      neg = 1;
    }

  if (b < 0)
    b = -b;

  res = udivmodsi4 (a, b, 1);

  if (neg)
    res = -res;

  return res;
}

