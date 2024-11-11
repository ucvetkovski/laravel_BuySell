<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;


class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        $faker = Faker::create();

        $cityIds = DB::table('cities')->pluck('id_city')->toArray();
        $roleIds = DB::table('roles')->pluck('id_role')->toArray();

        for ($i = 0; $i < 30; $i++) {
            // Get a random city ID
            $randomCityId = $faker->randomElement($cityIds);
            $randomRoleId = $faker->randomElement($roleIds);

            DB::table('users')->insert([
                'name' => $faker->firstName(),
                'surname' => $faker->lastName(),
                'username' => $faker->userName(),
                'password' => Hash::make('admin1324'),
                'phone_number' => $faker->phoneNumber(),
                'email' => $faker->email(),
                'address' => $faker->address(),
                'id_city' => $randomCityId,
                'id_role' => $randomRoleId,
            ]);
        }
    }
}
