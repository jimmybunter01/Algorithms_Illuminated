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

    result := int(karatsuba(num_1, num_2))
}

size_base10 :: proc(num: f64) -> f64 {
    return math.floor(math.log10(num)) + 1
}

num_to_string :: proc(number: int) -> string {
    initial_buffer: [64]byte
    result := strconv.itoa(initial_buffer[:], number)
    output := strings.clone_from_bytes(initial_buffer[:])
    return output
}

karatsuba :: proc(num_1: string, num_2: string) -> f64 {
    number_1, ok_1 := strconv.parse_f64(num_1)
    number_2, ok_2 := strconv.parse_f64(num_2)
    
    if number_1 < 10 || number_2 < 10 {
        return number_1 * number_2
    }

    n := max(size_base10(number_1), size_base10(number_2))
    n_half := f64(math.ceil(n / 2))
    modulus := int(math.pow_f64(10, n_half))
    
    a := math.floor(number_1 / math.pow_f64(10, n_half))
    b := f64(int(number_1) % modulus)
    c := math.floor(number_2 / math.pow_f64(10, n_half))
    d := f64(int(number_2) % modulus)

    a_plus_b_string := num_to_string(int(a + b))
    c_plus_d_string := num_to_string(int(c + d))

    ac := karatsuba(num_to_string(int(a)), num_to_string(int(c)))
    bd := karatsuba(num_to_string(int(b)), num_to_string(int(d)))
    ad_plus_bc := karatsuba(a_plus_b_string, c_plus_d_string) - bd - ac

    result := (math.pow_f64(10, n_half * 2) * ac) + (math.pow_f64(10, n_half) * ad_plus_bc) + bd    
    return result
}