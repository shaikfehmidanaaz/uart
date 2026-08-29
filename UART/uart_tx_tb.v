`timescale 1ns/1ps

module uart_tx_tb;

reg clk;
reg reset;
reg tx_start;
reg [7:0] data_in;

wire tx;
wire busy;

uart_tx uut(
    .clk(clk),
    .reset(reset),
    .tx_start(tx_start),
    .data_in(data_in),
    .tx(tx),
    .busy(busy)
);

// Clock generation
always #5 clk = ~clk;

initial
begin

    $dumpfile("uart_tx.vcd");
    $dumpvars(0, uart_tx_tb);

    clk = 0;
    reset = 1;
    tx_start = 0;
    data_in = 8'h00;

    #10 reset = 0;

    // Send character 'A' (0x41)
    data_in = 8'h41;
    tx_start = 1;

    #10;
    tx_start = 0;

    #150;

    $finish;

end

initial
begin
    $monitor("Time=%0t TX=%b Busy=%b Data=%h",
             $time, tx, busy, data_in);
end

endmodule