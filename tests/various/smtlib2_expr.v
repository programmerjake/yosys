module uut;
    wire [7:0] a = $anyconst, b = $anyconst, add, add2, sub, sub2;
    assign add2 = a + b;
    assign sub2 = a - b;

    \$smtlib2_expr #(
        .A_WIDTH(16),
        .Y_WIDTH(8),
        .EXPR("(bvadd ((_ extract 15 8) A) ((_ extract 7 0) A))")
    ) add_expr (
        .A({a, b}),
        .Y(add)
    );

    \$smtlib2_expr #(
        .A_WIDTH(16),
        .Y_WIDTH(8),
        .EXPR("(bvadd ((_ extract 15 8) A) (bvneg ((_ extract 7 0) A)))")
    ) sub_expr (
        .A({a, b}),
        .Y(sub)
    );

    always @* begin
        assert(add == add2);
        assert(sub == sub2);
    end
endmodule
