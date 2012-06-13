# coding: utf-8
class Board
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  has_many :functionalities, :dependent => :destroy

  has_many :boards, :dependent => :destroy
  belongs_to :board
end
