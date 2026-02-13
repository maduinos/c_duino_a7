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

module tb_servo_ctrl();
    reg clk;
    reg resetn;
    wire pwm_sig;

    // register
    reg [31:0] pwm_duty_value;

localparam CLK_PERIOD = 10; // 10ns

pwm_ctrl dut0 (
    .clk(clk),
    .resetn(resetn),
    .pwm_sig(pwm_sig),

    // register
    .pwm_duty_value(pwm_duty_value)
);

initial begin
    clk = 1'b0;
    resetn = 1'b0;
    repeat(4) #(CLK_PERIOD/2) clk = ~clk;
    resetn = 1'b1;
    forever #(CLK_PERIOD/2) clk = ~clk;
end

initial begin
    // initial value
    //pwm_duty_value = 32'd15000; // ref 10Mhz 1.5ms duty
    pwm_duty_value = 32'd100;

    // wait for reset
    @(posedge resetn);
    
    repeat(200) begin 
        repeat(100) begin 
            @(posedge clk);
        end
        pwm_duty_value = pwm_duty_value + 32'd1;
        if( pwm_duty_value == 32'd200) begin
            pwm_duty_value = 32'd0;
        end
    end
    
    $finish;
end

endmodule
