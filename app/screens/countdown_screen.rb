class CountdownScreen < PM::Screen
  title "Countdown Screen"
  stylesheet CountdownScreenStylesheet

  def on_load
    @rocket = append!(UIImageView, :rocket)

    intro_animation
    
    @timer = UILabel.new
    append!(@timer, :timer) 

    start_countdown

  end

  def intro_animation
    rmq(@rocket).animations.fade_in(duration: 1 )
  end

  def during_animation
    rmq(@rocket).animations.sink_and_throb
  end

  def outro_animation
    @rocket.rotate(45.degrees)
    rmq(@rocket).animations.slide_out(to_direction: :top, duration: 2, remove_view: true)
  end

  def transition_animations
    rmq(@timer).animations.fade_out(duration: 0.2)
    rmq(@message).animations.land_and_sink_and_throb(duration: 1)
  end


  def start_countdown
    count = 6
    @timer_event = BW::Reactor.add_periodic_timer 1.0 do
       count -= 1

       play_audio("Data_beep.mp3")

       during_animation
       
       update_timer(count)
       (count > 0) || countdown_end
    end

  def update_timer(count)
    @timer.text = "#{count}"
  end

  def countdown_end
    BW::Reactor.cancel_timer(@timer_event)
  
    play_audio("rocket.mp3")
    outro_animation

    @message = UILabel.new
    append!(@message, :message) 

    @message.text = "LET'S GO!"

    transition_animations
    
  end

  def play_audio(file)
    local_file = NSURL.fileURLWithPath(File.join(NSBundle.mainBundle.resourcePath, file))

    BW::Media.play(local_file){|hello| puts @timer.text }
  end



  end
  

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    reapply_styles
  end
end
