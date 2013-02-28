def fill_task_form
	fill_in "Name", :with => "new Task Name"
	fill_in "Description", :with => "new Task Description"
	fill_in "Budget", :with => "500"
end
def fill_project_form
	fill_in "Name", :with => "Test Project"
	fill_in "Description", :with => "Test Description"
	select "Mac2", :from => "Category"
end
