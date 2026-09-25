`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2026 17:47:49
// Design Name: 
// Module Name: sync_fifo
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


module sync_fifo #(
   parameter DATA_WIDTH = 8,
   parameter FIFO_DEPTH = 16

    )( input wire clk,
       input wire reset,
       input wire wr_en,
       input wire rd_en,
       input wire [DATA_WIDTH-1:0]data_in,
       
       output reg [DATA_WIDTH-1:0] data_out,
       output wire  empty,
       output wire  full
    
    
     );
     
  reg[DATA_WIDTH-1:0] memory [0:FIFO_DEPTH-1];
  
  reg[3:0] write_ptr;
  reg[3:0] read_ptr;
  
  reg[4:0] count; 
  
  
  assign empty = (count == 0);
  assign full = (count == FIFO_DEPTH);
  
   always @(posedge clk) begin
   
         if(reset)begin
           write_ptr <= 4'd0;
           read_ptr <= 4'd0;
           count <= 5'd0;
           data_out <= 8'd0;
         end
         else begin
         
              if (wr_en && !full) begin
                memory[write_ptr] <= data_in;
                write_ptr <= write_ptr + 1'b1;
            end

            
            if (rd_en && !empty) begin
                data_out <= memory[read_ptr];
                read_ptr <= read_ptr + 1'b1;
            end

            
            case ({wr_en && !full, rd_en && !empty})

                2'b10:
                    count <= count + 1'b1;

                2'b01:
                    count <= count - 1'b1;

                default:
                    count <= count;

            endcase
        end
    end  
           
   
endmodule
