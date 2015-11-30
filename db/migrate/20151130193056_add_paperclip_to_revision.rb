class AddPaperclipToRevision < ActiveRecord::Migration
  def change
  	add_attachment :revisions, :document
  end
end
