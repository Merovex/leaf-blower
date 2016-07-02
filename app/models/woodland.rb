class Woodland < Boy
  after_save :recalcuate_leaves

  def recalcuate_leaves
    self.current_rank.save
  end
end