class BookCopy < ApplicationRecord
  audited

  belongs_to :book

  STATES = %w[
    new
    good
    acceptable
    damaged
    lost
    archived
  ].freeze

  validates :state, inclusion: { in: STATES }, allow_nil: true
end
