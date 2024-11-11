@csrf <!-- Include the CSRF token field -->
<input type="hidden" value="{{ $user->id_city }} " id="userCity" />

<div class="form-group p-2">
    <input class="form-control" value="{{ $user->id_user }}" type="hidden" name="id" id="id">
</div>
<div class="form-group p-2">
    <label for="name">Name</label>
    <input class="form-control" value="{{ $user->name }}" type="name" name="name" id="name" required>
</div>
<div class="form-group p-2">
    <label for="surname">Surname</label>
    <input class="form-control" value="{{ $user->surname }}" type="text" name="surname" id="surname" required>
</div>
<div class="form-group p-2">
    <label for="email">Phone number</label>
    <input class="form-control" value="{{ $user->phone_number }}" type="text" name="phone" id="phone" required>
</div>

<div class="form-group p-2">
    <label for="country">Country</label>
    <select class="form-select p-2 col-md-6" id="country" data-token="{{ csrf_token() }}" name="country">
        <option selected disabled>Select a country</option>
        @foreach ($allCountries as $country)
            <option @if ($country->id_country == $user->id_country) selected='true' @endif value="{{ $country->id_country }}"
                id="{{ $country->country_name }}">
                {{ $country->country_name }}</option>
        @endforeach
    </select>
</div>

<div class="form-group p-2" id='city_div'>
    <label for="city">City</label>
    <select class="form-select p-2 col-md-6" id="city" name="city">
    </select>
</div>

<div class="form-group p-2" id="address_div">
    <label for="address">Address</label>
    <input class="form-control p-2" type="text" value="{{ $user->address }}" id="address" name="address" />
</div>

<div class="form-group p-2">
    <label for="username">Username</label>
    <input class="form-control" value="{{ $user->username }}" type="text" name="username" id="username" required>
</div>

<div class="form-group p-2">
    <label for="email">Email</label>
    <input class="form-control" value="{{ $user->email }}" type="email" name="email" id="email" required>
</div>

<div class="form-group p-2">
    <label for="password">Password</label>
    <input class="form-control" type="password" name="password" id="password">
</div>

<div class="form-group p-2 col-md-2">
    <button class="form-control col-md-12" type="submit">Save changes</button>
</div>
