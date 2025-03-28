//
// find_first.v
// 
// project  : RISCV_ACC
// brief    : Combinatoric find-first, from LSb to MSb
// author   : Etay Sela
// date     : 28/03/2025
//
// detailed : 1. Combinatoric find-first, from LSb to MSb
//          : 2. Parameterizable data width (DAT_W)
//          : 3. Optional parameter for registering the output IF (SMPL_OUT_OPT)
// 

module find_first #(
    // User Parameters //
    // --------------- //
    parameter int       DAT_W        = 8    , // Data width [bits]
    parameter bit [0:0] SMPL_OUT_OPT = 1'b1   // Optional registering of output IF
)(
    // General Signals //
    // --------------- //
    input  logic             clk     , // clock signal
    input  logic             rst_n   , // active low reset

    // Input Controls // 
    // -------------- //
    input  logic             vld_in  , // input valid indicator

    // Input Data // 
    // ---------- //
    input  logic [DAT_W-1:0] dat_in  , // input data

    // Output Controls // 
    // --------------- // 
    output logic             vld_out , // output valid indicator

    // Output Data // 
    // ----------- //
    output logic             dat_out   // output data
);

// Internal Wires // 
// -------------- //
logic [DAT_W-1:0] first_bit_oh ; // one-hot vector, the first bit in dat_in (starting from LSb)
/*
    NOTE that signals are named with a meaningful name
    and can end with some common suffix further explaining 
    their usage and rules. Some common examples:
        1. _e - this is an enum type
        2. _s - this is a struct
        3. _oh - this is a one-hot vector
        4. my_signal_dX - this is my_signal delayed by X clock cycles
        5. my_signal_cX - this is my_signal early by X clock cycles
    You can choose your own conventions as long as they are consistent
    and document somwhere
*/

// Internal Registers //
// ------------------ //
/* 
    NOTE none in this case, but this is where I
    would normally write them. Also note that I use
    the 'logic' type for both registers and wires 
    instead of 'net' (for wire) and 'reg' (for a register).
    I recommend you do that as well as the analogy between the 
    'net' and 'reg' types to the actual physical and graspable
    constructs of wire and register was always less than perfect
    in verilog to say the least. 
*/

// Generating 'Find-First' Arbiter //
// ------------------------------- //
genvar DAT_IDX ; 
generate;
    // Setting Initial Conditions // 
    assign first_bit_oh[0] = dat_in[0] ; 
    // Generating the rest of the bits
    for (DAT_IDX=1; DAT_IDX<DAT_W; DAT_IDX++) begin : gen_find_first_loop
        assign first_bit_oh[DAT_IDX] = dat_in[DAT_IDX-1] & ~(|(first_bit_oh[DAT_IDX-1:0])) ; 
        // first_bit_oh[i] is asserted IFF:
        // 1. dat_in[i] is high
        // 2. none of the previous bits in first_bit_oh (bits i-1:0) are asserted
    end
endgenerate
/*
    NOTE how I try to avoid writing the above code in a "SW-like approach". 
    An example of a bad code can look something like this:

        int i = 0 ;
        first_bit_oh = DAT_W'(0) ; 
        while ((!dat_in[i]) & (i<DAT_W))
            i++ ; 
        if (i!=DAT_W) // found a '1'
            first_bit_oh[i] = 1'b1 ; 
    
    While this might compile, it is unclear what is the resulting 
    HW from this way of writing. In addition to that, some synthesis
    tools might have trouble converting this to HW even if the compiler
    you are working with does not issue an error. 
*/

// Output Interface //
// ---------------- //
generate 
    if (SMPL_OUT_OPT) begin : gen_output_sample_cond
        // Sample output valid // 
        always_ff @(posedge clk) begin 
        /* 
            NOTE I normally write sync reset, 
            you can choose whichever 
        */
            if (!rst_n) // reset
                vld_out <= DAT_W'(0) ; 
            else // sample 
                vld_out <= vld_in ; 
        end 
        // Sample output data // 
        always_ff @(posedge clk) begin 
            if (!rst_n) // reset
                dat_out <= DAT_W'(0) ; 
            else if (vld_in) // sample 
                dat_out <= first_bit_oh ; 
            /* 
                NOTE that here the following lines:

                    else 
                        dat_out <= dat_out ; 
                
                are implicit. Also, consider what are 
                the pros and cons of adding the "else if"
                statement to our code as opposed to sampling
                the first_bit_oh signal every clock edge
            */
        end 
        /* 
            NOTE always_ff constructs are usually 
            kept clean from all logic (except for 
            maybe an enable like in the example above)
        */ 
    end
    else begin : gen_no_sample_cond 
        // Simple assign to connect between the results to the output IF // 
        assign dat_out = first_bit_oh ; 
        assign vld_out = vld_in ; 
    end
endgenerate

endmodule
