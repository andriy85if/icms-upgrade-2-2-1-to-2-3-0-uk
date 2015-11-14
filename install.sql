DROP TABLE IF EXISTS `{#}users_personal_settings`;
CREATE TABLE `{#}users_personal_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `skey` varchar(150) DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`skey`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

ALTER TABLE `{#}activity` ADD `is_pub` BOOLEAN NULL DEFAULT '1', ADD INDEX (`is_pub`);

ALTER TABLE  `{#}activity` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `type_id`  `type_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `group_id`  `group_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `subject_id`  `subject_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `images_count`  `images_count` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_private`  `is_private` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0',
CHANGE  `is_parent_hidden`  `is_parent_hidden` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_pub`  `is_pub` TINYINT( 1 ) UNSIGNED NULL DEFAULT  '1';

ALTER TABLE  `{#}activity_types` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `is_enabled`  `is_enabled` TINYINT( 1 ) UNSIGNED NULL DEFAULT  '1';

ALTER TABLE  `{#}comments` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `parent_id`  `parent_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID батьківського коментаря',
CHANGE  `level`  `level` TINYINT( 4 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Рівень вкладеності',
CHANGE  `ordering`  `ordering` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Порядковий номер в дереві',
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID автора',
CHANGE  `target_id`  `target_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID об’єкту коментування',
CHANGE  `is_deleted`  `is_deleted` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Коментар видалений?',
CHANGE  `is_private`  `is_private` TINYINT( 1 ) UNSIGNED NULL DEFAULT  '0' COMMENT  'Тільки для друзів?';

ALTER TABLE  `{#}comments_rating` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `comment_id`  `comment_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ;

ALTER TABLE  `{#}comments_tracks` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `target_id`  `target_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ;

ALTER TABLE  `{#}content_datasets` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `ctype_id`  `ctype_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID типу контенту',
CHANGE  `ordering`  `ordering` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Порядковий номер',
CHANGE  `is_visible`  `is_visible` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Відображати набір на сайті?';

ALTER TABLE  `{#}content_folders` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `ctype_id`  `ctype_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ;

ALTER TABLE `{#}content_types` CHANGE `id` `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT, CHANGE `is_date_range` `is_date_range` TINYINT(1) UNSIGNED NULL DEFAULT NULL, CHANGE `is_premod_add` `is_premod_add` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT 'Модерування при створенні?', CHANGE `is_premod_edit` `is_premod_edit` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT 'Модерування при редагуванні', CHANGE `is_cats` `is_cats` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT 'Категорії включені?', CHANGE `is_cats_recursive` `is_cats_recursive` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT 'Наскрізний перегляд категорій?', CHANGE `is_folders` `is_folders` TINYINT(1) UNSIGNED NULL DEFAULT NULL, CHANGE `is_in_groups` `is_in_groups` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT 'Створення в групах', CHANGE `is_in_groups_only` `is_in_groups_only` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT 'Створення тільки в групах', CHANGE `is_comments` `is_comments` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT 'Коментарі включені?', CHANGE `is_comments_tree` `is_comments_tree` TINYINT(1) UNSIGNED NULL DEFAULT NULL, CHANGE `is_rating` `is_rating` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT 'Дозволити рейтинг?', CHANGE `is_rating_pos` `is_rating_pos` TINYINT(1) UNSIGNED NULL DEFAULT NULL, CHANGE `is_tags` `is_tags` TINYINT(1) UNSIGNED NULL DEFAULT NULL, CHANGE `is_auto_keys` `is_auto_keys` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT 'Автоматична генерація ключових слів?', CHANGE `is_auto_desc` `is_auto_desc` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT 'Автоматична генерація опису?', CHANGE `is_auto_url` `is_auto_url` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT 'Генерувати URL із заголовку?', CHANGE `is_fixed_url` `is_fixed_url` TINYINT(1) UNSIGNED NULL DEFAULT NULL COMMENT 'Не змінювати URL при зміні запису?', CHANGE `is_fixed` `is_fixed` TINYINT(1) UNSIGNED NULL DEFAULT NULL;

ALTER TABLE  `{#}controllers` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `is_enabled`  `is_enabled` TINYINT( 1 ) UNSIGNED NULL DEFAULT  '1' COMMENT  'Увімкнений?',
CHANGE  `is_backend`  `is_backend` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Є адмінка?';

ALTER TABLE  `{#}groups` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `owner_id`  `owner_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Автор',
CHANGE  `members_count`  `members_count` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  'Кількість членів',
CHANGE  `join_policy`  `join_policy` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  'Політика вступу',
CHANGE  `edit_policy`  `edit_policy` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  'Політика редагування',
CHANGE  `wall_policy`  `wall_policy` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  'Політика стіни',
CHANGE  `is_closed`  `is_closed` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  'Закрита?';

ALTER TABLE  `{#}groups_invites` CHANGE  `id`  `id` INT( 11 ) NOT NULL AUTO_INCREMENT ,
CHANGE  `group_id`  `group_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID групи',
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID того, хто запросив',
CHANGE  `invited_id`  `invited_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID запрошеного';

ALTER TABLE  `{#}groups_members` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `group_id`  `group_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `role`  `role` TINYINT( 4 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  'Роль користувача в групі';

ALTER TABLE  `{#}images_presets` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `width`  `width` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `height`  `height` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_square`  `is_square` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_watermark`  `is_watermark` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `wm_margin`  `wm_margin` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_internal`  `is_internal` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ;

ALTER TABLE  `{#}menu` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `is_fixed`  `is_fixed` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Заборонено видаляти?';

ALTER TABLE  `{#}menu_items` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `menu_id`  `menu_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID меню',
CHANGE  `parent_id`  `parent_id` INT( 11 ) UNSIGNED NULL DEFAULT  '0' COMMENT  'ID батьківського пункту',
CHANGE  `ordering`  `ordering` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Порядковий номер';

ALTER TABLE  `{#}moderators` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `count_approved`  `count_approved` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0',
CHANGE  `count_deleted`  `count_deleted` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0',
CHANGE  `count_idle`  `count_idle` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0';

ALTER TABLE  `{#}moderators_tasks` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `moderator_id`  `moderator_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `author_id`  `author_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `item_id`  `item_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_new_item`  `is_new_item` TINYINT( 1 ) UNSIGNED NULL DEFAULT  '1';

ALTER TABLE  `{#}perms_rules` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ;

ALTER TABLE  `{#}perms_users` CHANGE  `rule_id`  `rule_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID правила',
CHANGE  `group_id`  `group_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID групи';

ALTER TABLE  `{#}photos` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `album_id`  `album_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `comments`  `comments` INT( 11 ) UNSIGNED NULL DEFAULT  '0';

ALTER TABLE  `{#}rating_log` CHANGE  `id`  `id` BIGINT( 20 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID користувача',
CHANGE  `target_id`  `target_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID суб’єкта (записи контенту, який оцінюється)',
CHANGE  `score`  `score` TINYINT( 3 ) NULL DEFAULT NULL COMMENT  'Значення оцінки';

ALTER TABLE  `{#}rss_feeds` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `ctype_id`  `ctype_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `limit`  `limit` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '15',
CHANGE  `is_enabled`  `is_enabled` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_cache`  `is_cache` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `cache_interval`  `cache_interval` INT( 11 ) UNSIGNED NULL DEFAULT  '60';

ALTER TABLE  `{#}scheduler_tasks` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `period`  `period` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_active`  `is_active` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_new`  `is_new` TINYINT( 1 ) UNSIGNED NULL DEFAULT  '1';

ALTER TABLE  `{#}sessions_online` CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ;

ALTER TABLE  `{#}tags` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `frequency`  `frequency` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '1';

ALTER TABLE  `{#}tags_bind` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `tag_id`  `tag_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `target_id`  `target_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ;

ALTER TABLE  `{#}uploaded_files` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `counter`  `counter` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0';

ALTER TABLE  `{#}users` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `is_admin`  `is_admin` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Адміністратор?',
CHANGE  `is_locked`  `is_locked` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Заблокований',
CHANGE  `files_count`  `files_count` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  'Кількість завантажених файлів',
CHANGE  `friends_count`  `friends_count` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  'Кількість друзів',
CHANGE  `status_id`  `status_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Текстовий статус',
CHANGE  `inviter_id`  `inviter_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `invites_count`  `invites_count` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0',
CHANGE  `city`  `city` INT( 11 ) UNSIGNED NULL DEFAULT NULL ;

ALTER TABLE  `{#}users_contacts` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID користувача',
CHANGE  `contact_id`  `contact_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID контакту (іншого користувача)',
CHANGE  `messages`  `messages` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  'Кількість повідомлень';

ALTER TABLE  `{#}users_fields` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `ctype_id`  `ctype_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `ordering`  `ordering` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_in_list`  `is_in_list` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_in_item`  `is_in_item` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_in_filter`  `is_in_filter` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_private`  `is_private` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_fixed`  `is_fixed` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_fixed_type`  `is_fixed_type` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_system`  `is_system` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ;

ALTER TABLE  `{#}users_friends` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID користувача',
CHANGE  `friend_id`  `friend_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID друга',
CHANGE  `is_mutual`  `is_mutual` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Дружба взаємна?';

ALTER TABLE  `{#}users_groups` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `is_fixed`  `is_fixed` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Системна?',
CHANGE  `is_public`  `is_public` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Групу можна обрати при реєстрації?',
CHANGE  `is_filter`  `is_filter` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Виводити групу в фільтрі користувачів?';

ALTER TABLE  `{#}users_groups_members` CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NOT NULL ,
CHANGE  `group_id`  `group_id` INT( 11 ) UNSIGNED NOT NULL ;

ALTER TABLE  `{#}users_groups_migration` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `is_active`  `is_active` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `group_from_id`  `group_from_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `group_to_id`  `group_to_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_keep_group`  `is_keep_group` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_passed`  `is_passed` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_rating`  `is_rating` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_karma`  `is_karma` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `passed_days`  `passed_days` INT( 11 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `passed_from`  `passed_from` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `is_notify`  `is_notify` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ;

ALTER TABLE  `{#}users_ignors` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NOT NULL COMMENT  'ID користувача',
CHANGE  `ignored_user_id`  `ignored_user_id` INT( 11 ) UNSIGNED NOT NULL COMMENT  'ID користувача, який ігнорується';

ALTER TABLE  `{#}users_invites` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL ;

ALTER TABLE  `{#}users_karma` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Хто поставив',
CHANGE  `profile_id`  `profile_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Кому поставив';

ALTER TABLE  `{#}users_messages` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `from_id`  `from_id` INT( 11 ) UNSIGNED NOT NULL COMMENT  'ID відправника',
CHANGE  `to_id`  `to_id` INT( 11 ) UNSIGNED NOT NULL COMMENT  'ID отримувача',
CHANGE  `is_new`  `is_new` TINYINT( 1 ) UNSIGNED NULL DEFAULT  '1' COMMENT  'Не прочитано?';

ALTER TABLE  `{#}users_notices` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NOT NULL ;

ALTER TABLE  `{#}users_statuses` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Користувач',
CHANGE  `replies_count`  `replies_count` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  'Кількість відповідей',
CHANGE  `wall_entry_id`  `wall_entry_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID запису на стіні';

ALTER TABLE  `{#}users_tabs` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `is_active`  `is_active` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL ,
CHANGE  `ordering`  `ordering` INT( 11 ) UNSIGNED NULL DEFAULT NULL ;

ALTER TABLE  `{#}wall_entries` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `profile_id`  `profile_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID профілю',
CHANGE  `user_id`  `user_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID автора',
CHANGE  `parent_id`  `parent_id` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  'ID батьківського запису',
CHANGE  `status_id`  `status_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Зв’язок із статусом користувача';

ALTER TABLE  `{#}widgets` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ;

ALTER TABLE  `{#}widgets_bind` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
CHANGE  `widget_id`  `widget_id` INT( 11 ) UNSIGNED NOT NULL ,
CHANGE  `is_title`  `is_title` TINYINT( 1 ) UNSIGNED NULL DEFAULT  '1' COMMENT  'Показувати заголовок',
CHANGE  `is_enabled`  `is_enabled` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Увімкнений?',
CHANGE  `is_tab_prev`  `is_tab_prev` TINYINT( 1 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Об’єднувати з попереднім?',
CHANGE  `page_id`  `page_id` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'ID сторінки для виводу',
CHANGE  `ordering`  `ordering` INT( 11 ) UNSIGNED NULL DEFAULT NULL COMMENT  'Порядковий номер';

ALTER TABLE  `{#}widgets_pages` CHANGE  `id`  `id` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ;
