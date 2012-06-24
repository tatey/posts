class PostsViewController < UITableViewController
  def posts
    @posts ||= []
  end

  def prepareForSegue segue, sender:sender
    segue.destinationViewController.topViewController.delegate = self
  end

  def tableView tableView, numberOfRowsInSection:section
    posts.size
  end

  def tableView tableView, cellForRowAtIndexPath:indexPath
    post = posts[indexPath.row]
    cell = tableView.dequeueReusableCellWithIdentifier 'PostCell'
    cell.textLabel.text = post.title
    cell.detailTextLabel.text = post.body
    cell
  end

  def childViewControllerDidCancel childViewController
    dismissViewControllerAnimated true, completion:nil
  end

  def childViewController childViewController, didSaveWithPost:post
    posts << post
    row = posts.size - 1
    indexPath = NSIndexPath.indexPathForRow row, inSection:0

    tableView.beginUpdates
    tableView.insertRowsAtIndexPaths [indexPath], withRowAnimation:UITableViewRowAnimationLeft
    tableView.endUpdates

    dismissViewControllerAnimated true, completion:nil
  end
end
