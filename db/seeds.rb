# Passions
presence    = Passion.create(name: "Presence")
lik         = Passion.create(name: "LIK")
programming = Passion.create(name: "Programming")
life        = Passion.create(name: "Life")

# TimeFrames
two_weeks         = TimeFrame::two_weeks
twelve_weeks      = TimeFrame::twelve_weeks
seventy_two_weeks = TimeFrame::seventy_two_weeks

# Tasks
# Might want to have habits?
# Presence tasks
meditate_15 = Task.create(passion: presence, time_frame: two_weeks, description: "Meditate 15 minutes daily")
notes_on_why_buddhism_is_true = Task.create(passion: presence, time_frame: two_weeks, description: "Finish taking notes on Why Buddhism is True")
meditate_30 = Task.create(passion: presence, time_frame: twelve_weeks, description: "Meditate 30 minutes daily")

# LIK tasks
mock_up_reddit_post = Task.create(passion: lik, time_frame: two_weeks, description: "Mock up the Reddit post")
purchase_ssd = Task.create(passion: lik, time_frame: twelve_weeks, description: "Purchase SSD")
dodeka_article = Task.create(passion: lik, time_frame: seventy_two_weeks, description: "Write article for Dodeka")

# Programming tasks
fishkin = Task.create(passion: programming, time_frame: two_weeks, description: "Complete Rand Fishkin's book")

# Todos
# Todos will need more than just the date
# todo = Todo.create(date: Date.current)

# Reminder
# I don't think reminder is the correct name. If anything it is the increment.
# reminder = Reminder.create(trigger_at: Date.parse("2020-01-05"))