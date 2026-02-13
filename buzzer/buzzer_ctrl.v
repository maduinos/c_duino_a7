/*----------------------------------------------------------------------------
--     Name    : Buzzer Controller
--     Made by : Maduinos
--     Date    : 2023/08/19
--     Blog    : https://maduinos.blogspot.com/
--     Ver.    : 0.01
--     WORK    : 
----------------------------------------------------------------------------*/
`timescale 1ns/1ps
`include "pitches_defs.vh"

module buzzer_ctrl (
    input                   clk,
    input                   resetn,
    output reg              buzzer 
);

reg     [15:0]  cnt;
wire    [15:0]  freq;

assign freq = `NOTE_C5;

always @(posedge clk) begin
    if(!resetn) begin
        cnt <= 16'd0;
        buzzer <= 1'b0;
    end
    else begin
        if( cnt >= freq ) begin
            cnt <= 16'd0;
            buzzer <= ~buzzer;
        end
        else begin
            cnt <= cnt + 16'd1;
        end
    end
end

endmodule
