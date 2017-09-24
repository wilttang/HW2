// Decoder circuit

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input A, B,
    input enable
);

//Create ~A and ~B

not Ainv (nA, A);
not Binv (nB, B);



//q0 is equal to AND of enable and ~A and ~B 
and getq0 (out0,enable,nA,nB);

//q2 is equal to AND of enable and A and ~B
and getq1 (out1,enable,A,nB);

//q3 is equal to AND of enable and nA and B
and getq2 (out2,enable,nA,B);

//q3 is equal to AND of enable and A and B
and getq3 (out3,enable,A,B);

endmodule



