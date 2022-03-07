class GymsController < ApplicationController
  def index
    @gyms = Gym.all

    # the `geocoded` scope filters only gyms with coordinates (latitude & longitude)
    @markers = @gyms.geocoded.map do |gym|
      {
        lat: gym.latitude,
        lng: gym.longitude,
        info_window: render_to_string(partial: "info_window", locals: { gym: gym })
      }
    end
  end
end
