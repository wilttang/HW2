// Multiplexer circuit

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);

wire out0,out1,out2,out3;

//create ~address0, ~address1

not address0inv(naddress0,address0);
not address1inv(naddress1,address1);


//Based on our truth table we have 4 cases defined as follow for when to choose each of our inputs

//q0 is equal to AND of in0 and ~address0, ~address1
and geto0 (out0,in0,naddress0,naddress1);

//q2 is equal to AND of in1 and address0, ~address1
and geto1 (out1,in0,address0,naddress1);

//q3 is equal to AND of in2 and ~address0, address1
and geto2 (out2,in0,naddress0,address1);


//q3 is equal to AND of in3 and address0, address1
and geto3 (out3,in0,address0,address1);


//we take these 4 possibilites and OR them, we should choose the only one that is valid 
or getout(out,out0,out1,out2,out3);


endmodule

