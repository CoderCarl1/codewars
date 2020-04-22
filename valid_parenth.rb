# Write a function called that takes a string of parentheses, and determines if the order of the parentheses is valid. The function should return true if the string is valid, and false if it's invalid.
# Examples

# "()"              =>  true
# ")(()))"          =>  false
# "("               =>  false
# "(())((()())())"  =>  true

# Constraints

# 0 <= input.length <= 100

# Along with opening (() and closing ()) parenthesis, input may contain any valid ASCII characters. Furthermore, the input string may be empty and/or not contain any parentheses at all. Do not treat other forms of brackets as parentheses (e.g. [], {}, <>).

def valid_parentheses(string)
    arr = string.scan(/\(|\)/) #Scan to put the result of REGEX to check for ONLY ( or )
    return true if arr.length == 0 # challege requires true if no Parenthesis at all

    arr_sort = arr.group_by(&:itself).each_with_object({}){ |(k,v), hash| hash[k] = v.size} # return the number of each ( and ) inside a hash
    equal_check = arr_sort["("] == arr_sort[")"] ? true : false #checks that the values are equal to each other
    
    #The loop will find the first closing bracket and compare to the previous char to comfirm if it is a complete pair.
    #if complete, the 2 will be deleted and the loop repeated.
    while arr.length > 0 && equal_check == true

        index1 = arr.find_index {|value| value == ")"}.to_i
        return false if index1 == 0

        index2 = arr[index1 - 1].to_i

        if arr[index2] == "("
            arr.delete_at(index1)
            arr.delete_at(index2)

        end
        
    end

    arr.length == 0 ? true : false
end
    

p valid_parentheses("  (") #false
p valid_parentheses(")test") #false
p valid_parentheses("") #true
p valid_parentheses("hi())(") # false
p valid_parentheses("hi(hi)()") #true