`timescale 1ns/1ps

module tb_counter;
    reg clk;
    reg rst;
    wire [3:0] q;

    // Instanza del modulo counter
    counter uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Generatore di clock
    initial clk = 0;
    always #5 clk = ~clk;  // clock con periodo di 10 ns

    // Stimoli
    initial begin
        $dumpfile("dump.vcd");   // file per GTKWave
        $dumpvars(0, tb_counter);

        rst = 1;                  // inizio con reset
        #10 rst = 0;              // rimuove reset dopo 10 ns
        #100 $finish;             // termina simulazione dopo 100 ns
    end
endmodule

