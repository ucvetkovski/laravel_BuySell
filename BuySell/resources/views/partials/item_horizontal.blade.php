 <div class="m-2 row border border-danger col-md-12">
     <div id={{ $item->id_item }} class="col-md-4 col-12 item-img"
         style="background-image: url( @if (isset($item->image)) {{ asset('upload/items/' . $item->image) }}  @else https://dummyimage.com/500/000000/fff @endif)">
     </div>
     <div class="col-md-8 col-12 justify-content-between">
         <div class="px-3 mt-3">
             <a href="{{ route('itemPage', ['id' => $item->id_item]) }}">
                 <h4 class="fw-bolder">{{ $item->item_name }}</h4>
             </a>
         </div>
         <div class="px-3">
             <div>
                 <div class="small mb-1"><span class="text-muted">{{ $item->state_name }}</span></div>
                 <p>${{ $item->item_price }}<span class="small text-muted"> - {{ $item->type_name }}</span></p>
             </div>
         </div>
         <div class="px-3 d-flex justify-content-between">
             <div>
                 <a href="{{ route('itemPage', ['id' => $item->id_item]) }}">
                     <p>>>> See more</p>
                 </a>
             </div>

             <div class="d-flex justify-content-between">
                 <div class="small mb-1"><span class="text-muted">Posted by: {{ $item->username }}</span></div>
                 <div class="small mb-1 px-2"><span
                         class="text-muted">{{ date('d M Y h:i:s', strtotime($item->created_at)) }}</span>
                 </div>
             </div>
         </div>
     </div>
 </div>
