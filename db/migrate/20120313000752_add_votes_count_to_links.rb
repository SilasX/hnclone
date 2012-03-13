class AddVotesCountToLinks < ActiveRecord::Migration
  def change
    add_column :links, :votes_count, :integer, :default => 0

  end
end
