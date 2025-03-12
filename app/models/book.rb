class Book < ApplicationRecord
  audited

  belongs_to :author
end
