`timescale  1ns/1ns   //仿真的单位/仿真的精度

module ip_2port_ram_tb();

parameter T = 20;

reg          sys_clk;
reg          sys_rst_n;   

initial begin
    sys_clk = 1'b0;
    sys_rst_n = 1'b0;
    #(T+1)
    sys_rst_n = 1'b1;
end

always #(T/2) sys_clk = ~sys_clk; 

ip_2port_ram u_ip_2port_ram(
    .sys_clk            (sys_clk  ), 
    .sys_rst_n          (sys_rst_n)
    );
    
endmodule


