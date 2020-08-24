window.addEventListener('load',function(){
  const num = document.getElementById("item-price")
  num.addEventListener('change',function(){
  price = num.value
  const tax_num = price * 0.1
  const profit_num = price - tax_num
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  tax.innerHTML = tax_num
  profit.innerHTML = profit_num
   })  
})