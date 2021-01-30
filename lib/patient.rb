require 'pry'

class Patient
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def new_appointment(date,doctor)
        Appointment.new(date,self,doctor)        
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select {|appt|appt.patient == self}
    end

    def doctors
        appointments.collect do |appt|
            appt.doctor
        end
    end

end