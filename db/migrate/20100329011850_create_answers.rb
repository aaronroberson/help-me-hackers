class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.belongs_to :problem, :null => false
      t.belongs_to :user, :null => false
      t.text :description, :null => false
      t.boolean :correct, :null => false, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
