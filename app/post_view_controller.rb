class PostViewController < UIViewController
  attr_accessor :post

  def viewDidLoad
    super
    bodyTextView.text = post.body
    navigationItem.title = post.title
  end

  def bodyTextView
    view.viewWithTag 1
  end
end
