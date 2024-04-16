/*----------------------------------------------------------------------------
--     Name    : LED Controller
--     Made by : Maduinos
--     Date    : 2023/08/17
--     Blog    : https://maduinos.blogspot.com/
--     Ver.    : 0.01
--     WORK    : First Draft
----------------------------------------------------------------------------*/
`timescale 1ns/1ps

module led_ctrl # (
    parameter LED_NUM = 4
)
(
    input                       clk,
    input                       resetn,
    output reg  [LED_NUM-1:0]   led,

    // register
    input       [31:0]          led_state
);

always @(posedge clk) begin
    if(!resetn)     led <= {LED_NUM{1'b0}};
    else            led <= led_state[LED_NUM-1:0];
end

endmodule
