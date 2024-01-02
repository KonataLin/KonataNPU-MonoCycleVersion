import "DPI-C" function void ebreak();
module EBreak(
	input wire clk,
	input wire [1:0] signal
);
always @(posedge clk) begin
	if (signal == 2) begin
    	ebreak();
    end
end
endmodule
