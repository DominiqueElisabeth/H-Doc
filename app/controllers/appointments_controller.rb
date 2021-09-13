class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show]
  before_action :set_doctor
  before_action :set_posts, only: [:new, :create]

  def index
    if @doctor && @post
     @appointments = Appointment.where(post_id: @post.id, doctor_id: @doctor.id)
   elsif @user
     @appointments = Appointment.where(post_id: @post.id)
   elsif @doctor
     @appointments = Appointment.where(doctor_id: @doctor.id)
   else
     @appointments = Appointment.all
   end
 end

   def show
     @post = @appointment.post.find(params[:id])
     @doctor = @appointment.doctor.find(params[:doctor_id])
   end

 def new
   @appointment = Appointment.new
 end

   def create
     @appointment = Appointment.new(appointment_params)

     if @appointment.save
       redirect_to appointments_path, notice: 'Appointment was successfully created.'
     else
       render :new
     end
   end

 def update
  if @appointment.update(appointment_params)
    redirect_to appointments_path, notice: 'Appointment was successfully updated.'
  else
    render :edit
  end
end

 def destroy

     @appointment.find(params[:id]).destroy
     redirect_to appointments_path, notice: 'appointment was successfully deleted.'
   end

 private
 def set_doctor
      @doctors = Doctor.all
    end

 def set_posts
      @posts = Post.all
    end

   def set_appointment
     @appointment = Appointment.find(params[:id])
   end

   def set_doctor_from_session
      #initialise ids
      doctor_id = nil

      # find doctor
      if session[:doctor_id]
        doctor_id = session[:doctor_id]
      elsif request.query_parameters['doctorId']
        doctor_id = request.query_parameters['doctorId']
      end
      if doctor_id
        @doctor = Doctor.find(doctor_id)
      end
    end



   def appointment_params
     params.require(:appointment).permit(:post_id, :date, :time, :doctor_id)
   end
end
