#!/usr/bin/env ruby

require 'nmatrix'

class Money
  
  def initialize nmatrix
    @a = nmatrix
  end

  def minimize
    minimized = @a - @a.transpose
    minimized.triu(-1)
  end

  def answer
    min = minimize
    dim = @a.rows
    arr = Array.new
    (0..dim-1).each do |i|
      arr << min.slice(0..i,i+1..dim-1).reduce(:+)
    end
    vals = arr.compact
    matrix = NMatrix.zeroes(dim)

    vals.each_with_index do |val,i|
      matrix[i,i+1] = val
    end

    minmat = matrix.to_a
    len = minmat.count - 1

    ul = minmat[0][len-1]
    br = minmat[1][len]
    cr = minmat[0][len]

    if cr == 0
      if ul == br
        minmat[0][len] = ul
        minmat[1][len] = 0
        minmat[0][len-1] = 0
      elsif ul > br
        minmat[0][len] = br
        minmat[1][len] = 0
        minmat[0][len-1] -= br
      elsif ul < br
        minmat[0][len] = ul
        minmat[1][len] -= ul
        minmat[0][len-1] = 0
      end
    end
    minmat
  end
end
