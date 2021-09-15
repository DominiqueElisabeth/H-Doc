class AppointmentsController < ApplicationController
  before_action :set_doctor
  before_action :set_posts, only: [:new, :create]
  before_action :require_admin

  def index
     @appointments = @doctor.appointments.order(:date, :time)
   end

   def show
     @post = @appointment.post.find(params[:id])
     @doctor = @appointment.doctor.find(params[:doctor_id])
   end

 def new
   @appointment = @doctor.appointments.new
 end

   def create
     @appointment = @doctor.appointments.new(appointment_params)

     if @appointment.save
       redirect_to doctor_appointments_path, notice: 'Appointment was successfully created.'
     else
       render :new
     end
   end

 def update
  if @appointment.update(appointment_params)
    redirect_to doctor_appointments_path, notice: 'Appointment was successfully updated.'
  else
    render :edit
  end
end

 def destroy

     @doctor.appointments.find(params[:id]).destroy
     redirect_to doctor_appointments_path, notice: 'appointment was successfully deleted.'
   end

 private
 def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

 def set_posts
      @posts = (Post.all - @doctor.posts)
    end

   def set_appointment
     @appointment = Appointment.find(params[:id])
   end


   def appointment_params
     params.require(:appointment).permit(:post_id, :date, :time, :doctor_id)
   end
end
