class PostsViewController < UITableViewController
  def prepareForSegue segue, sender:sender
    segue.destinationViewController.topViewController.delegate = self
  end

  def numberOfSectionsInTableView tableView
    0
  end

  def childViewControllerDidFinish childViewController
    dismissViewControllerAnimated true, completion:nil
  end
end
