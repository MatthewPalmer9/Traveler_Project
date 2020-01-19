# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app (I utilized all required gems and routes that allow Sinatra to work)
- [x] Use ActiveRecord for storing information in a database (I created migrations and respective classes to store information)
- [x] Include more than one model class (e.g. User, Post, Category) (I included both a User and Destination model)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) (User has_many destinations)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) (Destinations belongs_to a User)
- [x] Include user accounts with unique login attribute (username or email) (bcrypt and .authenticate utilized to make this possible)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (User can manipulate their vacations on demand)
- [x] Ensure that users can't modify content created by other users (Users can only see their content and do not have access to another user's)
- [x] Include user input validations (applied in the routes to force valid information gets passed into the database)
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
