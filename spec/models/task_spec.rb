require 'rails_helper'

# Run with:
# bundle exec rspec spec/models/task_spec.rb

# Todo
# Rename contexts
# Refactor variables
# Refactor Task creation

RSpec.describe Task, type: :model do
  context "after creation" do
    two_weeks = TimeFrame::two_weeks
    twelve_weeks = TimeFrame::twelve_weeks
    presence = Passion.create(name: "Presence")
    
    it "should save successfully" do
      task = Task.new(description: "desc", time_frame: two_weeks, passion: presence).save
      expect(task).to eq(true)
    end
    
    it "has the correct due date" do
      task = Task.create(description: "desc", time_frame: TimeFrame::two_weeks, passion: presence)
      
      expect(task.due_date).to eq(Date.current + task.time_frame.duration.days)
    end
  end
  
  context "after updating the time_frame" do 
    two_weeks = TimeFrame::two_weeks
    twelve_weeks = TimeFrame::twelve_weeks
    presence = Passion.create(name: "Presence")

    it "has the correct due date" do
      task = Task.create(description: "desc", time_frame: TimeFrame::two_weeks, passion: presence)
      task.update(time_frame: TimeFrame::twelve_weeks)

      expect(task.due_date).to eq(Date.current + task.time_frame.duration.days)
    end
  end
end
