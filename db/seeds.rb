# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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


puts "Generating 10 workouts"
10.times do Workout.create(title: "Title",
            description: "Description",
            category_id: Category.all.sample.id,
            user_id: User.all.sample.id,
            level_id: Level.all.sample.id,
            spots: (1..15).to_a.sample,
            start_date: DateTime.now(),
            start_time: DateTime.now(),
            duration: DateTime.now(),
            start_date_time: DateTime.now(),
            end_date_time: DateTime.now() + 3.hours,
            address: "Kråkuddsvägen 2, 183 57 Täby",
            location_id: Location.all.sample.id)
end
puts "Finished generating workouts"
