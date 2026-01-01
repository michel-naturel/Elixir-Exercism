#include "difference_of_squares.h"

unsigned int difference_of_squares(unsigned int number) {

    return square_of_sum(number) - sum_of_squares(number);
    
}

unsigned int square_of_sum(unsigned int number) {    
    unsigned int square_of_sum = 0;
    unsigned int n = number;
    while (n > 0) {
        square_of_sum = square_of_sum + n;
        n = n - 1;
    }
    
    square_of_sum = square_of_sum * square_of_sum;
    return square_of_sum;
}

unsigned int sum_of_squares(unsigned int number) {
    unsigned int sum_of_squares = 0;
    unsigned int m = number;
    while (m > 0) {
        sum_of_squares = sum_of_squares + m * m;
        m = m - 1;
    }
    return sum_of_squares;
}
