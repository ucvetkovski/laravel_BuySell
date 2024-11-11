 <div class="m-2 row border border-danger col-md-12">
     <div id={{ $item->id_item }} class="col-md-4 col-12 item-img"
         style="background-image: url( @if (isset($item->image)) {{ asset('upload/items/' . $item->image) }}  @else https://dummyimage.com/500/000000/fff @endif)">
     </div>
     <div class="col-md-8 col-12 justify-content-between">
         <div class="px-3 mt-3">
             <h4 class="fw-bolder">{{ $item->item_name }}</h4>
         </div>
         <div class="px-3">
             <div>
                 <div class="small mb-1"><span class="text-muted">{{ $item->state_name }}</span></div>
                 <p>${{ $item->item_price }}<span class="small text-muted"> - {{ $item->type_name }}</span></p>
             </div>
         </div>
     </div>
 </div>
