//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Miu Mihai Florian
// Data        : 3/28/2022
//---------------------------------------------------------------------------------------
// Descriere   : DW03_bictr_decode_inst
//---------------------------------------------------------------------------------------

module DW03_bictr_decode #(
parameter WIDTH           = 'd8           // numar de biti ai numaratorului
) (
input                     clk           , // semnal de ceas
input                     rst_n         , // semnal de reset asincron, activ low
input                     count_up_dwn  ,
input                     cen           ,
input                     load          , // comanda presetare, activa high, 
                                          // prioritara fata de numarare
input      [WIDTH  -1:0]  data_preset   , // data presetare
output     [1<<WIDTH -1:0]  count_dec     , // iesire numarator
output                    carry_out       // transport de iesire
);
reg counter_out ;
always @(posedge clk or negedge rst_n) 
if (~rst_n  )   counter_out <= {WIDTH{1'b0}}; else  // resetare asincrona
if (load    )   counter_out <= data_preset; else
if (cen == 1)   begin 
if (count_up_dwn == 1)   counter_out <= counter_out + 1; 
else counter_out <= counter_out - 1; // presetare
end 
assign count_dec = 1<<counter_out;


assign carry_out = (1<<WIDTH) - 1;  // valoarea curenta este cea maxima, 11...1

endmodule // counter_preset


