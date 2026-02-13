/*----------------------------------------------------------------------------
--     Name    : LED Controller
--     Made by : Maduinos
--     Date    : 2023/08/17
--     Blog    : https://maduinos.blogspot.com/
--     Ver.    : 0.01
--     WORK    : First Draft
----------------------------------------------------------------------------*/
`timescale 1ns/1ps

module led_sw_ctrl # (
    parameter LED_NUM = 4,
    parameter SW_NUM = 3
)
(
    input                       clk,
    input                       resetn,
    input       [SW_NUM-1:0]    sw,
    output reg  [LED_NUM-1:0]   led
);

always @(posedge clk) begin
    if(!resetn)     led <= {LED_NUM{1'b0}};
    else            led <= sw[LED_NUM-1:0];
end


endmodule
