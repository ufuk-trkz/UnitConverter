# UnitConverter

# Usage 

The App can be used to convert different kind of currencys, length units and weight units.

It allows you to chage between the Unit Converters with a tab bar.
You can select the currency you want to convert from and the currency you want to convert to and type in the amount into a text field using the number buttons on the screen.
By tapping the equal button, the second text field shows the conveted amount.

# On the command line

We have the model called Unit that has a name and a factor since all included Units have this properties.

  struct Unit {
      var name: String?
      var factor: Double
  }
  
The name of the unit is used to let the calculator function know what factor it should use.
Our base factor in the Currency Converter is the USD (factor = 1)

The calculator takes the number from the fromCurrencyTF and devides it by the factor of the currency that is shown on the currencyFromButton to get the amount in USD.

In the second calculation it takes the first solution and multiplies it by the factor of the currency that is shown on the currencyToButton.

  @IBAction func equalTapped(_ sender: Any) {
        
        var solution1: Double = 0
        var solution2: Double = 0
        
        for currency in currencys {
            
            if fromCurrencyButton.currentTitle == currency.name {
                solution1 = (Double(fromCurrencyTF.text ?? "0") ?? 0) / (Double(currency.factor))
            }
        }
        
        for currency in currencys {

            if toCurrencyButton.currentTitle == currency.name {
                solution2 = solution1 * currency.factor
            }
        }
        
        toCurrencyTF.text = String(format: "%.2f", solution2)
    }
