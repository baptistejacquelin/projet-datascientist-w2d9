def compatibility_hash(list_1, list_2)
     return length_list(list_1) == length_list(list_2)
end

def create_hash(key, value)
     if (compatibility_hash(key, value))
          return Hash[key.zip(value)]
     else
          puts "Tableaux non compatibles"
     end
end

def highest_crypto(hash)
    if hash != {}
        return [hash.max_by{|k,v| v.to_f}].to_h
    end
    return hash
end

def lowest_crypto(hash)
    if hash != {}
        return [hash.min_by{|k,v| v.to_f}].to_h
    end
    return hash
end

def crypto_select_under_value(hash, value)
    return hash.select {|k,v| v.to_f < value}
end

def highest_crypto_under_value(hash, number)
    return highest_crypto(crypto_select_under_value(hash, number))
end