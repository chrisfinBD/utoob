class AddMovieIdToComments2 < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :movie, index: true
  end
end
