class PostCell < UITableViewCell
  attr_accessor :post

  def configure!
    detailTextLabel.text = post.body
    textLabel.text       = post.title
  end
end
