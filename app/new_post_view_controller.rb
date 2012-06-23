class NewPostViewController < UITableViewController
  attr_accessor :delegate

  def viewDidLoad
    super
    cancelButton.target = self
    cancelButton.action = 'cancelButtonDidGetTouched:'
  end

  def cancelButton
    navigationItem.rightBarButtonItem
  end

  def saveButton
    navigationItem.leftBarButtonItem
  end

  def cancelButtonDidGetTouched cancelButton
    delegate.childViewControllerDidCancel self
  end
end
