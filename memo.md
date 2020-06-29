## 作業メモ

#### vehiclesテーブルの確認

* vehiclesテーブルができたことの確認

```
mysql> show tables;
+------------------------------------+
| Tables_in_practice-sti_development |
+------------------------------------+
| ar_internal_metadata               |
| schema_migrations                  |
| vehicles                           |
+------------------------------------+
3 rows in set (0.00 sec)
```

* vehiclesテーブルの中身の確認
  * typeにMotorcycleやCarなどがはいるはず、、、！

```
mysql> desc vehicles;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| id         | bigint        | NO   | PRI | NULL    | auto_increment |
| type       | varchar(255)  | YES  |     | NULL    |                |
| color      | varchar(255)  | YES  |     | NULL    |                |
| price      | decimal(10,2) | YES  |     | NULL    |                |
| created_at | datetime      | NO   |     | NULL    |                |
| updated_at | datetime      | NO   |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
6 rows in set (0.01 sec)
```

#### データを作る

* 以下のコマンドでデータを作成。

```
Motorcycle.create(color: "blue", price: 3000)
Car.create(color: "Red", price: 3000)
Bicycle.create(color: "Black", price: 111)

```

#### 実際に発行されたSQLを確認

```
Motorcycle Create (1.1ms)  INSERT INTO `vehicles` (`type`, `color`, `price`, `created_at`, `updated_at`) 
    VALUES ('Motorcycle', 'blue', 3000.0, '2020-06-29 12:56:28', '2020-06-29 12:56:28')

Car Create (0.6ms)  INSERT INTO `vehicles` (`type`, `color`, `price`, `created_at`, `updated_at`) 
    VALUES ('Car', 'Red', 3000.0, '2020-06-29   12:56:40', '2020-06-29 12:56:40')

Bicycle Create (0.7ms)  INSERT INTO `vehicles` (`type`, `color`, `price`, `created_at`, `updated_at`) 
    VALUES ('Bicycle', 'Black', 111.0,  '2020-06-29 13:00:33', '2020-06-29 13:00:33')ß
```


#### 実際に登録したデータの確認

* 目的通りtypeでわけることができた

```
mysql> select * from vehicles;
+----+------------+--------+------------+---------------------+---------------------+
| id | type       | color  | price      | created_at          | updated_at          |
+----+------------+--------+------------+---------------------+---------------------+
|  1 | Motorcycle | blue   |    3000.00 | 2020-06-29 12:56:28 | 2020-06-29 12:56:28 |
|  2 | Car        | Red    |    3000.00 | 2020-06-29 12:56:40 | 2020-06-29 12:56:40 |
|  3 | Car        | Orange | 3003330.00 | 2020-06-29 12:58:23 | 2020-06-29 12:58:23 |
|  4 | Bicycle    | Black  |     111.00 | 2020-06-29 13:00:33 | 2020-06-29 13:00:33 |
+----+------------+--------+------------+---------------------+---------------------+
4 rows in set (0.00 sec)
```