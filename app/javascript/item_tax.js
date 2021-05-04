function item_tax (){
  const itemPrice  = document.getElementById("item-price");
  if (!itemPrice){ return false;}
  itemPrice.addEventListener("keyup", () => {
    const fee = Math.floor(itemPrice.value * 0.1);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${fee}`;
    const SalesProfit = Math.floor(itemPrice.value - fee);
    const profit = document.getElementById("profit");
    profit.innerHTML = `${SalesProfit}`;
  });
}

setInterval(item_tax, 1000);
