class CountdownScreenStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed,
  # example: include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def rocket(st)
    st.frame = {t:25, l: 50, w: 150, h: 300}
    st.background_image = image.resource('rocket150px.png')
  end

  def timer(st)
    st.frame = {t:25, l: 200, w: app.device.width, h: 400}
    st.font = font.mega
    st.z_position  = 10
  end

  def message(st)
    st.frame = {t:25, l: 150, w: app.device.width, h: 400}
    st.font = font.mega
    st.z_position  = 20

  end


end
