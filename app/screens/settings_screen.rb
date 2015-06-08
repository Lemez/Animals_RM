class SettingsScreen < PM::GroupedTableScreen
  title "Settings"
  stylesheet SettingsScreenStylesheet

  def on_load
  end
  
   def table_data
    [{
      title: "Play Settings",
      cells: [
        { title: "Boston Celtics", action: :select_team, arguments: { team: "Boston Celtics" } },
         { cell_class: BarCell, title: "Foo"},
        { title: "AutoPlay", accessory: {view: :switch, value: @autoplay, action: :autoplay_on } },
        # { title: "Language", accessory: {view: UIControlStateNormal, value: @autoplay, action: :autoplay_on } },
        { title: "New York Knicks", action: :select_team, arguments: { team: "New York" } },
        { title: "Philadelphia 76ers", action: :select_team, arguments: { team: "Philadelphia 76ers" } },
        { title: "Toronto Raptors", action: :select_team, arguments: { team: "Toronto Raptors" } },
      ]
    }, {
      title: "Notifications",
      cells: [
        { title: "Chicago Bulls", action: :select_team, arguments: { team: "Chicago Bulls" } },
        { title: "Cleveland Cavaliers", action: :select_team, arguments: { team: "Cleveland Cavaliers" } },
        { title: "Detroit Pistons", action: :select_team, arguments: { team: "Detroit Pistons" } },
        { title: "Indiana Pacers", action: :select_team, arguments: { team: "Indiana Pacers" } },
        { title: "Milwaukee Bucks", action: :select_team, arguments: { team: "Milwaukee Bucks" } },
      ]
    }]
  end
 
  def select_team(args={})
    puts args[:team] # => "Portland Trail Blazers" (when you tap that cell)
  end

  def autoplay_on
    @autoplay = !@autoplay
    mp @autoplay
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
