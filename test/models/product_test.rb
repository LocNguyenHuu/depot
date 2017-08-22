require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'it should be fail' do
    product = Product.new
    assert product.invalid?
  end

  test 'product must be valid' do
    product = Product.new(:title => 'My Book title', :description => 'yyy', :image_url => 'zz.png')

    product.price = -1
    assert product.invalid?
    assert_equal 'must be greater than or equal to 0.01', product.errors[:price].join('; ')

    product.price = 0
    assert_equal 'must be greather than or equal to 0.01', product.errors[:price].join('; ')
  end
end
