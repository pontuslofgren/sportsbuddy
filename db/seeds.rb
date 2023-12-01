# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

workout_seeds = [
  { title: "Sunrise Yoga Bliss", description: "Start your day with a refreshing yoga session by the riverside. Suitable for all levels.", address: "R. da Cintura do Porto de Lisboa, 1200-109 Lisboa" },
  { title: "Lisbon City Run", description: "Explore the streets of Lisbon with a scenic 5km city run. Great for beginners and enthusiasts.", address: "Av. da Liberdade 110, 1269-047 Lisboa" },
  { title: "Beachside Bootcamp", description: "Intense beach workout with a mix of cardio and strength training. Prepare to sweat!", address: "Praça do Comércio, 1100-148 Lisboa" },
  { title: "High-Intensity Interval Training", description: "A challenging HIIT session to boost your fitness. Fast-paced and fun.", address: "Alameda dos Oceanos 45, 1990-203 Lisboa" },
  { title: "Capoeira in the Park", description: "Experience the energy of Capoeira, combining dance, acrobatics, and music.", address: "Parque Eduardo VII, 1070-051 Lisboa" },
  { title: "Riverside Cycling Tour", description: "Join our group cycling tour along the beautiful Tagus River.", address: "Av. Brasília, 1400-038 Lisboa" },
  { title: "Pilates in the Sun", description: "A calming Pilates session in the outdoors. Ideal for toning and relaxation.", address: "Campo dos Mártires da Pátria 50, 1150-227 Lisboa" },
  { title: "Urban Hiking Adventure", description: "Discover Lisbon's hidden gems in this exciting urban hiking experience.", address: "Largo do Carmo, 1200-092 Lisboa" },
  { title: "Boxing Fitness", description: "A high-energy boxing workout focusing on endurance, strength, and technique.", address: "Rua de São Bento 209, 1200-821 Lisboa" },
  { title: "Dynamic Dance Fitness", description: "Dance your way to fitness with this energetic and fun workout.", address: "Av. Almirante Reis 113, 1150-020 Lisboa" },
  { title: "Mindful Meditation", description: "Join us for a peaceful meditation session to rejuvenate your mind and body.", address: "Calçada da Ajuda 92, 1300-598 Lisboa" },
  { title: "Power Yoga Flow", description: "A powerful yoga session focusing on strength and flexibility. All levels welcome.", address: "Rua de Belém 28, 1300-085 Lisboa" },
  { title: "Total Body Workout", description: "A full-body workout designed to strengthen and tone every muscle group.", address: "Av. 24 de Julho 68, 1200-869 Lisboa" },
  { title: "Aqua Fitness Fun", description: "Enjoy a refreshing and invigorating aqua fitness class. Great for all ages.", address: "Doca de Santo Amaro, 1350-353 Lisboa" },
  { title: "Zumba Party Time", description: "Join the party with this high-energy Zumba class. Dance to great music and burn calories.", address: "Rua da Palma 268, 1100-394 Lisboa" },
  { title: "Kickboxing Power", description: "Challenge yourself with a dynamic kickboxing session. Improve your fitness and self-defense skills.", address: "Rua das Portas de Santo Antão 71, 1150-266 Lisboa" },
  { title: "Core Strength Pilates", description: "Focus on your core strength with this intensive Pilates class. Suitable for all levels.", address: "Avenida da Igreja 42, 1700-239 Lisboa" },
  { title: "Sunset Stretch and Relax", description: "Unwind with a gentle stretching session at sunset. Perfect for relaxation.", address: "Jardim do Torel, 1150-007 Lisboa" },
  { title: "Cardio Blast", description: "Get your heart pumping with this intense cardio workout. A great way to boost your energy.", address: "Rua do Ouro 274, 1100-065 Lisboa"}
]

puts "Creating a user"
User.create(first_name: "Pontus",
            last_name: "Lofgren",
            email: "fake@example.com",
            password: "123lewagon",
            biography: "Passionate about pushing the limits, I'm an avid endurance runner devoted to the exhilaration and challenge of long-distance runs. From marathons to ultra-trail races, I thrive on testing my boundaries and embracing the outdoors. Join me in celebrating the journey of stamina, resilience, and the shared love for every mile. 🏃‍♂️🌲🏞️ #EnduranceSpirit #TrailBlazer",
            address: "Kråkuddsvägen 2, 18357 Täby"
            )

puts "Finished creating a user"

puts "Destroying workouts"
Workout.destroy_all

puts "Generating categories"
Category.destroy_all
Category::CATEGORIES.each do |category|
  Category.create(name: category)
end
puts "Finished generating categories"

puts "Generating levels"
Level.destroy_all
Level::LEVELS.each do |level|
  Level.create(name: level)
end
puts "Finished generating levels"

puts "Generating locations"
Location.destroy_all
Location::LOCATIONS.each do |location|
  Location.create(name: location)
end
puts "Finished generating locations"


puts "Generating workouts"
workout_seeds.each_with_index do |seed_hash, index|
    workout = Workout.new(
            category_id: Category.all.sample.id,
            user_id: User.all.sample.id,
            level_id: Level.all.sample.id,
            spots: (1..15).to_a.sample,
            start_date: DateTime.now(),
            start_time: DateTime.now(),
            duration: DateTime.now(),
            start_date_time: DateTime.now(),
            end_date_time: DateTime.now() + 3.hours,
            location_id: Location.all.sample.id,
            title: seed_hash[:title],
            description: seed_hash[:description],
            address: seed_hash[:address]
          )

    if workout.save
      puts "#{index + 1}: #{workout.title}"
    else
      puts "Failure: #{workout.errors.full_messages}"
    end
end
puts "Finished generating workouts"
