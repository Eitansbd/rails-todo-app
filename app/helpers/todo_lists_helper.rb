module TodoListsHelper
  def list_status
    list.complete? ? "completed" : ""
  end
end
