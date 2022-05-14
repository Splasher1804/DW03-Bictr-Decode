//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Miu Mihai Florian
// Data        : 3/28/2022
//---------------------------------------------------------------------------------------
// Descriere   : DW03_bictr_decode_inst
//---------------------------------------------------------------------------------------

module DW03_bictr_decode_tb #(
parameter WIDTH           = 'd8           // numar de biti ai numaratorului
) (
input                     clk           , // semnal de ceas
input                     rst_n         ,
output reg                cen           , // semnal de reset asincron, activ low
output reg                count_up_dwn  , // comanda de numarare, activa high
output reg                load          ,// comanda presetare, activa high, 
                                          // prioritara fata de numarare
output reg [WIDTH  -1:0]  data_preset     // data presetare
);

initial begin
  count_up_dwn<= 1'bx;
  load        <= 1'bx;
  data_preset <= {WIDTH{1'bx}};
  
  // initializeaza numaratorul la 0, la activarea reset asincron
  @(negedge rst_n);
  count_up_dwn<= 1'b0;
  load        <= 1'b0;
  cen         <= 1'b1;
  data_preset <= {WIDTH{1'bx}};
  @(posedge rst_n);

  // numarator initializat, asteapta
  repeat (5) @(posedge clk);
  
  // numara de la 0 la 15 si reia numararea de la 0
  count_up_dwn    <= 1'b1;
  repeat (20) @(posedge clk); 
  
  // dezactiveaza numararea si asteapta
  count_up_dwn    <= 1'b0;
  repeat (5) @(posedge clk);

  // preseteaza starea in 13
  load        <= 1'b1;
  cen         <= 1'b1;
  data_preset <= 'd13;
  @(posedge clk);
  load        <= 1'b0;
  cen         <= 1'b0;
  data_preset <= 'bx;
  @(posedge clk);

  // asteapta
  repeat (5) @(posedge clk);

  // reia numararea de la valoarea presetata
  count_up_dwn    <= 1'b1;
  repeat (20) @(posedge clk); 

  // dezactiveaza numararea si asteapta
  count_up_dwn    <= 1'b0;
  repeat (5) @(posedge clk);


  $display ("%M %0t INFO: Final simulare.", $time);
  $stop;
  
end

endmodule // counter_preset_tb
