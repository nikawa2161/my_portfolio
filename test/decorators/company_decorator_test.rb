# frozen_string_literal: true

require 'test_helper'

class CompanyDecoratorTest < ActiveSupport::TestCase
  def setup
    @company = Company.new.extend CompanyDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
