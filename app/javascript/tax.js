window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const ProfitDom = document.getElementById("profit");
  // 入力した金額をもとに販売手数料を計算する処理
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  // 出品価格から販売手数料を引く処理
  ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
});


//function tax (){
  //const itemPrice  = document.getElementById("item-price");
  //itemPrice.addEventListener('input', function(){
    //const itemPriceValue = itemPrice.value;
   // const Tax = 0.1;
   // const tax_fee = Math.floor(itemPriceValue * Tax); 
    //const profit = itemPriceValue - tax_fee;
    //const taxArea = document.getElementById("add-tax-price");
   // const profitArea = document.getElementById("profit");
    //taxArea.innerHTML = tax_fee;
   // profitArea.innerHTML = profit;
 // });
//}

//window.addEventListener('load', tax);