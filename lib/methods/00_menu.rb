require_relative "./00_functions.rb"


def hello_message
    puts "Bonjour! Bienvenue dans notre programme. Pour selectionner la fonctionnalité de votre choix, vous pouvez renseigner dans le terminal les valeurs suivantes:"
end

def initial_screen
    puts "> Tapez 1 pour connaitre la taille de notre liste"
    puts "> Tapez 2 pour découvrir quel est notre handle le plus court"
    puts "> Tapez 3 pour savoir le nombre de handles d'une certaine taille"
    puts "> Tapez 4 pour connaitre le nombre de handles commençant par une majuscule"
    puts "> Tapez 5 pour afficher la liste triée par ordre alphabétique"
    puts "> Tapez 6 pour afficher la liste triée par taille"
    puts "> Tapez 7 pour rechercher la position d'un element dans la liste"
    puts "> Tapez 8 pour une répartition des handles en fonction de leur taille"
    print "> "
    user_exit = gets.chomp.to_i
    puts ""
    return user_exit
end

def invalid_choice_message
    puts "Veuillez renseigner un nombre entre 1 et 8 SVP."
    puts "Si vous souhaitez revenir en arrière, tapez 0"
    print "> "
    user_exit = gets.chomp.to_i
    puts ""
    return user_exit
end

def choice_3_message
    puts "Veuillez renseigner la taille de votre choix." 
    puts "Si vous souhaitez revenir en arrière, tapez 0"
    print "> "
    user_exit = gets.chomp.to_i
    puts ""
    return user_exit
end

def choice_7_message
    puts "Veuillez renseigner le handle de votre choix."
    puts "Si vous souhaitez revenir en arrière, tapez 0"
    print "> "
    user_exit = gets.chomp
    puts ""
    return user_exit
end

def choice_7_error
    puts "Erreur, le handle renseigné n'est pas dans la liste. Veuillez réessayer. "
    puts "Verifiez que vous n'avez pas oublié le '@'"
    puts ""
end

def user_choice_3(list, user_exit)
    if user_exit > 0
        exact_length_count(list, user_exit)
    end
    if user_exit == 0
        perform(list)
    end
end

def user_choice_7(list, user_exit)
    position = position(list, user_exit)
    if user_exit == "0"
        perform(list)
    else
        if position == nil
            choice_7_error
            user_exit = choice_7_message
            user_choice_7(list, user_exit)
        else
            puts position
        end
    end
end

def valid_choice(list, user_exit)
    if user_exit == 1
        puts length_list(list)

    elsif user_exit == 2
        puts shortest_handle(list)

    elsif user_exit == 3
        user_exit_2 = choice_3_message
        user_choice_3(list, user_exit_2)

    elsif user_exit == 4
        puts uppercase_count(list)

    elsif user_exit == 5
        puts sort_alphabetically(list)

    elsif user_exit == 6
        puts sort_length(list)

    elsif user_exit == 7
        user_exit_2 = choice_7_message
        user_choice_7(list, user_exit_2)

    elsif
        repartition(list)
    end
end

def perform(list)
    user_exit = initial_screen
    while !(user_exit in (1..8))
        user_exit = invalid_choice_message
        if user_exit == 0
            user_exit = initial_screen
        end
    end
    valid_choice(list, user_exit)
end

def menu(list)
    hello_message
    perform(list)
end