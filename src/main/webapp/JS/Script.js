

function add_to_cart(pid,pname,price){
    let cart=localStorage.getItem("cart");

    if (cart == null)
        {
            let products= [];
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
            products.push(product);
            localStorage.setItem("cart",JSON.stringify(products));
            console.log("Product added for the First time");
            showToast("Item is added to Cart")

    }else
    {

       let pcart= JSON.parse(cart);

      let oldProduct= pcart.find((item)=>item.productId == pid)
      if (oldProduct){
        //if it is present then we have to increase the quantity
       oldProduct.productQuantity= oldProduct.productQuantity+1
       pcart.map((item)=>{
        if (item.productId == oldProduct.productId){
            item.productQuantity= oldProduct.productQuantity;
           
        }
       })
       localStorage.setItem("cart",JSON.stringify(pcart));
       console.log("Product quantity is inscreased");
       showToast(oldProduct.productName+"quantity is increased", Quantity="+oldProduct.productQuantity")

      }else{
            //if not present then we have to add product
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
            pcart.push(product);
            localStorage.setItem("cart",JSON.stringify(pcart));
            console.log("Product is Added");
            showToast("Product is added to Cart")
      }
    }

updateCart();

}

//UPDATE CART FUNCTION

function updateCart(){
    let cartString=localStorage.getItem("cart");
    let cart=JSON.parse(cartString);
    if(cart == null || cart.length == 0){
        console.log("Cart is empty")
        $(".cart-items").html("(0)");   //This will print (0) whenever the cart will be empty.
        $(".cart-body").html("<h3>Your QuickCart Cart is empty </h3>"); //this will print this message whenever empty inside modal body
        $(".checkout-btn").attr('disabled',true); //Whenever cart will be empty checkout button will be disabled.
      
    }else{
        console.log(cart);
         //here we will print the items in the cart when it is not empty
         $(".cart-items").html(`(${cart.length})`); //this lengths will give us dynamic value inside our () with our cart icon
         let table=`
         <table class='table'>
         <thead class='thread-light'>
            <tr>
                <th>Item Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Action</th>
            
            </tr>
            </thead>
         `;
         let totalPrice=0;  //initially we have set total price to zero
         //this will traverse whole list and will update the data inside table
         cart.map((item)=>{
         //this bac-tick is important it was giving error if not used
            table+=`                                      
            <tr>
                <td>${item.productName}</td>
                <td>${item.productPrice}</td>
                <td>${item.productQuantity}</td>
                <td>${item.productQuantity*item.productPrice}</td>
                <td><button onclick='deleteItemFromCart (${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>  
            </tr>
            `
            //btn-sm to keep button small
            totalPrice += item.productPrice*item.productQuantity //here it will calculate the total price of the product
         })
         //here we have enterd our <table> inside our cart-body means our modal body. 
         table=table+`
          <tr>
           <td colspan='5' class='text-right font-weight-bold'>Total Price: ${totalPrice}</td>
        </tr>
        </table>`;
         $(".cart-body").html(table);
         $(".checkout-btn").attr('disabled',false) //when we again add to card after cart is empty then it will unable the checkout button from here
         console.log("removed")

    }

}

function deleteItemFromCart (pid){
    let cart=JSON.parse(localStorage.getItem('cart'));
    let newcart=cart.filter((item => item.productId != pid))
    localStorage.setItem('cart',JSON.stringify(newcart))
    updateCart();
    showToast("Item is removed from cart")
}

$(document).ready (function(){
    updateCart()
})

function showToast (content){
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(()=>{
        $("#toast").removeClass("display");
    },2000);
}

function goToCheckout(){
    window.location="Checkout.jsp"
}