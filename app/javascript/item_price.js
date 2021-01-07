window.addEventListener('load', () => {


// 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const tax = inputValue * 0.1;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = (Math.floor(tax))
  const salesProfit= document.getElementById("profit");
  salesProfit.innerHTML = (Math.floor(inputValue * 0.9));

})
})

