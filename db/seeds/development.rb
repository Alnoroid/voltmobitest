CHANCE_TO_ACHIEVE = 20

# начало отсчёта
start = Time.now

# Генерируем показатели
a_list = (["пробежал #{Faker::Number.within(range: 5..10)}+ км","сделал #{Faker::Number.within(range: 50..100)}+ % точных передач"])

a_list.each do |record|
  Achievement.create!(name: record)
end

# Генерируем команды
# 10.times do
2.times do
  name = Faker::Team.name

  team = Team.create!(name: name)

  # Генерируем игроков
  5.times do
    p_name = "#{Faker::Superhero.prefix} #{Faker::Superhero.name}"
    Player.create(team:team,name:p_name)
  end
end

# Генерируем матчи
# 100.times do
3.times do
  opponents = Team.limit(2).order("RAND()").pluck(:id)

  t1 = Team.find(opponents[0])
  t2 = Team.find(opponents[1])
  game = Game.create!(team1:t1,team2:t2)

  # Генерируем показатели игроков в играх
  (t1.players + t2.players).each do |p|
    if (rand 100) >= 50 - CHANCE_TO_ACHIEVE
      achievement = Achievement.order("RAND()").first
      p.award(game,achievement)
    end
  end
end

# конец отсчёта
finish = Time.now
diff = finish - start
puts 'Заняло: '
puts diff