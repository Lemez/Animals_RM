# To style this view include its stylesheet at the top of each controller's
# stylesheet that is going to use it:
#   class SomeStylesheet < ApplicationStylesheet
#     include BarCellStylesheet

# Another option is to use your controller's stylesheet to style this view. This
# works well if only one controller uses it. If you do that, delete the
# view's stylesheet with:
#   rm app/stylesheets/bar_cell_stylesheet.rb

module BarCellStylesheet

  def bar_cell_height
    40
  end

  def bar_cell(st)
    st.frame = {l: 5, t: 100, w: 80, h: bar_cell_height}
    st.background_color = color.light_gray

    # Style overall view here
  end

  def bar_cell_title(st)
    st.frame = {l: 10, fr: 0, centered: :vertical, h: 20}
    st.font = font.medium
    st.color = color.black
  end

end
