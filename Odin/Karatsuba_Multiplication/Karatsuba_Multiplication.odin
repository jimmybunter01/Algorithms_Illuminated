package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:math"
import "core:slice"
import "core:strings"
import "core:unicode/utf8"

main :: proc() {
    num_1 := os.args[1]
    num_2 := os.args[2]

    karatsuba(num_1, num_2)
}

size_base10 :: proc(num: f64) -> f64 {
    return math.floor(math.log10(num)) + 1
}

split_num_string :: proc(num_string: [?]string, index_to_split_at : int) -> (string, string) {
    num_1_slice := utf8.string_to_runes(num_string)
    
    first_part := num_1_slice[:index_to_split_at]
    second_part := num_1_slice[index_to_split_at:]

    first_part_string := strings.concatenate()


    return first_part
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
    m2 := u64(math.floor(m / 2))

    num_1_length := len(num_1)
    num_2_length := len(num_2)

    num_1_numbers := strings.split(num_1, "")
    num_2_numbers := strings.split(num_2, "")
    
    split_num_string(num_1_numbers)


    return 0
}