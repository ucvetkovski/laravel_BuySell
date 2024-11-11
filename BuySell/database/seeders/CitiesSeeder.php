<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\DB;


class CitiesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        // Retrieve all countries
        $countries = DB::table('countries')->pluck('id_country');

        foreach ($countries as $countryId) {
            for ($i = 0; $i < 20; $i++) {
                DB::table('cities')->insert([
                    'city_name' => $faker->city(),
                    'id_country' => $countryId,
                ]);
            }
        }
    }
}
