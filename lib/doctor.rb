require 'pry'

class Doctor
    attr_accessor :name
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date,patient)
        Appointment.new(date,patient,self)
    end

    def appointments
        #iterates through all appointments and finds those belonging to this doctor
        Appointment.all.select {|appt|appt.doctor == self}
    end

    def patients
        appointments.collect do |appt|
            appt.patient
        end
    end

end