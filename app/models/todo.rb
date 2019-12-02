# frozen_string_literal: true

class Todo < ApplicationRecord
  validates_presence_of :title

  belongs_to :subscriber
  has_many :items, dependent: :destroy
end
