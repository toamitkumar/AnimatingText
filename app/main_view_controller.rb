class MainViewController < UIViewController

  def init
    if(super)
      self.view.backgroundColor = UIColor.whiteColor
    end
    self
  end

  def viewDidLoad
    @count_down_timer_label = 10

    @label = UILabel.alloc.initWithFrame(CGRectMake(20, 20, 200, 100))

    @label.text = @count_down_timer.to_s
    @label.font = UIFont.systemFontOfSize(30)
    @label.textColor = UIColor.blackColor

    self.view.addSubview(@label)
    @count_down_timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector:"update_timer", userInfo:nil, repeats:true)
  end

  def update_timer
    @count_down_timer_label -= 1

    UIView.animateWithDuration(1,
      animations:lambda{
        @label.alpha = 0
        @label.text = @count_down_timer_label.to_s
        @label.alpha = 1
      }
    )

    if(@count_down_timer_label == 0)
      @count_down_timer.invalidate
      @label.textColor = UIColor.redColor
    end
  end

end