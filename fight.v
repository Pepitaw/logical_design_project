`timescale 1ns/1ns
module operation(clk,reset,move,pounch,skill,heavy_pounch,teleport,state,move1,move2,pounch1,pounch2,move_pulse,pounch_pulse);
input clk,reset,move,pounch;
output reg heavy_pounch,teleport,move1,move2,pounch1,pounch2;
output reg [2:0] skill;
output move_pulse,pounch_pulse;
parameter s0 = 4'b0000,s1 = 4'b0001,s2 = 4'b0010,s3 = 4'b0011,s4 = 4'b0100,s5 = 4'b0101,s6 = 4'b0110,s7 = 4'b0111,s8 = 4'b1000,s9 = 4'b1001,s10 = 4'b1010,s11 = 4'b1011,s12 = 4'b1100,s13 = 4'b1101,s14 = 4'b1110;

output reg [3:0]state;
//reg move1,move2,pounch1,pounch2;
wire move_pulse,pounch_pulse;
assign move_pulse = move1 & ~move2;
assign pounch_pulse = pounch1 & ~pounch2;

always@(posedge clk or negedge reset)
begin
	if(!reset)begin
		move1<=#1 1'b0;
		move2<=#1 1'b0;
		pounch1<=#1 1'b0;
		pounch2<=#1 1'b0;
	end
	else begin
		move1<= #1 move;
		move2<= #1 move1;
		pounch1<= #1 pounch;
		pounch2<= #1 pounch1;
	end
end

always@(posedge clk or negedge reset)
begin
	if(!reset)begin
		state<= #1 s0;
		skill<=#1 3'bZ;	
		teleport <= #1 1'b0;
		heavy_pounch <= #1 1'b0;
	end
	else
		case(state)
			s0:begin
				skill <= #1 3'bZ;
				teleport <= #1 1'b0;
				heavy_pounch <= #1 1'b0;
				if(move_pulse==1'b1) //move
					state <=#1 s1;
				if(pounch_pulse==1'b1) //pounch
					state <=#1 s2;
			end
			s1:begin
				if(move_pulse==1'b1) //move
					state <=#1 s3;
				if(pounch_pulse==1'b1) //
					state <=#1 s4;
			end
			s2:begin
				if(move_pulse==1'b1)
					state <=#1 s5;
				if(pounch_pulse==1'b1)
					state <=#1 s6;
			end
			s3:begin
				if(move_pulse==1'b1)
					state <=#1 s7;
				if(pounch_pulse==1'b1)
					state <=#1 s8;
			end
			s4:begin
				if(move_pulse==1'b1)
					state <=#1 s9;
				if(pounch_pulse==1'b1)
					state <=#1 s10;
			end
			s5:begin
				if(move_pulse==1'b1)
					state <=#1 s11;
				if(pounch_pulse==1'b1)
					state <=#1 s12;
			end
			s6:begin
				if(move_pulse==1'b1)
					state <=#1 s13;
				if(pounch_pulse==1'b1)
					state <=#1 s14;
			end
			s7:begin
				skill <= #1 3'b000; //skill 0
				teleport <= #1 1'b1;
				state <= #1 s0;
			end
			s8:begin
				skill <= #1 3'b001; //skill 1
				state <= #1 s0;
			end
			s9:begin
				skill <= #1 3'b010; //skill 2
				state <= #1 s0;
			end
			s10:begin
				skill <= #1 3'b011; //skill 3
				state <= #1 s0;
			end
			s11:begin
				skill <= #1 3'b100; //skill 4
				state <= #1 s0;
			end
			s12:begin
				skill <= #1 3'b101; //skill 5
				state <= #1 s0;
			end
			s13:begin
				skill <= #1 3'b110; //skill 6
				state <= #1 s0;
			end
			s14:begin
				skill <= #1 3'b111; //skill 7
				heavy_pounch <= #1 1'b1;
				state <= #1 s0;
			end
		default:begin
			state <= #1 s0;
			skill <= #1 3'bZ;
			heavy_pounch<=#1 1'b0;	
			teleport <= #1 1'b0;
		end
		endcase
end
endmodule

