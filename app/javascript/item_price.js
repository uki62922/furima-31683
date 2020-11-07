window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    fee = (Math.floor(inputValue * 0.1 ))
    console.log(fee)
    addTaxDom.innerHTML = fee
    const addGainDom = document.getElementById("profit");
    addGainDom.innerHTML = (inputValue - fee )
})
});