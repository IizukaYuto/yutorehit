module CommonActions
  extend ActiveSupport::Concern
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    #|| または左trueなら右評価されない
    #初回の変数はnil
    #2回目以降は左に値が入っているので、右が評価されてない分負荷がへる
    #自作destroyメソッドでcurrent_userの値をnilにしない限り@current_userに
    #値は入ったまま
  end
  def logged_in?
    !current_user.nil?
    #nilじゃなかったらtrue
    #nil?はメソッド
  end
end