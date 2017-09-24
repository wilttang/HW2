// Adder circuit

module behavioralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule


module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);

//create the not of inputs 
not carryininv(ncarryin, carryin);
not ainv(na, a);
not ainv(nb, b);

//Based on our turth table we have the 4 statements below for our sum
and getsum0(s0, na, nb, carryin);
and getsum1(s1, na, b, ncarryin);
and getsum1(s2, a, nb, ncarryin);
and getsum3(s3, a, b, carryin);

or getsum(sum, s0, s1, s2, s3);

//Based on our truth table we have the 4 statements below for our carryout
and getcarryout0(cout0, na, b, carryin);
and getcarryout1(cout1, a, nb, carryin);
and getcarryout2(cout2, a, b, ncarryin);
and getcarryout3(cout3, a, b, carryin);

or getcarryout(carryout, cout0, cout1, cout2, cout3);

endmodule



