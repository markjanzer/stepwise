# Passions
presence    = Passion.create(name: "Presence")
lik         = Passion.create(name: "LIK")
programming = Passion.create(name: "Programming")
life        = Passion.create(name: "Life")

# Reminder
# I don't think reminder is the correct name. If anything it is the increment.
reminder = Reminder.create(trigger_at: Date.parse("2020-01-05"))

# Timeframes
# I should consider making these singletons. This will also need more columns.
two_weeks  = Timeframe.create(name: "two weeks")
two_months = Timeframe.create(name: "two months")
two_years  = Timeframe.create(name: "two years")

# Todos
# Todos will need more than just the date
todo = todo.create(date: Date.current)

# Tasks
# Might want to have habits?
# Presence tasks
meditate_15 = Task.create(passion: presence, timeframe: two_weeks, description: "Meditate 15 minutes daily")
notes_on_why_buddhism_is_true = Task.create(passion: presence, timeframe: two_weeks, description: "Finish taking notes on Why Buddhism is True")
meditate_30 = Task.create(passion: presence, timeframe: two_months, description: "Meditate 30 minutes daily")

# LIK tasks
mock_up_reddit_post = Task.create(passion: lik, timeframe: two_weeks, description: "Mock up the Reddit post")
purchase_ssd = Task.create(passion: lik, timeframe: two_months, description: "Purchase SSD")
dodeka_article = Task.create(passion: lik, timeframe: two_years, description: "Write article for Dodeka")

# Programming tasks
fishkin = Task.create(passion: programming, timeframe: two_weeks, description: "Complete Rand Fishkin's book")



