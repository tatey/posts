class PostViewController < UIViewController
  attr_accessor :post

  def viewDidLoad
    bodyTextView.text = post.body
  end

  def bodyTextView
    view.viewWithTag 1
  end
end
