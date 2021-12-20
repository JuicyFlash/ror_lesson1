module ManufacturerCompany

  def  set_manufacturer_company
    puts "Введите компанию производителя: "
    self.manufacturer_company = gets.chomp
  end

  def  get_manufacturer_company
    self.manufacturer_company
  end

  protected

  attr_accessor  :manufacturer_company

end
