# importe les fonction précedentes
require_relative "./01_functions.rb"

# Si vous avez déjà lu le codé l'exercice 1, ce menu est quasiment identique

# message de bienvenue
def hello_message
    puts "Bonjour! Bienvenue dans notre programme. Pour selectionner la fonctionnalité de votre choix, vous pouvez renseigner dans le terminal les valeurs suivantes:"
end

# message d'explication
def initial_screen
    puts "> Tapez 1 pour voir la crypto la plus cotée"
    puts "> Tapez 2 pour découvrir la crypto la moins cotée"
    puts "> Tapez 3 pour connaitre les devises dont le cours est inférieur à la valeur de votre choix"
    puts "> Tapez 4 pour connaitre la devise la mieux cotée parmi celles dont le cours est inférieur à la valeur de votre choix"
    print "> "
    user_entry = gets.chomp.to_i
    puts ""
    return user_entry
end

# en cas de saisie invalide
def invalid_entry_message
    puts "Veuillez renseigner un nombre entre 1 et 4 SVP."
    puts "Si vous souhaitez revenir en arrière, tapez 0"
    print "> "
    user_entry = gets.chomp.to_i
    puts ""
    return user_entry
end

#
def user_entry_3_4_message
    puts "Veuillez renseigner la valeur de votre choix." 
    puts "Si vous souhaitez revenir en arrière, tapez 0"
    print "> "
    user_entry = gets.chomp.to_f
    puts ""
    return user_entry
end


def user_entry_3(hash, user_entry)
    if user_entry > 0
        puts crypto_select_under_value(hash, user_entry)
    end
    if user_entry == 0
        perform(hash)
    end
end

def user_entry_4(hash, user_entry)
    if user_entry > 0
        puts highest_crypto_under_value(hash, user_entry)
    end
    if user_entry == 0
        perform(hash)
    end
end


def valid_entry(hash, user_entry)
    if user_entry == 1
        puts highest_crypto(hash)

    elsif user_entry == 2
        puts lowest_crypto(hash)

    elsif user_entry == 3
        user_entry_2 = user_entry_3_4_message
        user_entry_3(hash, user_entry_2)

    elsif
        user_entry_2 = user_entry_3_4_message
        user_entry_4(hash, user_entry_2)
    end
end

def perform(hash)
    user_entry = initial_screen
    while !(user_entry in (1..4))
        user_entry = invalid_entry_message
        if user_entry == 0
            user_entry = initial_screen
        end
    end
    valid_entry(hash, user_entry)
end

def menu(hash)
    hello_message
    perform(hash)
end