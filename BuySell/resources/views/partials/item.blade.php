 <div class="p-2">
     <div class="card h-100">
         <div id={{ $item->id_item }} class="card-img-top"
             style="background-image: url( @if (isset($item->image)) {{ asset('upload/items/' . $item->image) }}  @else https://dummyimage.com/500/000000/fff @endif); height: 200px; background-size:contain; background-repeat: no-repeat; background-position:center; background-color:black;">
         </div>
         <div class="card-body p-4">
             <div class="text-center">
                 <h5 class="fw-bolder">{{ $item->item_name }}</h5>
                 <div class="small mb-"><span class="text-muted">{{ $item->state_name }}</span></div>
                 <p>${{ $item->item_price }}</p>
             </div>
         </div>
         <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
             <div class="text-center"><a class="btn  mt-auto item_btn"
                     href="{{ route('itemPage', ['id' => $item->id_item]) }}">See more</a></div>
         </div>
     </div>
 </div>
