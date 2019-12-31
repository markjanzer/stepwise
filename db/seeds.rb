# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Passions
presence    = Passion.create(name: "Presence")
lik         = Passion.create(name: "LIK")
programming = Passion.create(name: "Programming")
life        = Passion.create(name: "Life")

# Reminder
# I don't think reminder is the correct name. If anything it is the increment.
reminder = Reminder.create(trigger_at: Date.parse("2020-01-05"))

# TimeFrames
# I should consider making these singletons. This will also need more columns.
two_weeks  = TimeFrame.create(name: "two weeks")
two_months = TimeFrame.create(name: "two months")
two_years  = TimeFrame.create(name: "two years")

# Todos
# Todos will need more than just the date
todo = Todo.create(date: Date.current)

# Tasks
# Might want to have habits?
# Presence tasks
meditate_15 = Task.create(passion: presence, time_frame: two_weeks, description: "Meditate 15 minutes daily")
notes_on_why_buddhism_is_true = Task.create(passion: presence, time_frame: two_weeks, description: "Finish taking notes on Why Buddhism is True")
meditate_30 = Task.create(passion: presence, time_frame: two_months, description: "Meditate 30 minutes daily")

# LIK tasks
mock_up_reddit_post = Task.create(passion: lik, time_frame: two_weeks, description: "Mock up the Reddit post")
purchase_ssd = Task.create(passion: lik, time_frame: two_months, description: "Purchase SSD")
dodeka_article = Task.create(passion: lik, time_frame: two_years, description: "Write article for Dodeka")

# Programming tasks
fishkin = Task.create(passion: programming, time_frame: two_weeks, description: "Complete Rand Fishkin's book")