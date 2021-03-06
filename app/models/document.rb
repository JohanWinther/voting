# frozen_string_literal: true

# Allows uploading a document for viewing
class Document < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :agenda, optional: true

  validates :title, :category, presence: true

  mount_uploader :pdf, DocumentUploader

  # For caching pdf in form
  attr_accessor :pdf_cache

  scope :publik, -> { where(public: true).order('category asc') }

  def to_s
    title || id
  end

  def self.categories
    where.not(category: nil)
         .where.not(category: '')
         .order(:category)
         .pluck(:category).uniq
  end

  def view
    pdf.url
  end
end
