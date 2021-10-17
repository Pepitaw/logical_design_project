`timescale 1ns/1ns
module testbench;
reg clk, reset, move,pounch;
wire heavy_pounch,teleport,move1,move2,pounch1,pounch2,move_pulse,pounch_pulse;
wire [3:0] state;
wire [2:0] skill;
operation test( .clk(clk), .reset(reset), .move(move), .pounch(pounch), .skill(skill),.heavy_pounch(heavy_pounch),.teleport(teleport),.state(state),.move1(move1),.move2(move2),.pounch1(pounch1),.pounch2(pounch2),.move_pulse(move_pulse),.pounch_pulse(pounch_pulse) );
parameter clkper = 25;
initial
begin
	clk=1;
end

always
begin
	#(clkper/2)	clk=~clk;
end

initial
begin
	reset = 1'b0; //initial
	move = 1'b0;
	pounch = 1'b0;
	#155
	reset = 1'b1;
	#50

	move = 1'b1; //skill 0 teleport /s7
	#50
	move = 1'b0;
	#50
	move = 1'b1;
	#50
	move = 1'b0;
	#50
	move = 1'b1;
	#50
	move = 1'b0;
	#100
	
	move = 1'b1; //skill 1 /s8
	#50
	move = 1'b0;
	#50
	move = 1'b1;
	#50
	move = 1'b0;
	#50
	pounch = 1'b1;
	#50
	pounch = 1'b0;
	#100 

	move = 1'b1; //skill 2 /s9
	#50
	move = 1'b0;
	#50
	pounch = 1'b1;
	#50
	pounch = 1'b0;
	#50
	move = 1'b1;
	#50
	move = 1'b0;
	#100 

	move = 1'b1; //skill 3 /s10
	#50
	move = 1'b0;
	#50
	pounch = 1'b1;
	#50
	pounch = 1'b0;
	#50
	pounch = 1'b1;
	#50
	pounch = 1'b0;
	#100 

	pounch = 1'b1; //skill 4 /s11
	#50
	pounch = 1'b0;
	#50
	move = 1'b1;
	#50
	move = 1'b0;
	#50
	move = 1'b1;
	#50
	move = 1'b0;
	#100 

	pounch = 1'b1; //skill 5 /s12
	#50
	pounch = 1'b0;
	#50
	move = 1'b1;
	#50
	move = 1'b0;
	#50
	pounch = 1'b1;
	#50
	pounch = 1'b0;
	#100 

	pounch = 1'b1; //skill 6 /s13
	#50
	pounch = 1'b0;
	#50
	pounch = 1'b1;
	#50
	pounch = 1'b0;
	#50
	move = 1'b1;
	#50
	move = 1'b0;
	#100 

	pounch = 1'b1; //skill 7 teleport /s14
	#50
	pounch = 1'b0;
	#50
	pounch = 1'b1;
	#50
	pounch = 1'b0;
	#50
	pounch = 1'b1;
	#50
	pounch = 1'b0;
	#100 


$stop;
//.............................................
end
endmodule

