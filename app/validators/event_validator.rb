class EventValidator < ActiveModel::Validator
  def validate(record)
  	# record.errors.add(:base, "Unable to write {some_file}")
    if record.leaf_count > 5
      record.errors[:name] << 'Event must have less than five (5) leaves.'
    elsif (record.leaf_count < 2 and record.service.nil?)
	  record.errors[:name] << 'Need either two (2) leaves or service hours.'
    end
  end
end