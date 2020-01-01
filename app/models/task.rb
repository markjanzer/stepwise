class Task < ApplicationRecord
	before_save :set_due_date

	belongs_to :passion
	belongs_to :time_frame

	private

	def set_due_date
		if time_frame_id_changed?
			self.due_date = Date.current + time_frame.duration.days
		end
	end
end