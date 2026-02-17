`timescale 1ns/1ps

module clock_divider #(
    parameter int DIVIDE_BY = 4
)(
    input  logic clk_in,
    input  logic rst_n,
    output logic clk_out
);

    int count;

    always_ff @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            count   <= 0;
            clk_out <= 0;
        end
        else if (count == (DIVIDE_BY/2 - 1)) begin
            clk_out <= ~clk_out;
            count   <= 0;
        end
        else begin
            count <= count + 1;
        end
    end

endmodule