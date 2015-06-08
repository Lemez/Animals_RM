class HomeScreenStylesheet < ApplicationStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def hello_world(st)
    st.frame = {t: 100, w: @app_width - 10, h: 18, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.battleship_gray
    st.font = font.medium
    st.text = 'Hello World'
  end

  def textfield(st)
    st.frame = {t: 200, w: @app_width - 10, h: 40, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.battleship_gray
    st.font = font.medium
    st.placeholder = 'Secret Word'
    st.border_style = UITextBorderStyleRoundedRect
    st.clear_button_mode = UITextFieldViewModeWhileEditing
  end

   def flash(st)
    st.frame = {t: 300, w: @app_width - 10, h: 18, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.red
    st.font = font.small
 
  end

  def submit(st)
    st.frame = {t: 250, w: @app_width/2 - 10, h: 40, centered: :horizontal}
    st.background_color = color.black
    st.color = color.white
    st.text = "Let's Play"
  end

   def clean(st)
    st.frame = {t: 50, w: @app_width/8 - 10, h: 40, centered: :horizontal}
    st.background_color = color.black
    st.color = color.white
    st.text = "X"
  end

   def switch_style(st)
     st.frame = {top: 100, width: 50, height: 18, centered: :horizontal}
     st.label 
  end

   def query_box(st)
     st.frame = {top: 150, width: 200, height: 50, centered: :horizontal}
     st.font = font.medium
     st.text_alignment = :center
     st.border_width = 2
     st.border_color = color.battleship_gray
     st.placeholder = 'Enter a word'

     st.keyboard_appearance = UIKeyboardAppearanceDark
  end  

  def submit_button(st)
     st.frame = {top: 200, width: 150, height: 50, centered: :horizontal, below_prev: 30}
     st.font = font.medium
     st.background_color = color.blue
     st.border_width = 2
     st.border_color = color.battleship_gray

     st.text = "Let's Play!"
  end

end
