def length_list(list)
    return list.length
end

def length_handle(handle)
    return handle.length-1
end

def compare_length_handle_shortest(handle_1, handle_2)
    length_1 = length_handle(handle_1)
    length_2 = length_handle(handle_2)
    if length_1 < length_2
        return handle_1
    else
        return handle_2
    end
end

def compare_length_handle_largest(handle_1, handle_2)
    length_1 = length_handle(handle_1)
    length_2 = length_handle(handle_2)
    if length_1 > length_2
        return handle_1
    else
        return handle_2
    end
end

def shortest_handle(list)
    shortest_name = list[0]
    shortest_length = length_handle(shortest_name)
    max = length_list(list)
    for i in (1...max)
        handle = list[i]
        shortest_name = compare_length_handle_shortest(shortest_name, handle)
    end
    shortest_length = length_handle(shortest_name)
    puts "Le plus petit handle est: '#{shortest_name}' de taille: #{shortest_length}"
    return shortest_name
end

def largest_handle(list)
    largest_name = list[0]
    largest_length = length_handle(largest_name)
    max = length_list(list)
    for i in (1...max)
        handle = list[i]
        largest_name = compare_length_handle_largest(largest_name, handle)
    end
    largest_length = length_handle(largest_name)
    puts "Le plus grand handle est: '#{largest_name}' de taille: #{largest_length}"
    return largest_name
end

def exact_length_count(list, number)
    count = 0
    max = length_list(list)
    for i in (0...max)
        handle = list[i]
        length = length_handle(handle)
        if length == number
            count += 1
        end
    end
    puts "Il y a au total #{count} handle(s) de taille #{number}"
    return count
end

def first_letter(h)
    return h[1]
end

def is_uppercase?(letter)
    return letter != letter.downcase
end

def uppercase_count(list)
    count = 0
    max = length_list(list)
    for i in (0...max)
        handle = list[i]
        first_letter = first_letter(handle)
        if is_uppercase?(first_letter)
            count += 1
        end
    end
    puts "Il y a au total #{count} handle(s) commençant par une majuscule"
    return count
end

def sort_alphabetically(list)
    return list.sort!{|a, b| a.upcase <=> b.upcase}
end

def sort_length(list)
    return list.sort!{|a, b| length_handle(a) <=> length_handle(b)}
end

def position(list, handle)
    return list.find_index(handle)
end

def partition_length(list, number)
    new_list = []
    max = length_list(list)
    for i in (0...max)
        handle = list[i]
        length = length_handle(handle)
        if length == number
            new_list = new_list.push(handle)
        end
    end
    return new_list
end

def partition_empty_check(list)
    if list != []
        length = length_handle(list[0])
        puts "Voici la liste des handles de taille #{length}:"
        puts list
    end
end

def repartition(list)
    list_sorted = sort_length(list)
    shortest_handle = list_sorted[0]
    largest_handle = list_sorted[-1]
    min = length_handle(shortest_handle)
    max = length_handle(largest_handle)
    for i in (min..max)
        list_partition = partition_length(list, i)
        partition_empty_check(list_partition)
    end
    return nil
end