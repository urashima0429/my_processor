module flush(
	input flush0, flush1, flush2,flush3,
	output flush);

	assign flush = flush0 | flush1 | flush2 | flush3;
	
endmodule
