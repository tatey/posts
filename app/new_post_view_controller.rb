class NewPostViewController < UITableViewController
  attr_accessor :delegate

  def viewDidLoad
    super
    cancelButton.target = self
    cancelButton.action = 'cancelButtonDidGetTouched:'
    saveButton.target   = self
    saveButton.action   = 'saveButtonDidGetTouched:'
  end

  def cancelButton
    navigationItem.rightBarButtonItem
  end

  def saveButton
    navigationItem.leftBarButtonItem
  end

  def bodyTextField
    view.viewWithTag 2
  end

  def titleTextField
    view.viewWithTag 1
  end

  def buildPost
    PostModel.new.tap do |post|
      post.body  = bodyTextField.text
      post.title = titleTextField.text
    end
  end

  def cancelButtonDidGetTouched cancelButton
    delegate.childViewControllerDidCancel self
  end

  def saveButtonDidGetTouched saveButton
    delegate.childViewController self, didSaveWithPost:buildPost
  end
end
