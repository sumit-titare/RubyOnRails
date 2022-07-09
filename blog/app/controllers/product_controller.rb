class ProductController < ApplicationController
  def index
  end

  def show
    render('show')
  end

  def another_index
    render('another_index')
  end

  def redirect_page
    redirect_to(action: 'index')
  end

  def amazon
    redirect_to("https://www.amazon.com")
  end
end
