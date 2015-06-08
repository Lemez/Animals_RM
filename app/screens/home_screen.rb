class HomeScreen < PM::Screen
  title "Alphabet Ninja"
  # title_image "AN logo clear.png"
  stylesheet HomeScreenStylesheet

  def on_load
    set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    set_nav_bar_button :right, title: "Settings", action: :settings

    @hello_world = append!(UILabel, :hello_world)
    @textfield = append!(UITextField, :textfield)
    @clean = append!(UIButton, :clean).on(:touch) do
      @flash.text= ""
    end

    @flash = UILabel.new
    append!(@flash, :flash)

    @submit = append!(UIButton, :submit).on(:touch) do
      valid_length = rmq.validation.valid?(@textfield.text,:length, min_length: 1, max_length: 7)
      valid_length ? success :  animate_flash_message
    end
   
  end

  def nav_left_button
    mp 'Left button'
  end

  def settings
    open SettingsScreen
  end


  def animate_flash_message

    @flash.text = "Please check your word, it's not valid"
    rmq(@flash).animations.fade_in(duration: 1)
    rmq(@flash).animations.fade_out(duration: 2)

  end

def success
    @word = @textfield.text 
    open CountdownScreen 
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
    find.all.reapply_styles
  end
end
