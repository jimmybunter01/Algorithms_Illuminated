package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:math"

main :: proc() {
    num_1 := os.args[1]
    num_2 := os.args[2]

    karatsuba(num_1, num_2)
}

size_base10 :: proc(num: f64) -> f64 {
    return math.floor(math.log10(num)) + 1
}

// x * y = 10^(n) * ac + 10^(n/2) * (ad + bc) + bd
// Recursively Compute:
//  1) ac
//  2) bd
//  3) (a+b)(c+d) 
// Gauss Trick = 3 - 1- 2 --> ad+bc

karatsuba :: proc(num_1: string, num_2: string) -> u64 {
    int_1, ok_1 := strconv.parse_u64(os.args[1])
    int_2, ok_2 := strconv.parse_u64(os.args[2])
    
    if int_1 < 10 || int_2 < 10 {
        return int_1 * int_2
    }

    m := max(size_base10(f64(int_1)), size_base10(f64(int_2)))
    m2 := math.floor(m / 2)

    fmt.println(m)
    fmt.println(m2)

    


    return 0
}