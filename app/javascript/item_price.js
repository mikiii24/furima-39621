window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const Profit = document.getElementById("profit");


  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxRate = 0.1;
    const taxAmount = Math.floor(inputValue * taxRate)
    const itemProfit = Math.floor(inputValue - taxAmount);
    taxPrice.innerHTML = taxAmount;
    Profit.innerHTML = itemProfit;
  });
});