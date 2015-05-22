class AddLastPromotedToBoys < ActiveRecord::Migration
  def change
  	add_column :boys, :promoted_at, :datetime
  end
end
