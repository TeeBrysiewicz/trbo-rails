class AddPaperclipToLegal < ActiveRecord::Migration
  def change
  	add_attachment :legals, :document
  end
end
