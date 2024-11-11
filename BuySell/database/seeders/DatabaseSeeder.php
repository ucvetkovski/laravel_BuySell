<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call(CategoriesSeeder::class);
        $this->call(CountriesSeeder::class);
        $this->call(CitiesSeeder::class);
        $this->call(ItemStateSeeder::class);
        $this->call(PriceTypeSeeder::class);
        $this->call(RolesSeeder::class);
        $this->call(UsersSeeder::class);
        $this->call(ItemsSeeder::class);
    }
}
