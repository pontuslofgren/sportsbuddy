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
  { title: "Sunrise Yoga Bliss", description: "Start your day with a refreshing yoga session by the riverside. Suitable for all levels, this tranquil setting offers a serene backdrop for your morning practice. Breathe in the fresh air and let the gentle sound of flowing water enhance your focus and relaxation. Embrace the peace of nature while you stretch, strengthen, and rejuvenate your body and mind. Whether you're a beginner or a seasoned yogi, the riverside is the perfect place to connect with yourself and the environment.", address: "R. da Cintura do Porto de Lisboa, 1200-109 Lisboa" },
  { title: "Lisbon City Run", description: "Explore the streets of Lisbon with a scenic 5km city run. Great for beginners and enthusiasts alike, this route takes you through the vibrant and historic heart of the city. Experience the charm of Lisbon as you jog past iconic landmarks, colorful neighborhoods, and along the picturesque waterfront. This run is an excellent way to see the city from a unique perspective while getting your daily exercise. Whether you're a local or a visitor, this 5km journey offers a blend of urban exploration and physical challenge, making it a memorable and invigorating experience.", address: "Av. da Liberdade 110, 1269-047 Lisboa" },
  { title: "Beachside Bootcamp", description: "Intense beach workout with a mix of cardio and strength training. Prepare to sweat as you push your limits on the sandy shores. This dynamic session combines heart-pumping cardio exercises with muscle-building strength training, all set against the backdrop of the ocean. Feel the sand beneath your feet as you jump, squat, and lunge, using the natural resistance of the beach to intensify your workout. The sound of waves and the fresh sea air will energize you as you challenge your body and mind. This beach workout is not just a fitness routine; it's an exhilarating experience that will leave you feeling strong, refreshed, and invigorated.", address: "Praça do Comércio, 1100-148 Lisboa" },
  { title: "High-Intensity Interval Training", description: "A challenging HIIT (High-Intensity Interval Training) session to boost your fitness. This fast-paced and fun workout is designed to elevate your heart rate and maximize calorie burn in a short amount of time. Experience a variety of high-intensity exercises interspersed with brief recovery periods, keeping you constantly on the move. This session combines cardio with strength training, ensuring a full-body workout that challenges every major muscle group. It's perfect for those looking to improve their endurance, strength, and overall fitness in an energetic and motivating environment. Get ready to sweat, push your limits, and enjoy the thrill of this exhilarating HIIT workout!", address: "Alameda dos Oceanos 45, 1990-203 Lisboa" },
  { title: "Capoeira in the Park", description: "Experience the energy of Capoeira, an exhilarating blend of dance, acrobatics, and music. Originating from Brazil, Capoeira is a unique martial art that infuses elements of rhythm and movement, creating a dynamic and fluid form of expression. In this experience, you'll immerse yourself in the pulsating beats of traditional music while engaging in a captivating dance that challenges your body and enchants your senses. Capoeira is not just a physical activity; it's a cultural journey that connects you with a rich heritage and a vibrant community. Whether you're a beginner or have some experience, this activity offers an opportunity to explore your creativity, improve your agility, and experience the infectious energy of Capoeira.", address: "Parque Eduardo VII, 1070-051 Lisboa" },
  { title: "Riverside Cycling Tour", description: "Join our group cycling tour along the beautiful Tagus River. This ride is a wonderful way to explore the scenic landscapes and fresh air along one of Portugal's most iconic rivers. Perfect for cyclists of all skill levels, the tour takes you on a journey through picturesque paths and offers stunning views of the river and its surroundings. Feel the breeze on your face and the rhythm of your pedals as you travel in the company of fellow cycling enthusiasts. It's a great opportunity to meet new people, share experiences, and enjoy the natural beauty of the Tagus River. Whether you're a local resident or a visitor, this group cycling tour promises an enjoyable and memorable experience.", address: "Av. Brasília, 1400-038 Lisboa" },
  { title: "Pilates in the Sun", description: "A calming Pilates session in the outdoors. Ideal for toning and relaxation, this session brings together the physical and mental benefits of Pilates in a natural setting. Embrace the tranquility of the outdoors as you engage in a series of controlled movements and breathing techniques designed to strengthen your core, improve your flexibility, and enhance your overall body awareness. Surrounded by the soothing sounds of nature, this Pilates class is more than just exercise; it's a holistic experience that nurtures both the body and the mind. Perfect for anyone looking to tone their muscles and find a moment of peace in their busy lives, this outdoor Pilates session is a gentle yet effective way to rejuvenate and unwind.", address: "Campo dos Mártires da Pátria 50, 1150-227 Lisboa" },
  { title: "Urban Hiking Adventure", description: "Discover Lisbon's hidden gems in this exciting urban hiking experience. Venture beyond the usual tourist paths and explore the lesser-known streets and neighborhoods of Portugal's vibrant capital. This hike takes you through a mix of historic sites, local art scenes, and unique architectural marvels, offering a deeper insight into the city's rich culture and heritage. As you wander through Lisbon's charming alleys and hilltops, you'll be rewarded with stunning views and unexpected discoveries. This urban hiking adventure is perfect for those who love to explore on foot and are eager to uncover the secrets and stories that make Lisbon truly special. Whether you're a seasoned hiker or just looking for a new way to experience the city, this journey promises excitement, knowledge, and unforgettable memories.", address: "Largo do Carmo, 1200-092 Lisboa" },
  { title: "Boxing Fitness", description: "A high-energy boxing workout focusing on endurance, strength, and technique. Step into the ring of fitness and challenge yourself with a workout that combines the rigor of boxing with a full-body exercise routine. This session is designed to improve your cardiovascular endurance, enhance muscle strength, and refine your boxing skills. You'll learn proper punching techniques, footwork, and defensive strategies, all while engaging in intense drills that push your physical limits. The workout is fast-paced and dynamic, ensuring that you stay engaged and motivated throughout. Ideal for those looking to elevate their fitness game, this boxing workout is not just about throwing punches; it's about building resilience, agility, and confidence both inside and outside the gym.", address: "Rua de São Bento 209, 1200-821 Lisboa" },
  { title: "Dynamic Dance Fitness", description: "Dance your way to fitness with this energetic and fun workout. Unleash your inner rhythm and enjoy a dynamic exercise session that blends dance moves with cardiovascular training. This workout is designed to boost your heart rate, burn calories, and improve your overall fitness while you groove to upbeat music. Whether you're a seasoned dancer or just looking for a fun way to stay active, this dance workout offers a joyful and inclusive environment where everyone can move, shake, and express themselves. The routines are easy to follow and suitable for all levels, ensuring that you can participate and enjoy the experience regardless of your dance background. Get ready to let loose, have fun, and dance your way to a healthier, happier you!", address: "Av. Almirante Reis 113, 1150-020 Lisboa" },
  { title: "Mindful Meditation", description: "Join us for a peaceful meditation session to rejuvenate your mind and body. This session is a serene escape into the world of mindfulness and relaxation. Surrounded by a calm and soothing atmosphere, you will be guided through practices that help quiet the mind, release stress, and foster a sense of inner peace. Whether you're new to meditation or have been practicing for years, this experience offers a chance to deepen your connection with yourself and cultivate mental clarity and emotional balance. The session is designed to accommodate all levels, providing techniques that can be applied in daily life to maintain calmness and focus. Take this opportunity to pause, breathe, and recharge, emerging from the session feeling refreshed and centered.", address: "Calçada da Ajuda 92, 1300-598 Lisboa" },
  { title: "Power Yoga Flow", description: "A powerful yoga session focusing on strength and flexibility. All levels are welcome to join this invigorating practice that blends traditional yoga poses with dynamic movements to enhance your physical and mental well-being. Whether you're a beginner or an experienced yogi, this session offers a balanced approach to developing muscular strength and improving flexibility. Through a series of asanas (poses), you will engage different muscle groups, promote better posture, and increase your range of motion. The session also incorporates breathing techniques and mindfulness practices, ensuring a holistic experience that nurtures both the body and the mind. Embrace this opportunity to challenge yourself, deepen your yoga practice, and leave feeling stronger, more flexible, and deeply relaxed.", address: "Rua de Belém 28, 1300-085 Lisboa" },
  { title: "Total Body Workout", description: "A full-body workout designed to strengthen and tone every muscle group. This comprehensive exercise routine targets all major muscle areas, ensuring a balanced and effective approach to fitness. Whether you're looking to build strength, increase muscle definition, or improve overall fitness, this workout has something for everyone. The session includes a mix of resistance training, bodyweight exercises, and functional movements that work together to challenge and enhance your physical capabilities. Each exercise is carefully selected to ensure maximum efficiency, making it ideal for those with busy schedules seeking a thorough workout. With options to modify exercises to suit different fitness levels, this full-body workout is a great way to achieve your fitness goals in a supportive and motivating environment.", address: "Av. 24 de Julho 68, 1200-869 Lisboa" },
  { title: "Aqua Fitness Fun", description: "Enjoy a refreshing and invigorating aqua fitness class. Great for all ages, this water-based exercise offers a unique and enjoyable way to stay fit and healthy. The class combines aerobic exercise with resistance training in the buoyant and supportive environment of water, making it gentle on the joints while still providing a challenging workout. Suitable for swimmers and non-swimmers alike, aqua fitness is an inclusive activity that enhances cardiovascular health, improves strength and flexibility, and boosts overall stamina. The resistance of the water adds an extra dimension to the workout, helping to tone muscles and burn calories effectively. Whether you're looking to mix up your fitness routine or searching for a low-impact exercise option, this aqua fitness class is a delightful way to achieve your health and wellness goals.", address: "Doca de Santo Amaro, 1350-353 Lisboa" },
  { title: "Zumba Party Time", description: "Join the party with this high-energy Zumba class. Dance to great music and burn calories in a fun and exhilarating way. Zumba combines infectious rhythms with easy-to-follow choreography for a total-body workout that feels like a celebration. Whether you're a dance enthusiast or just looking to add some excitement to your fitness routine, this class offers a dynamic and inclusive environment where everyone can let loose and enjoy the beat. The energetic music spans various genres, ensuring there's something for everyone to enjoy. As you move to the rhythm, you'll not only burn calories but also improve your cardiovascular health, coordination, and mood. Get ready to sweat, smile, and experience the joy of Zumba!", address: "Rua da Palma 268, 1100-394 Lisboa" },
  { title: "Kickboxing Power", description: "Challenge yourself with a dynamic kickboxing session. This workout is an excellent way to improve your fitness and self-defense skills. Kickboxing combines elements of boxing, martial arts, and aerobics to provide a total body workout that targets both strength and cardiovascular endurance. In this session, you will learn proper techniques for punches, kicks, and combinations, all while engaging in an intensive workout that burns calories and builds muscle. The fast-paced nature of kickboxing not only enhances your physical condition but also sharpens your reflexes and boosts your confidence. Whether you're a beginner or an experienced athlete, this kickboxing session offers a challenging and empowering way to improve your fitness, agility, and self-defense capabilities.", address: "Rua das Portas de Santo Antão 71, 1150-266 Lisboa" },
  { title: "Core Strength Pilates", description: "Focus on your core strength with this intensive Pilates class. Suitable for all levels, this class is designed to target and enhance your core muscles, the vital foundation for overall fitness and well-being. Pilates is renowned for its effectiveness in improving core strength, flexibility, and posture through controlled, low-impact movements and exercises. Whether you're a beginner or an experienced practitioner, this class offers a range of modifications and challenges to suit your individual needs. The instructor will guide you through a series of exercises that not only strengthen the core but also engage multiple muscle groups, promoting balance and alignment in the body. This Pilates class is a fantastic opportunity to deepen your practice, develop greater core stability, and improve your overall physical health.", address: "Avenida da Igreja 42, 1700-239 Lisboa" },
  { title: "Sunset Stretch and Relax", description: "Unwind with a gentle stretching session at sunset. This serene experience is perfect for relaxation and rejuvenating your body after a long day. As the sun sets, casting a warm glow over the surroundings, you'll engage in a series of gentle, flowing stretches that aim to release tension from your muscles and calm your mind. The session is designed to be soothing and restorative, suitable for all levels of fitness and flexibility. It's an ideal way to ease stiffness and discomfort, improve range of motion, and promote relaxation. The tranquil atmosphere, combined with the mindful practice of stretching, creates a peaceful retreat from the hustle and bustle of daily life. Embrace this moment of tranquility and let the stretching session leave you feeling refreshed, relaxed, and connected with your surroundings.", address: "Jardim do Torel, 1150-007 Lisboa" },
  { title: "Cardio Blast", description: "Get your heart pumping with this intense cardio workout. This session is a great way to boost your energy and elevate your fitness level. Designed to increase your heart rate and challenge your endurance, this workout combines high-intensity movements with energetic music, creating a motivating and exhilarating exercise environment. Whether you're looking to improve your cardiovascular health, burn calories, or simply inject some vigor into your day, this cardio workout is suitable for a variety of fitness levels. The class structure includes a mix of running, jumping, and dynamic exercises that can be modified to match your individual pace and ability. Prepare to sweat, feel the adrenaline rush, and enjoy the invigorating benefits of this intense cardio session.", address: "Rua do Ouro 274, 1100-065 Lisboa"}
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
