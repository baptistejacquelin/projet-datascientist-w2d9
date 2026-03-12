# importe le dossier fonction afin de pouvoir reutiliser le travail précedent tout en isolant le code du menu
require_relative "./00_functions.rb"

def hello_message
    puts "Bonjour! Bienvenue dans notre programme. Pour selectionner la fonctionnalité de votre choix, vous pouvez renseigner dans le terminal les valeurs suivantes:"
end

# message qui indique le fonctionnement du menu. retourne la valeur indiquée par l'utilisateur
def initial_screen
    puts "> Tapez 1 pour connaitre la taille de notre arraye"
    puts "> Tapez 2 pour découvrir quel est notre handle le plus court"
    puts "> Tapez 3 pour savoir le nombre de handles d'une certaine taille"
    puts "> Tapez 4 pour connaitre le nombre de handles commençant par une majuscule"
    puts "> Tapez 5 pour afficher l'array triée par ordre alphabétique"
    puts "> Tapez 6 pour afficher l'array triée par taille"
    puts "> Tapez 7 pour rechercher la position d'un element dans l'array"
    puts "> Tapez 8 pour une répartition des handles en fonction de leur taille"
    print "> "
    user_entry = gets.chomp.to_i
    puts ""
    return user_entry
end

# message de rappel du menu dans le cas où la saisie de l'utilisateur est éronnée
def invalid_entry_message
    puts "Veuillez renseigner un nombre entre 1 et 8 SVP."
    puts "Si vous souhaitez revenir en arrière, tapez 0"
    print "> "
    user_entry = gets.chomp.to_i
    puts ""
    return user_entry
end

# message préliminaire à la saisie du 2ème nombre à saisir lors du choix n°3
def entry_3_message
    puts "Veuillez renseigner la taille de votre choix." 
    puts "Si vous souhaitez revenir en arrière, tapez 0"
    print "> "
    user_entry = gets.chomp.to_i
    puts ""
    return user_entry
end

# message préliminaire à la saisie du 2ème nombre à saisir lors du choix n°7
def entry_7_message
    puts "Veuillez renseigner le handle de votre choix."
    puts "Si vous souhaitez revenir en arrière, tapez 0"
    print "> "
    user_entry = gets.chomp
    puts ""
    return user_entry
end

# message d'erreur si saisie incorrecte lors du choix 7
def entry_7_error
    puts "Erreur, le handle renseigné n'est pas dans l'array. Veuillez réessayer. "
    puts "Verifiez que vous n'avez pas oublié le '@'"
    puts ""
end

# fonction pour le choix n°3 
def user_entry_3(array, user_entry)
    if user_entry > 0
        exact_length_count(array, user_entry)
    end
    if user_entry == 0
        perform(array)
    end
end

# fonction pour le choix n°7
def user_entry_7(array, user_entry)
    position = position(array, user_entry)
    if user_entry == "0"
        perform(array)
    else
        if position == nil
            entry_7_error
            user_entry = entry_7_message
            user_entry_7(array, user_entry)
        else
            puts position
        end
    end
end

# en cas de saisie valide (entre 1 et 8), renvoie le resultat souhaité en fonction du nombre saisi
def valid_entry(array, user_entry)
    if user_entry == 1
        puts length_array(array)

    elsif user_entry == 2
        puts shortest_handle(array)

    elsif user_entry == 3
        user_entry_2 = entry_3_message
        user_entry_3(array, user_entry_2)

    elsif user_entry == 4
        puts uppercase_count(array)

    elsif user_entry == 5
        puts sort_alphabetically(array)

    elsif user_entry == 6
        puts sort_length(array)

    elsif user_entry == 7
        user_entry_2 = entry_7_message
        user_entry_7(array, user_entry_2)

    elsif
        repartition(array)
    end
end

# fonction inale qui permet au code de 'revenir' en arrière dans les differents menus en appelant d'anciennes fonctions
def perform(array)
    user_entry = initial_screen
    while !(user_entry in (1..8))
        user_entry = invalid_entry_message
        if user_entry == 0
            user_entry = initial_screen
        end
    end
    valid_entry(array, user_entry)
end

# fonction du menu final accompagné d'un message de bienvenue au début
def menu(array)
    hello_message
    perform(array)
end