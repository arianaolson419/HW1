`include "hw1.v"

module demorgan_test ();

  // Instantiate device/module under test
  reg A, B; // Primary test inputs
  wire nA, nB, nAandnB, nAornB, nAandB, nAorB; // Test outputs

  demorgan dut(A, B, nA, nB, nAandnB, nAornB, AandB, nAandB, AorB, nAorB); // Module to be tested


  // Run sequence of test stimuli
  initial begin
    // Truth table demonstrating that ~A~B = ~(A+B)
    $display("A B | ~A ~B | ~A~B | ~(A+B) ");            // Prints header for truth table
    A = 0; B = 0; #1  // Set A and B, wait for update
    $display("%b %b |  %b  %b |    %b |    %b    ", A, B, nA, nB, nAandnB, nAorB);
    A = 0; B = 1; #1
    $display("%b %b |  %b  %b |    %b |    %b    ", A, B, nA, nB, nAandnB, nAorB);
    A = 1; B = 0; #1
    $display("%b %b |  %b  %b |    %b |    %b    ", A, B, nA, nB, nAandnB, nAorB);
    A = 1; B = 1; #1
    $display("%b %b |  %b  %b |    %b |    %b    ", A, B, nA, nB, nAandnB, nAorB);

    // Truth table demonstrating that ~A+~B = ~(AB)
    $display("\nA B | ~A ~B | ~A+~B | ~(AB) ");
    A = 0; B = 0; #1
    $display("%b %b |  %b  %b |     %b |     %b    ", A, B, nA, nB, nAornB, nAandB);
    A = 0; B = 1; #1
    $display("%b %b |  %b  %b |     %b |     %b    ", A, B, nA, nB, nAornB, nAandB);
    A = 1; B = 0; #1
    $display("%b %b |  %b  %b |     %b |     %b    ", A, B, nA, nB, nAornB, nAandB);
    A = 1; B = 1; #1
    $display("%b %b |  %b  %b |     %b |     %b    ", A, B, nA, nB, nAornB, nAandB);
  end
endmodule


