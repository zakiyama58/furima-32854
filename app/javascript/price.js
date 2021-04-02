function price (){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener("keyup", () => {
    const inputValue = itemPrice.value;
    console.log(inputValue);
    addTaxPrice.innerHTML = (Math.floor(inputValue * 0.1));
    profit.innerHTML = (Math.floor(inputValue * 0.9));
  })
}

window.addEventListener('load', price);