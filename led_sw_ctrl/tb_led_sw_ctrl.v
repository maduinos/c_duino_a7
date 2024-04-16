/*----------------------------------------------------------------------------
--     Name    : Testbench
--     Made by : Maduinos
--     Date    : 2023/08/17
--     Blog    : https://maduinos.blogspot.com/
--     Date    : 
--     Ver.    : 
--     WORK    : 
----------------------------------------------------------------------------*/

`timescale 1ns/1ps

module tb_led_sw_ctrl();
    reg             clk;
    reg             resetn;
    reg     [2:0]   sw;
    wire    [3:0]   led;

localparam CLK_PERIOD = 10; // 10ns

led_sw_ctrl #(
    .LED_NUM(4),
    .SW_NUM(3)
) dut0 (
    .clk(clk),
    .resetn(resetn),
    .sw(sw),
    .led(led)
);

initial begin
    clk = 1'b0;
    resetn = 1'b0;
    repeat(4) #(CLK_PERIOD/2) clk = ~clk;
    resetn = 1'b1;
    forever #(CLK_PERIOD/2) clk = ~clk;
end

initial begin
    // Initial values
    sw = 3'b000;

    // Wait for reset
    @(posedge resetn);

    // Wait for clock edges
    repeat(5) @(posedge clk);

    sw = 3'b001;

    // Wait for clock edges
    repeat(5) @(posedge clk);

    repeat(3) begin
        // Change LED state
        case (sw)
            3'h0000_0001: $display("LED State: %b", led);
            3'h0000_0002: $display("LED State: %b", led);
            3'h0000_0004: $display("LED State: %b", led);
        endcase

        // Wait for clock edges
        repeat(5) @(posedge clk);

        // Update LED state
        sw = sw << 1;
    end

    $finish;
end

endmodule

