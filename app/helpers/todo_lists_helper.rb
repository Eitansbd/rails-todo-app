module TodoListsHelper
  def list_status_class(list)
    list.complete? ? "complete" : ""
  end
end
