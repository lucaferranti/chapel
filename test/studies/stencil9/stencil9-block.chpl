use BlockDist;

config const n = 10;

config const epsilon = 0.01;

config const printArrays = false;

const LocDom = {1..n  , 1..n  },
         Dom = LocDom dmapped blockDist(LocDom),
      BigDom = {0..n+1, 0..n+1} dmapped blockDist(LocDom);

var A, B: [BigDom] real;

A[  n/4+1,   n/4+1] =  1.0;
A[3*n/4+1, 3*n/4+1] =  1.0;
A[  n/4+1, 3*n/4+1] = -1.0;
A[3*n/4+1,   n/4+1] = -1.0;



if printArrays then
  writeln("Initial A:\n", A[Dom], "\n");

var numIters = 0;

do {
  numIters += 1;

  forall (i,j) in Dom with (ref B) do
    B[i,j] = 0.25   * A[i,j]
           + 0.125  * (A[i+1,j  ] + A[i-1,j  ] + A[i  ,j-1] + A[i  ,j+1])
           + 0.0625 * (A[i-1,j-1] + A[i-1,j+1] + A[i+1,j-1] + A[i+1,j+1]);

  const delta = max reduce abs(B - A);

  B <=> A;



} while (delta > epsilon);

if printArrays then
  writeln("Final A:\n", A[Dom]);

writeln("# iterations: ", numIters);
