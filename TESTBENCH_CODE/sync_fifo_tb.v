`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2026 18:12:22
// Design Name: 
// Module Name: sync_fifo_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps

module sync_fifo_tb;

    reg clk;
    reg reset;
    reg wr_en;
    reg rd_en;
    reg [7:0] data_in;

    wire [7:0] data_out;
    wire full;
    wire empty;

    // Instantiate FIFO
    sync_fifo uut (
        .clk(clk),
        .reset(reset),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Initial values
        clk     = 0;
        reset   = 1;
        wr_en   = 0;
        rd_en   = 0;
        data_in = 8'd0;

        // Reset
        #20;
        reset = 0;

        // -------------------------
        // WRITE DATA
        // -------------------------

        #10;
        data_in = 8'd10;
        wr_en = 1;
        #10;
        wr_en = 0;

        #10;
        data_in = 8'd20;
        wr_en = 1;
        #10;
        wr_en = 0;

        #10;
        data_in = 8'd30;
        wr_en = 1;
        #10;
        wr_en = 0;

        // -------------------------
        // READ DATA
        // -------------------------

        #10;
        rd_en = 1;
        #10;
        rd_en = 0;

        #10;
        rd_en = 1;
        #10;
        rd_en = 0;

        #10;
        rd_en = 1;
        #10;
        rd_en = 0;

        // -------------------------
        // CHECK EMPTY
        // -------------------------

        #10;

        // -------------------------
        // WRITE 16 DATA VALUES
        // -------------------------

        data_in = 8'd1;
        wr_en = 1;
        #10;

        data_in = 8'd2;
        #10;

        data_in = 8'd3;
        #10;

        data_in = 8'd4;
        #10;

        data_in = 8'd5;
        #10;

        data_in = 8'd6;
        #10;

        data_in = 8'd7;
        #10;

        data_in = 8'd8;
        #10;

        data_in = 8'd9;
        #10;

        data_in = 8'd10;
        #10;

        data_in = 8'd11;
        #10;

        data_in = 8'd12;
        #10;

        data_in = 8'd13;
        #10;

        data_in = 8'd14;
        #10;

        data_in = 8'd15;
        #10;

        data_in = 8'd16;
        #10;

        wr_en = 0;

        // Finish simulation
        #20;

        $finish;

    end

endmodule
