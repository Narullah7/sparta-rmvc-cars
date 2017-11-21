class Cars

  attr_accessor :id, :title, :body, :image

  def save

    conn = Cars.open_connection

    if (self.id)
      sql = "UPDATE cars SET title='#{self.title}', body='#{self.body}', image='#{self.image}' WHERE id=#{self.id}"
    else
      sql = "INSERT INTO cars (title, body, image) VALUES ('#{self.title}','#{self.body}','#{self.image}')"
    end

    conn.exec(sql)
  end

  def self.open_connection
    #Assigns postgres to a variable
    conn = PG.connect(dbname: "blog")

  end

  def self.all
    conn = self.open_connection

    sql = "SELECT id,title,body,image FROM cars ORDER BY id DESC"

    results = conn.exec(sql)

    car = results.map do |cars|
      self.hydrate(cars)
    end

  end

  # Class method the will retrieve one post from the db
def self.find(id)

  # Assign the Postgre connect to variable
  conn = self.open_connection

  # SQL statement to select one post and limit to one
  sql = "SELECT * FROM cars WHERE id =#{id} LIMIT 1"

  # Execute the sql in Postgres
  car = conn.exec(sql)

  # Create our formatted object by passing it through our hydrate method to get the structure correct
  cars = self.hydrate(car[0])

  # Return the post
  cars

end

# A class method to destroy a post from the DB
def self.destroy(id)

  # Assign the Postgre connect to variable
  conn = self.open_connection

  # SQL statement to delete one post with the id we passed in
  sql = "DELETE FROM cars WHERE id = #{id}"

  # Execute the sql in Postgres
  conn.exec(sql)

end

# Hydrate is Class method that we can use to format our data that we get back from the PG gem. The PG gem returns the data as a weird object type called PG:Result.
def self.hydrate(post_data)

  # Create an instace of a post
  cars = Cars.new

  # Set the instance variables to be the ones from the PG:Result object so we can use them later in our templates
  cars.id = post_data['id']
  cars.title = post_data['title']
  cars.body = post_data['body']
  cars.image = post_data['image']

  # Return the post
  cars
end









end
