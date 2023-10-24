def shuffle_method(september)

  # 名前のリストをシャッフルする
  shuffled_names = september.shuffle

  # 曜日情報の配列
  days = ["月：", "火：", "水：", "木：", "金："]
  
  # シャッフルされた名前を順番に出力する
  # 繰り返し処理で行番号表示
  shuffled_names.each.with_index(1) do |name, index|
    day = days[index - 1]
    puts "#{index}. #{day}#{name}"
  end
end
  
  # 9月期のメンバー名
  september = ["松村さん", "原さん", "橋本さん", "逢見さん", "近江さん"]
  
  # メソッドを呼び出して9月期の当番を表示
  puts "9月期生当番"
  shuffle_method(september)
