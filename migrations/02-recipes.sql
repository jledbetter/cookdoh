BEGIN;
CREATE TABLE `recipes_foodtype` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `name` varchar(100) NOT NULL
)
;
CREATE TABLE `recipes_recipe_food_type` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `recipe_id` integer NOT NULL,
    `foodtype_id` integer NOT NULL,
    UNIQUE (`recipe_id`, `foodtype_id`)
)
;
ALTER TABLE `recipes_recipe_food_type` ADD CONSTRAINT `foodtype_id_refs_id_44680d75` FOREIGN KEY (`foodtype_id`) REFERENCES `recipes_foodtype` (`id`);
CREATE TABLE `recipes_recipe` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `title` varchar(100) NOT NULL,
    `added_by_id` integer NOT NULL,
    `date_added` date NOT NULL,
    `instructions` longtext NOT NULL,
    `ingredients` longtext NOT NULL
)
;
ALTER TABLE `recipes_recipe` ADD CONSTRAINT `added_by_id_refs_id_26f120a4` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `recipes_recipe_food_type` ADD CONSTRAINT `recipe_id_refs_id_54ec0375` FOREIGN KEY (`recipe_id`) REFERENCES `recipes_recipe` (`id`);
CREATE INDEX `recipes_recipe_72f634e2` ON `recipes_recipe` (`added_by_id`);
COMMIT;
