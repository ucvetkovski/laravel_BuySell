<tr class="border">
    <td class="border-bottom-0">
        <h6 class="fw-semibold mb-0">{{ $user->id_user }}</h6>
    </td>
    <td class="border-bottom-0">
        <h6 class="fw-semibold mb-1">{{ $user->name }}
            {{ $user->surname }}</h6>
    </td>
    <td class="border-bottom-0">
        <h6 class="fw-semibold mb-0">{{ $user->city_name }}</h6>
    </td>
    <td class="border-bottom-0">
        <h6 class="fw-semibold mb-0">{{ $user->country_name }}</h6>
    </td>
    <td class="border-bottom-0">
        <h6 class="fw-semibold mb-0">{{ $user->phone_number }}</h6>
    </td>
    <td class="border-bottom-0">
        <h6 class="fw-semibold mb-0">{{ $user->email }}</h6>
    </td>
    <td class="border-bottom-0">
        <button class="btn btn-success editUserBtn" id="{{ $user->id_user }}" data-token="{{ @csrf_token() }}"
            type="button">Edit</button>
    </td>
    <td class="border-bottom-0">
        <button class="btn btn-danger deleteUserBtn" id={{ $user->id_user }} data-token="{{ @csrf_token() }}"
            type="button">Delete</button>
    </td>
</tr>
