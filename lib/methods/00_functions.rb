# fonction 1 - renvoie la taille de l'array
def length_array(array)
    return array.length
end

# renvoie la taille du handle, en ignorant le '@' d'où le -1
def length_handle(handle)
    return handle.length-1
end

# compare 2 handsles, et renvoie le plus petit des 2
def compare_length_handle_shortest(handle_1, handle_2)
    length_1 = length_handle(handle_1)
    length_2 = length_handle(handle_2)
    if length_1 < length_2
        return handle_1
    else
        return handle_2
    end
end

# compare 2 handsles, et renvoie le plus grand des 2
def compare_length_handle_largest(handle_1, handle_2)
    length_1 = length_handle(handle_1)
    length_2 = length_handle(handle_2)
    if length_1 > length_2
        return handle_1
    else
        return handle_2
    end
end

# fonction 2 - renvoie le plus petit handle de l'array
def shortest_handle(array)
    shortest_name = array[0]
    shortest_length = length_handle(shortest_name)
    array.each do |handle|
        shortest_name = compare_length_handle_shortest(shortest_name, handle)
    end
    shortest_length = length_handle(shortest_name)
    puts "Le plus petit handle est: '#{shortest_name}' de taille: #{shortest_length}"
    return shortest_name
end

# renvoie le plus grand handle de l'array
def largest_handle(array)
    largest_name = array[0]
    largest_length = length_handle(largest_name)
    array.each do |handle|
        largest_name = compare_length_handle_largest(largest_name, handle)
    end
    largest_length = length_handle(largest_name)
    puts "Le plus grand handle est: '#{largest_name}' de taille: #{largest_length}"
    return largest_name
end

# fonction 3 - renvoie le nombre total d'élements de l'array qui sont de taille number
def exact_length_count(array, number)
    count = 0
    array.each do |handle|
        length = length_handle(handle)
        if length == number
            count += 1
        end
    end
    puts "Il y a au total #{count} handle(s) de taille #{number}"
    return count
end

# verifie si une lettre est majuscule (oui si majuscule)
def is_uppercase?(letter)
    return letter != letter.downcase
end

# puisque chaque handle commence par un '@' et que l'on souhaite verifier si le handle commence par une majuscule, la première lettre du mot est techniquement la 2ème d'où le h[1] et non h[0]
def first_letter(h)
    return h[1]
end

# fonction 4 - renvoie le nombre total d'élements de l'array qui commencent par une majuscule
def uppercase_count(array)
    count = 0
    array.each do |handle|
        first_letter = first_letter(handle)
        if is_uppercase?(first_letter)
            count += 1
        end
    end
    puts "Il y a au total #{count} handle(s) commençant par une majuscule"
    return count
end

# fonction 5 - tri par ordre aphabetique
def sort_alphabetically(array)
    return array.sort!{|a, b| a.upcase <=> b.upcase}
end

# fonction 6 - tri par taille des élements
def sort_length(array)
    return array.sort!{|a, b| length_handle(a) <=> length_handle(b)}
end

# fonction 7 - recherche de la position d'un handle spécifique dans l'array 
def position(array, handle)
    return array.find_index(handle)
end

# crée une sous-array (partition) qui ne contient des elements de même taille
def partition_length(array, number)
    new_array = []
    array.each do |handle|
        length = length_handle(handle)
        if length == number
            new_array = new_array.push(handle)
        end
    end
    return new_array
end

# verifie si la partition n'est pas vide. Si oui, elle affiche du texte et les élements de la partition
def partition_empty_check(array)
    if array != []
        length = length_handle(array[0])
        puts "Voici l'array des handles de taille #{length}:"
        puts array
    end
end

# fonction 8 - répartit l'array en sous-arrays de même tailles qui seront affichées l'une après l'autre dans le bon ordre
# puisque array_sorted est triée par taille, partition_length prendra tous les élements d'une même taille, ce qui assurera le bon fonctionnement de la fonction
def repartition(array)
    array_sorted = sort_length(array)
    shortest_handle = array_sorted[0]
    largest_handle = array_sorted[-1]
    min = length_handle(shortest_handle)
    max = length_handle(largest_handle)
    for i in (min..max)
        array_partition = partition_length(array, i)
        partition_empty_check(array_partition)
    end
    # retourne nil sinon la fonction retoure (1..32) en fin code (ie min max)
    return nil
end
