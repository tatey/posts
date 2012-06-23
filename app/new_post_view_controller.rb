class NewPostViewController < UITableViewController
  attr_accessor :delegate

  attr_accessor :cancelButton
  attr_accessor :saveButton

  def viewDidLoad
    super
    @saveButton = navigationItem.leftBarButtonItem
    @cancelButton = navigationItem.rightBarButtonItem
    @cancelButton.target = self
    @cancelButton.action = 'cancelButtonDidGetTouched:'
  end

  def cancelButtonDidGetTouched cancelButton
    delegate.childViewControllerDidFinish self
  end
end
