

<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document"> <!-- Firs it was small column size MODAL when we gace modal-lg it made it large in rectangualr size so the data will be visible -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Your Cart</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- WE WILL FETCH THE ITEMS INSIDE THE BODY OF MODAL -->
        <div class="cart-body">
        
        
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
        <button type="button" class="btn btn-primary checkout-btn" onclick="goToCheckout()">Checkout</button> <!-- We have given name to the class so that afterwards we can dynamically ENABLE DISABLE it -->
      </div>
    </div>
  </div>
</div>
<div id="toast">This is our custom Toast text</div>