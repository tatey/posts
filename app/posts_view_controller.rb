class PostsViewController < UITableViewController
  def posts
    @posts ||= []
  end

  def prepareForSegue segue, sender:sender
    send "#{segue.identifier.downcase}Segue:sender:", segue, sender
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
    posts.unshift post
    tableView.beginUpdates
    tableView.insertRowsAtIndexPaths [NSIndexPath.indexPathForRow(0, inSection:0)],
                                     withRowAnimation:UITableViewRowAnimationTop
    tableView.endUpdates
    dismissViewControllerAnimated true, completion:nil
  end

protected

  def showSegue segue, sender:sender
    segue.destinationViewController.post = sender.post
  end

  def newSegue segue, sender:sender
    segue.destinationViewController.topViewController.delegate = self
  end
end
