require 'bsearch'
# This file contains the methods necessary for creating the public and private keys for encryption and decryption, respectively, using RSA

# Generates large random integers for generating p and q.
class RSA_Keys
    def self.generate_prime_integers
        rand_num = rand(1000...1000000000)
        already_in = []
        while self.prime?(rand_num)
            already_in << rand_num
            while already_in.include?(rand_num)
                rand_num = rand(1000...1000000000)
            end
        end
        rand_num
    end

    def self.prime?(n)
        return false if n < 2
        (2...n).none? {|factor| n % factor == 0}
    end

    def initialize(p, q)
        @p = p
        @q = q
    end

    def modulus
        @p * @q
    end

    def totient
        (@p-1) * (@q-1)
    end

    def factors(n)
        factors = []
        (2..n).each do |factor|
            factors << factor if n % factor == 0
        end

        factors
    end

    def co_prime?(a, b)
        a_factors = factors(a)
        b_factors = factors(b)

        if a_factors.length > b_factors.length
            biggest = a_factors
            smallest = b_factors        
        else
            biggest = b_factors
            smallest = a_factors  
        end

        (0...smallest.length).none?{|i| smallest[i] == biggest[i]}
    end

    def e(totient)

    end
end

num = RSA_Keys.generate_prime_integers
p num
test = RSA_Keys.new(0,1)
p test.factors(num)
