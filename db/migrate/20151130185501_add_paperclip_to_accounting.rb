class AddPaperclipToAccounting < ActiveRecord::Migration
  def change
  	add_attachment :accountings, :document
  end
end
