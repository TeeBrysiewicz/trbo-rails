class Project < ActiveRecord::Base
	belongs_to :user
	has_many :revisions, dependent: :destroy
	has_many :legals, dependent: :destroy
	has_many :accountings, dependent: :destroy

    validates :title, :presence => true

	accepts_nested_attributes_for :revisions,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true

	accepts_nested_attributes_for :legals,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true

	accepts_nested_attributes_for :accountings,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true
end
