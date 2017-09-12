module demorgan
(
  input  A,          // Single bit inputs
  input  B,
  output nA,         // Output intermediate complemented inputs
  output nB,
  output nAandnB,     // Single bit output, (~A)*(~B)
  output nAornB,
  output AandB,
  output nAandB,
  output AorB,
  output nAorB
);

  wire nA;
  wire nB;
  wire nAandnB;
  wire nAornB;
  wire AandB;
  wire nAandB;
  wire AorB;
  wire nAorB;

  not Ainv(nA, A);    // Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);

  and andgate(nAandnB, nA, nB);   // AND gate produces nAandnB from nA and nB
  or orgate(nAornB, nA, nB);

  and andgate(AandB, A, B);
  or orgate(AorB, A, B);

  not AndBinv(nAandB, AandB);
  not AorBinv(nAorB, AorB);

endmodule