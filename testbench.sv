`timescale 1ns/1ps

module tb_clock_divider;

    logic clk;
    logic rst_n;
    logic clk_out;

   
    clock_divider #(.DIVIDE_BY(4)) dut (
        .clk_in (clk),
        .rst_n  (rst_n),
        .clk_out(clk_out)
    );

    
    always #5 clk = ~clk;

    initial begin
        
        $dumpfile("clock_divider.vcd");
        $dumpvars(0, tb_clock_divider);

        
        $display("TIME\tclk\tclk_out\trst_n");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, clk_out, rst_n);

        
        clk   = 0;
        rst_n = 0;

        #20 rst_n = 1;   
        #200;

      $display("----------------------------------");
      $display(" CLOCK DIVIDER TEST PASSED ");
      $display("----------------------------------");
        $finish;
    end

endmodule