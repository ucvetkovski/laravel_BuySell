<label for="filter_categories">
    <strong>Category</strong></label>

@foreach ($categories as $category)
    <div>
        <label for={{ $category->category_name }}>{{ $category->category_name }}

            {{-- @foreach ($counter as $catC => $count)
                @if ($category->id_category == $catC)
                    ({{ $count }})
                @endif
            @endforeach --}}
        </label>
        <input type="checkbox" @if (isset($selectedCategory) && $selectedCategory->id_category == $category->id_category) checked @endif class="category_checkbox"
            value="{{ $category->id_category }}" id="{{ $category->category_name }}" />
    </div>
@endforeach
