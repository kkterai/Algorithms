def lcs(string_1, string_2)

    m = string_1.length
    n = string_2.length

    # declaring the array for storing dynamic program values
    l = Array.new(m+1) { Array.new(n+1) }

    #Build l[m][n] in bottom up fashion
    #Note: l[i][j] will contain length of LCS of string_1[0..i-1] and string_2[0..j-1]
    for i in 0..m
      for j in 0..n
        if i == 0 || j == 0
            l[i][j] = 0

        elsif string_1[i-1] == string_2[j-1]
            l[i][j] = l[i-1][j-1]+1
        else
            l[i-1][j] > l[i][j-1] ? l[i][j] = l[i-1][j] : l[i][j] = l[i][j-1]
        end
      end
    end
    # l[m][n] contains the length of LCS of string_1[0..n-1] & string_2[0..m-1]
  index = l[m][n]

  # Create a character array to store the lcs string
  lcs = Array.new(index)

  for i in m.downto(0)
    for j in n.downto(0)
      while lcs[0] == nil
      # If string values are equivalent, then
      # corresponding character is part of LCS
        if string_1[i-1] == string_2[j-1]
          lcs[index-1] = string_1[i-1]
              i-=1
              j-=1
              index-=1
        # If not, then find the larger of two values at top and left;
        # go in the direction of the larger value.
        elsif l[i-1][j] > l[i][j-1]
            i-=1
        else #Accomodates either direction if equal.
            j-=1
        end
      end
      return   "LCS for input Sequences " + "#{string_1}" + " and " + "#{string_2}" + " is " + "#{lcs.join("")} of length #{lcs.size}"
    end
  end
end

# X = "ABCDGH"
# Y = "AEDFHR"
# print lcs(X, Y) #=> "LCS for input Sequences ABCDGH and AEDFHR is ADH of length 3"

X = "AGGTAB"
Y = "GXTXAYB"
print lcs(X, Y) #=> "LCS for input Sequences AGGTAB and GXTXAYB is GTAB of length 4"
