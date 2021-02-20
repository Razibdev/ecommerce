<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;

class CategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categoryRecords = [
            ['id' => 1, 'parent_id' => 0, 'category_name' => 'T-Shirts', 'description' => '', 'url' => 't-shirts',  'status' => 1],
            ['id' => 2, 'parent_id' => 1, 'category_name' => 'Casual T-Shirts', 'description' => '', 'url' => 'casual-t-shirts', 'status' => 1]
        ];

        Category::insert($categoryRecords);
    }
}
