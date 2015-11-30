class Revision < ActiveRecord::Base
	belongs_to :project
	has_attached_file :document, styles: {
	 					thumb: { geometry: "400x600", format: "jpg"}
	  					}, processors: [:ghostscript]

	  					
    validates :name, :presence => true
    validates_attachment :document, content_type: { content_type: "application/pdf" }

end
