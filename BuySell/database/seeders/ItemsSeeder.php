<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\DB;

class ItemsSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create();

        $categories = DB::table('categories')->pluck('id_category')->toArray();
        $priceTypes = DB::table('price_types')->pluck('id_type')->toArray();
        $itemStates = DB::table('item_states')->pluck('id_item_state')->toArray();
        $users = DB::table('users')->pluck('id_user')->toArray();


        for ($i = 0; $i < 20; $i++) {

            $randomCategoryId = $faker->randomElement($categories);
            $randomPriceType = $faker->randomElement($priceTypes);
            $randomItemState = $faker->randomElement($itemStates);
            $randomUser = $faker->randomElement($users);

            DB::table('items')->insert([
                'item_name' => $faker->word(),
                'item_price' => $faker->randomFloat(2, 0, 100),
                'id_category' => $randomCategoryId,
                'price_type' => $randomPriceType,
                'item_state' => $randomItemState,
                'item_description' => $faker->text(200),
                'id_user' => $randomUser,
            ]);
        }
    }
}
