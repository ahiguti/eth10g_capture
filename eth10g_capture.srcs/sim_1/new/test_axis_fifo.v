module test_axis_fifo();

localparam NUM_UREG = 2;
localparam NUM_RAND = 2;
localparam NUM_DELAY = 3;
localparam NUM_SZ = 8;
localparam NUM = NUM_UREG * NUM_RAND * NUM_DELAY * NUM_SZ;
wire [NUM-1:0] done;

always @* begin
    if (&done) begin
        $finish;
    end
end

genvar h, i, j, k;
generate
for (h = 0; h < NUM_UREG; h = h + 1) begin :gen_h
for (i = 0; i < NUM_RAND; i = i + 1) begin :gen_i
for (j = 0; j < NUM_DELAY; j = j + 1) begin :gen_j
for (k = 0; k < NUM_SZ; k = k + 1) begin :gen_k
test_axis_fifo_tmpl
    #(.USE_IMPL_REG(h), .TEST_RANDOM_HS(i), .DELAY(j), .SIZE_PARAM(k + 1))
    i0(done[((h * NUM_RAND + i) * NUM_DELAY + j) * NUM_SZ + k]);
end
end
end
end
endgenerate

//test_axis_fifo_tmpl #(.TEST_RANDOM_HS(1), .DELAY(0), .SIZE_L2(3)) i0(done[0]);

endmodule
