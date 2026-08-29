//====================================================
// UART Transmitter (8-bit, 1 Start Bit, 1 Stop Bit)
//====================================================

module uart_tx(
    input clk,
    input reset,
    input tx_start,
    input [7:0] data_in,
    output reg tx,
    output reg busy
);

reg [3:0] bit_count;
reg [9:0] shift_reg;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        tx <= 1'b1;         // Idle state
        busy <= 0;
        bit_count <= 0;
    end
    else
    begin
        if(tx_start && !busy)
        begin
            // Frame: Stop bit + Data + Start bit
            shift_reg <= {1'b1, data_in, 1'b0};
            busy <= 1;
            bit_count <= 0;
        end
        else if(busy)
        begin
            tx <= shift_reg[0];
            shift_reg <= {1'b1, shift_reg[9:1]};
            bit_count <= bit_count + 1;

            if(bit_count == 9)
            begin
                busy <= 0;
                tx <= 1'b1;
            end
        end
    end
end

endmodule