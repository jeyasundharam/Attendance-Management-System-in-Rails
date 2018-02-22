class AddPaperclipTostudents < ActiveRecord::Migration[5.1]
  def change
	 add_attachment :students, :avatar
  end
end
