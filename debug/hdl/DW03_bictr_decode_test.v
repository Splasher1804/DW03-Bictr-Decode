//---------------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Proiect     : Limbaje de descriere hardware
// Autor       : Miu Mihai Florian
// Data        : 3/28/2022
//---------------------------------------------------------------------------------------
// Descriere   : DW03_bictr_decode_inst
//---------------------------------------------------------------------------------------

module DW03_bictr_decode_test ;
localparam WIDTH    = 'd8         ; // numar de biti ai numaratorului

wire                clk           ; // semnal de ceas
wire                rst_n         ; // semnal de reset asincron, activ low
wire                count_up_dwn  ;// comanda de numarare, activa high
wire                load          ;
wire                cen           ; // comanda presetare, activa high, 
                                    // prioritara fata de numarare
wire [WIDTH  -1:0]  data_preset   ; // data presetare
wire [1<<WIDTH -1:0]  count_dec   ; // iesire numarator
wire                carry_out     ; // transport de iesire

DW03_bictr_decode #(
.WIDTH       (WIDTH       )
) DUT_DW03_bictr_decode (  
.clk          (clk         ),
.rst_n        (rst_n       ),
.count_up_dwn (count_up_dwn),
.load         (load        ),
.cen          (cen         ),
.data_preset  (data_preset ),
.count_dec  (count_dec ),
.carry_out    (carry_out   )
);  
  
ck_rst_tb i_ck_rst_tb ( 
.clk         (clk         ),
.rst_n       (rst_n       )
);  
  
DW03_bictr_decode_tb  #( 
.WIDTH       (WIDTH       )
) i_DW03_bictr_decode_tb ( 
.clk          (clk         ),
.rst_n        (rst_n       ),
.count_up_dwn (count_up_dwn),
.load         (load        ),
.cen          (cen         ),
.data_preset  (data_preset )
);

endmodule // counter_preset_test
