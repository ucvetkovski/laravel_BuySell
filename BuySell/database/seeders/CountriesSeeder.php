<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\DB;

class CountriesSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create();


        for ($i = 0; $i < 50; $i++) {
            $randomCountry = $faker->country();
            $existingRecord = DB::table('countries')
                ->where('country_name', $randomCountry)
                ->first();
            if (!$existingRecord) {
                DB::table('countries')->insert([
                    'country_name' => $randomCountry
                ]);
            }

        }
    }
}
