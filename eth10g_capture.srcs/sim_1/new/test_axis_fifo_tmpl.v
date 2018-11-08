
module test_axis_fifo_tmpl(output DONE);

parameter TEST_RANDOM_HS = 1;
parameter SIZE_PARAM = 16;
parameter DELAY = 2;
parameter VERBOSE = 0;
parameter USE_IMPL_REG = 0;

localparam SIZE = (1 << SIZE_PARAM);
localparam CHG_DELAY = 5;

reg CLK;
reg RESETN;
reg [31:0] IVAL_TDATA;
reg IVAL_TVALID;
wire IVAL_TREADY;
wire [31:0] OVAL_TDATA;
wire OVAL_TVALID;
reg OVAL_TREADY;

reg [$clog2(CHG_DELAY)-1:0] ival_chg_delay;
reg [$clog2(CHG_DELAY)-1:0] oval_chg_delay;
reg [31:0] term_cnt;

reg [31:0] iarr[0:65535];
reg [31:0] oarr[0:65535];
reg [15:0] iarr_offset;
reg [15:0] oarr_offset;
reg [15:0] data_count;
reg mismatch;
reg overrun;
reg underrun;

assign DONE = term_cnt > SIZE + 100;

initial begin
    CLK = 0;
    forever CLK = #1 !CLK;
end

initial begin
    RESETN = 0;
    #10;
    RESETN = 1;
end

initial begin
    IVAL_TVALID = 1;
    OVAL_TREADY = 1;
    iarr_offset = 0;
    oarr_offset = 0;
    data_count = 0;
    mismatch = 0;
    overrun = 0;
    underrun = 0;
    term_cnt = 0;
end

always @(posedge CLK) begin
    if (!RESETN) begin
        IVAL_TDATA <= 32'h00010001;
        ival_chg_delay = $random % CHG_DELAY;
        oval_chg_delay = $random % CHG_DELAY;
    end else begin
        IVAL_TDATA[15:0] <= IVAL_TDATA[15:0] + 1;
        if (IVAL_TDATA[15:0] == 16'hffff) begin
            IVAL_TDATA[31:16] <= IVAL_TDATA[31:16] + 1;
        end
        if (IVAL_TVALID && IVAL_TREADY) begin
            if (VERBOSE) begin
                $display("i %02x %04x", iarr_offset, IVAL_TDATA);
            end
            if (((iarr_offset + 1) & 65535) == oarr_offset) begin
                underrun <= 1;
                $display("underrun %02x %02x", iarr_offset, oarr_offset);
                $stop;
            end
            iarr[iarr_offset] <= IVAL_TDATA;
            iarr_offset <= iarr_offset + 1;
        end
        if (OVAL_TVALID && OVAL_TREADY) begin
            if (VERBOSE) begin
                $display("o %02x %04x", oarr_offset, OVAL_TDATA);
            end
            if (oarr_offset == iarr_offset) begin
                overrun <= 1;
                $display("overrun %02x %02x", oarr_offset, iarr_offset);
                $stop;
            end
            if (iarr[oarr_offset] !== OVAL_TDATA) begin
                mismatch <= 1;
                $display("%m mismatch %04x %04x offset=%02x", iarr[oarr_offset], OVAL_TDATA, oarr_offset);
                $stop;
            end
            oarr[oarr_offset] <= OVAL_TDATA;
            oarr_offset <= oarr_offset + 1;
        end
        if (TEST_RANDOM_HS) begin
            if (ival_chg_delay == 0) begin
                IVAL_TVALID <= !IVAL_TVALID;
                ival_chg_delay <= $random % CHG_DELAY;
            end else begin
                ival_chg_delay <= ival_chg_delay - 1;
            end
            if (oval_chg_delay == 0) begin
                OVAL_TREADY <= !OVAL_TREADY;
                oval_chg_delay <= $random % CHG_DELAY;
            end else begin
                oval_chg_delay <= oval_chg_delay - 1;
            end
        end
        data_count <= data_count + 1;
        if (data_count == 10000 && term_cnt == 0) begin
            $display("%m set term_cnt");
            term_cnt <= 1;
        end
        if (term_cnt > 0) begin
            data_count <= 10000;
            IVAL_TVALID <= 0;
            OVAL_TREADY <= 1;
            term_cnt <= term_cnt + 1;
            if (term_cnt == SIZE + 100) begin
                if (iarr_offset != oarr_offset) begin
                    $display("STOP %m %d %d rnd=%1d dly=%1d len=%1d", iarr_offset, oarr_offset, TEST_RANDOM_HS, DELAY, SIZE_PARAM);
                    $stop;
                end
                $display("TEST PASSED %m rnd=%1d dly=%1d len=%1d %1d/%1d", TEST_RANDOM_HS, DELAY, SIZE_PARAM, oarr_offset, data_count);
            end
        end
    end
end

if (USE_IMPL_REG) begin
    axis_fifo_reg #(.WIDTH_DATA(32), .FIFO_SIZE(SIZE_PARAM)) axis_fifo_reg_i(
        .CLK(CLK), .RESETN(RESETN), .IV_TVALID(IVAL_TVALID), .IV_TDATA(IVAL_TDATA), .IV_TREADY(IVAL_TREADY),
        .OV_TVALID(OVAL_TVALID), .OV_TDATA(OVAL_TDATA), .OV_TREADY(OVAL_TREADY));
end else begin
    axis_fifo #(.WIDTH_DATA(32), .FIFO_SIZE_L2(SIZE_PARAM), .FIFO_DELAY(DELAY)) axis_fifo_i(
        .CLK(CLK), .RESETN(RESETN), .IV_TVALID(IVAL_TVALID), .IV_TDATA(IVAL_TDATA), .IV_TREADY(IVAL_TREADY),
        .OV_TVALID(OVAL_TVALID), .OV_TDATA(OVAL_TDATA), .OV_TREADY(OVAL_TREADY));
end

endmodule
