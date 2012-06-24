class PostsViewController < UITableViewController
  def posts
    @posts ||= []
  end

  def prepareForSegue segue, sender:sender
    if segue.destinationViewController.respond_to? :topViewController
      segue.destinationViewController.topViewController.delegate = self
    elsif segue.destinationViewController.respond_to? :post=
      segue.destinationViewController.post = sender.post
    end
  end

  def tableView tableView, numberOfRowsInSection:section
    posts.size
  end

  def tableView tableView, cellForRowAtIndexPath:indexPath
    post      = posts[indexPath.row]
    cell      = tableView.dequeueReusableCellWithIdentifier 'PostCell'
    cell.post = post
    cell.configure!
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
