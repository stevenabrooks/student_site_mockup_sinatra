require 'sinatra/base'
require_relative 'student'
require 'sqlite3'


# Why is it a good idea to wrap our App class in a module?
module StudentSite
  class App < Sinatra::Base

    get '/' do
      "hello world!"
    end   

    get '/hello-world' do
      @random_numbers = (1..20).to_a
    erb :hello
    end
    
    get '/artists' do
      @random_artists = ['50 Cent','Tony Yayo','Brittney Spears']
    erb :artists  
    end 

    get '/students' do
      @students = Student.all
      erb :students
    end  
    
    # get '/student/:student_name' do     #   erb :student
    # end 

    # get '/student/student_id' do

    # end

    get '/students/:student_id' do
      @student = Student.find(params[:student_id])
      erb :student
    end
  
  end
end