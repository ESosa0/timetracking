module EntriesHelper

  def total_hours_in_month(entries, month = Date.today.month, year= Date.today.year)
    start_date = Date.new(year, month)
    end_date = Date.new(year, month).end_of_month
    my_entries = entries.where("date >= ? AND date <= ?", start_date, end_date)
    my_entries.reduce(0) do | sum , entry |
      (sum += entry.hours + entry.minutes/60.0).round(2)
    end
  end

end
