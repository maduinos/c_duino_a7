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

module tb_led_ctrl();
    reg clk;
    reg resetn;
    wire [3:0] led;

    // register
    reg [31:0] led_state;

localparam CLK_PERIOD = 10; // 10ns

led_ctrl #(
    .LED_NUM(4)
) dut0 (
    .clk(clk),
    .resetn(resetn),
    .led(led),

    // register
    .led_state(led_state)
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
    led_state = 32'd0;

    // Wait for reset
    @(posedge resetn);

    // Wait for clock edges
    repeat(5) @(posedge clk);

    led_state = 32'd1;

    // Wait for clock edges
    repeat(5) @(posedge clk);

    repeat(4) begin
        // Change LED state
        case (led_state)
            32'h0000_0001: $display("LED State: %b", led);
            32'h0000_0002: $display("LED State: %b", led);
            32'h0000_0004: $display("LED State: %b", led);
            32'h0000_0008: $display("LED State: %b", led);
        endcase

        // Wait for clock edges
        repeat(5) @(posedge clk);

        // Update LED state
        led_state = led_state << 1;
    end

    $finish;
end

endmodule

