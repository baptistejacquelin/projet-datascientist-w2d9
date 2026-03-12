# importe le dossier fonction de l'exercice 1 afin d'utiliser length_array
require_relative "./00_functions.rb"

# verifie la compatibilité de 2 arrays à se merge en un hash (ie de même taille)
def compatibility_hash(array_1, array_2)
    return length_array(array_1) == length_array(array_2)
end

# crée un hash à partir de 2 arrays
def create_hash(key, value)
     if (compatibility_hash(key, value))
          return Hash[key.zip(value)]
     else
          puts "Tableaux non compatibles"
     end
end

# fonction 1 - explore le hash et retourne la crypto la plus cotée
def highest_crypto(hash)
    if hash != {}
        # on change le type de v en float pour que la fonction .max se comporte correctement. 
        return [hash.max_by{|k,v| v.to_f}].to_h
    end
    return hash
end

# fonction 2 - explore le hash et retourne la crypto la moins cotée
def lowest_crypto(hash)
    if hash != {}
        return [hash.min_by{|k,v| v.to_f}].to_h
    end
    return hash
end

# fonction 3- renvoie le sous-hash des cryptos ayant une valeur inférieure à celle en argument 
def crypto_select_under_value(hash, value)
    return hash.select {|k,v| v.to_f < value}
end

# fonction 4 - renvoie la crypto la plus cotée parmi le sous-hash des cryptos ayant une valeur inférieure à celle en argument.
# il s'agit clairement de la composition de la fonction 1 et 3
def highest_crypto_under_value(hash, number)
    return highest_crypto(crypto_select_under_value(hash, number))
end