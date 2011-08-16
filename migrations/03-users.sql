BEGIN;
CREATE TABLE `users_userprofile_specialty` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `userprofile_id` integer NOT NULL,
    `foodtype_id` integer NOT NULL,
    UNIQUE (`userprofile_id`, `foodtype_id`)
)
;
CREATE TABLE `users_userprofile` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `user_id` integer NOT NULL UNIQUE,
    `summary` varchar(500) NOT NULL
)
;
ALTER TABLE `users_userprofile` ADD CONSTRAINT `user_id_refs_id_29ac45dc` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
ALTER TABLE `users_userprofile_specialty` ADD CONSTRAINT `userprofile_id_refs_id_5cc8a178` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`);
-- The following references should be added but depend on non-existent tables:
-- ALTER TABLE `users_userprofile_specialty` ADD CONSTRAINT `foodtype_id_refs_id_5262b5f8` FOREIGN KEY (`foodtype_id`) REFERENCES `recipes_foodtype` (`id`);
COMMIT;
