/*----------------------------------------------------------------------------
--     Name    : Testbench
--     Made by : Maduinos
--     Date    : 2023/08/19
--     Blog    : https://maduinos.blogspot.com/
--     Date    : 
--     Ver.    : 
--     WORK    : 
----------------------------------------------------------------------------*/

`timescale 1ns/1ps

module tb_buzzer_ctrl();
    reg clk;
    reg resetn;
    wire buzzer;

localparam CLK_PERIOD = 100; // 100ns

buzzer_ctrl dut0 (
    .clk(clk),
    .resetn(resetn),
    .buzzer(buzzer)
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

    // wait for reset
    @(posedge resetn);
    
    repeat(200) @(posedge clk);
    
    $finish;
end

endmodule
