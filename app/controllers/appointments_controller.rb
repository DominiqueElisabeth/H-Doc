class AppointmentsController < ApplicationController

def index
    @appointments = current_doctor.appointments
  end

  def create
    appointment = current_doctor.appointments.create(post_id: params[:post_id])
  redirect_to posts_path, notice: "#{appointment.post.patient.name}'s post has been added to appointments"
  end

  def destroy
    appointment = current_doctor.appointments.find_by(id: params[:id]).destroy
    redirect_to posts_path, notice: "#{appointment.post.patient.name}'s post has been removed from appointments"
  end
end
