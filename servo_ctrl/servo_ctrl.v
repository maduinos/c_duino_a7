/*----------------------------------------------------------------------------
--     Name    : Servo Controller
--     Made by : Maduinos
--     Date    : 2023/08/17
--     Blog    : https://maduinos.blogspot.com/
--     Ver.    : 0.01
--     WORK    : First Draft
----------------------------------------------------------------------------*/
`timescale 1ns/1ps

module servo_ctrl (
    input                   clk,
    input                   resetn,
    output reg              pwm_sig,

    // register
    input       [31:0]      pwm_duty_value
);
localparam CLK_FREQ_HZ = 27e6;  // 27MHz
localparam DESIRED_FREQ_HZ = 50;
localparam NUM_CLK_CYCLE = (CLK_FREQ_HZ / DESIRED_FREQ_HZ);

localparam SERVO_DUTY_MIN = 32'd27000; // ref 27MHz 1ms count
localparam SERVO_DUTY_MID = 32'd40500; // ref 27MHz 1.5ms count
localparam SERVO_DUTY_MAX = 32'd54000; // ref 27MHz 2ms count

reg     [31:0]  freq_cnt;

// freq.
always @(posedge clk) begin
    if(!resetn)                         freq_cnt <= 32'd0;
    else if(freq_cnt >= NUM_CLK_CYCLE)  freq_cnt <= 32'd0;
    else                                freq_cnt <= freq_cnt + 32'd1;
end

// duty
always @(posedge clk) begin
    if(!resetn)                         pwm_sig <= 1'b0;
    else if(freq_cnt >= pwm_duty_value) pwm_sig <= 1'b0;
    else                                pwm_sig <= 1'b1;
end

endmodule
