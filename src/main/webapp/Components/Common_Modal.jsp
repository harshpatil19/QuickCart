<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Your Cart</h5>
      </div>
      <div class="modal-body">
        <!-- Fetch the items inside the body of modal -->
        <div class="cart-body">
          <!-- Cart items will appear here -->
        </div>
      </div>
      <div class="modal-footer">
        <!-- Close button -->
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary checkout-btn" onclick="goToCheckout()">Checkout</button>
      </div>
    </div>
  </div>
</div>
<div id="toast">This is our custom Toast text</div>
