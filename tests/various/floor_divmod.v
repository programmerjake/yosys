module uut;
	wire [7:0] a = $anyconst, b = $anyconst, fdiv, fmod, a2;
	assign a2 = b * fdiv + fmod;

	\$divfloor #(
		.A_WIDTH(8),
		.B_WIDTH(8),
		.A_SIGNED(1),
		.B_SIGNED(1),
		.Y_WIDTH(8),
	) fdiv_m (
		.A(a),
		.B(b),
		.Y(fdiv)
	);

	\$modfloor #(
		.A_WIDTH(8),
		.B_WIDTH(8),
		.A_SIGNED(1),
		.B_SIGNED(1),
		.Y_WIDTH(8),
	) fmod_m (
		.A(a),
		.B(b),
		.Y(fmod)
	);

	always @* begin
		assume(b != 0);
		assert(a == a2);
	end
endmodule
