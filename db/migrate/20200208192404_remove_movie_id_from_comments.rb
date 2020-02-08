class RemoveMovieIdFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :movie_id
  end
end
