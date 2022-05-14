//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Miu Mihai Florian
// Data        : 3/28/2022
//---------------------------------------------------------------------------------------
// Descriere   : DW03_bictr_decode_inst
//---------------------------------------------------------------------------------------

module ck_rst_tb (
output reg   clk   , // semnal de ceas
output reg   rst_n   // semnal de reset asincron, activ low
);

initial begin
  clk = 1'b0; 
  forever #5 clk = ~clk;
end

initial begin
  rst_n <= 1'b1;  
  @(posedge clk);
  rst_n <= 1'b0;
  @(posedge clk);
  @(posedge clk);
  rst_n <= 1'b1;  
  @(posedge clk);
end

endmodule // ck_rst_tb

