function add_to_cart( pid, pname, price)
{
   let cart= localStorage.getItem("cart");
   
   if(cart===null)
   {
       //cart not present yet
       
       let products=[];
       let product={productId:pid,productName:pname,productQuantity:1,productPrice:price};
       products.push(product);
       localStorage.setItem("cart",JSON.stringify(products));
   }
   else
   {
       //cart is presented
       
      let pcart=JSON.parse(cart);
      let oldproduct=pcart.find((item)=>item.productId===pid);
      if(oldproduct)
      {
         //we have to increase productquantity 
         oldproduct.productQuantity=oldproduct.productQuantity+1;
         pcart.map((item)=>
         {
             if(item.productId===oldproduct.productId)
             {
                 item.productQuantity=oldproduct.productQuantity;
             }
         })
         localStorage.setItem("cart",JSON.stringify(pcart));
      }
      else
      {
       //add product
       
          let product={productId:pid,productName:pname,productQuantity:1,productPrice:price};
          pcart.push(product);
          localStorage.setItem("cart",JSON.stringify(pcart));
       
      }
   }
   updateCart();
}
function updateCart()
{
    let cartstring=localStorage.getItem("cart");
    let cart=JSON.parse(cartstring);
    console.log(cart);
    if(cart===null || cart.length===0)
    {
      console.log("Cart is empty");
      $(".card-items").html("( 0 )");
      $(".module-body").html("Nothing added in cart");
      $(".checkout-btn").attr('disabled',true);
    }
    else
    {
        console.log("item added");
        $(".card-items").html(`(${cart.length})`); 
        let table=`
             <table class="table">
                 <thead class="table-head">
                  <tr>
                     <th>Name</th>
                     <th>quantity</th>
                     <th> price</th>
                     <th> total price</th>
                     <th>Action</th>
                   </tr>
                 </thead>

            `;
        let totalprice=0;
        cart.map((item)=>
        {
          table+=`
               <tr>
                 <td>${item.productName}</td>
                 <td>${item.productQuantity}</td>
                 <td>${item.productPrice}</td>
                 <td>${item.productQuantity*item.productPrice}</td>
                 <td><button onclick ='removeItem(${item.productId})' class="btn btn-danger" >Remove</button>
             </tr>
          `;  
            totalprice+=item.productQuantity*item.productPrice;
        });
        table=table+`<tr><td colspan='5' class='text-right font-weight-bold'>Total Price:${totalprice}</td></tr>
         </table>`;
        $(".module-body").html(table);
        $(".checkout-btn").attr('disabled',false);
    }
}

function removeItem(id)
{
    console.log(id);
    let cartstring=localStorage.getItem("cart");
    let cart=JSON.parse(cartstring);
    console.log(cart);
    let newcart=cart.filter(item=>item.productId!==id);
    localStorage.setItem("cart",JSON.stringify(newcart));
    console.log(newcart);
    updateCart();
    
}
$(document).ready(function()
{
    updateCart();
});
function gotoCheckout()
{
    window.location="order.jsp"
}

