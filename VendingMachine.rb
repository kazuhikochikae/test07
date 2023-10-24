class SlotMoney

  # 初期化。投入金額を0円にする
  def initialize
    @slot_money = 0   # 自販機に反映される、投入金額
    @change_money = 0  # お釣りの金額
  end

    # 投入できるお金を設定する。.freezeによって、値が変わることを防ぐ
  MONEY = [10, 50, 100, 500, 1000].freeze

  # 入金と、払い戻しの仕組み
  def slot_money   
    puts "a:入金を止める, 半角数字:お金を入れる"
    while true #投入を複数回できる仕組み
      input = gets.chomp 
      return false if input == "a"  #aならfalseになり、繰り返しを止める
      money = input.to_i
      if MONEY.include?(money)  #もしMONEY（配列）の数字が含まれていたら
        @slot_money += money    #投入金額を増やしていく
      elsif input =~ /^[0-9]+$/
        @change_money += money  #お釣りの額を増やしていく
      else
        puts "aまたは半角数字を入力してください"
      end
    end
  end

  #現在の投入金額
  def current_slot_money   
    @slot_money
  end
  
  #お釣りの金額
  def change_money
    @change_money
  end
end


class VendingMachine
  def initialize
    drink_name = []      #ドリンクネームの初期化
  end

  #配列にして、データを挿入
  def drink_list
  drinks = [{drink: "コーラ", price: 120, stock: 5},   
            {drink: "レッドブル", price: 200, stock: 5},
            {drink: "水", price: 100, stock: 5}]
  end

  #
  def buy_drink(current_slot_money)
    # current_slot_maneyと、全ての飲み物のpriceを比較して、
    # current_slot_maney >= priceになる商品だけ並べる
    can_buy_drink = []
    can_buy_drink_name = []
    
    puts "購入したい商品名を入力してください。"
    drink_number = 0
    drink_list.each do | drink |
      puts "#{drink_number}:#{drink[:drink]}:#{drink[:price]}円"
      drink_number += 1 
      if current_slot_money >= drink[:price] && drink[:stock] > 0
          can_buy_drink << drink
          can_buy_drink_name << drink[:drink]
      end
    end

    input_buy_drink = gets.chomp.to_i
    drink_kinds = drink_list.length - 1
    if (0..drink_kinds).include?(input_buy_drink)
      current_slot_money = current_slot_money - drink_list[input_buy_drink][:price]
      current_stock = drink_list[input_buy_drink][:stock] -1
      puts current_stock
      drink_list[input_buy_drink][:stock] = current_stock
   puts drink_list[input_buy_drink][:stock]
    end
  
    # can_buy_drink
    # binding.irb

    # 並んだ商品の番号（id？）を選択すると、購入できる
    
    # 買った商品に応じて、売上が加算される

    # if current_slot_money
  # end

  # # お釣りの値を返す
  # def return_money
  #   puts @slot_money
  #   @slot_money = 0
  # end
  end
end

# ————————————————————————————————————————
# 実行テスト
# ————————————————————————————————————————

# slot = SlotMoney.new
# slot.slot_money

# current_slot_money = slot.current_slot_money
# change_money = slot.change_money

# puts "使えるお金:#{cs_maney}円"
# puts "そのままお釣りになるお金:#{ch_maney}円"

vending_machine = VendingMachine.new
drink = vending_machine.buy_drink(500)
puts drink

# ————————————————————————————————————————

# step2
# ・商品の情報を入れるメソッド？が必要そう
# 　{[drink:"コーラ"],[price:120],[stock:5]},{[drink:"レッドブル"],[price:120],[stock:5]}

# step3
# ・買えるかどうかの判定
#  ifでcurrent_slot_money>=コーラのpriceだったら、購入可能

# ・購入されたら、stockを減らす

# ・売上金額を合計するメソッドが必要そう

# ・@slot_moneyから、購入した金額分差し引くメソッドが必要そう

# step4
# ・商品の情報に他の飲み物の情報を追加する
# ・購入可能な商品一覧を出力するメソッドが必要そう

# step5
# ・お釣りを正確に出力するメソッドが必要そう

# - - - - - - -
# 必要なもの
# ▼ メソッド
# ・
# ▼ 変数
# ・商品（ハッシュ）
# ・売上合計

# ————————————————————————————————————————
