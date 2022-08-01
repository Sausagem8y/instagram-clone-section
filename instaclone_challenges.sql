# CHALLENGE 1
SELECT * FROM users ORDER BY created_at LIMIT 5;

# CHALLENGE 2 most popular registration date
SELECT DAYNAME(created_at) AS day, COUNT(*) AS total FROM users GROUP BY day ORDER BY total DESC;

# CHALLENGE 3 INACTIVE USERS 
SELECT username, image_url FROM users LEFT JOIN photos ON users.id = photos.user_id 
WHERE photos.id IS NULL;

# CHALLENGE 4 MOST LIKED PHOTO 
SELECT username, photos.id, photos.image_url, COUNT(*) AS total_likes FROM photos 
INNER JOIN likes ON likes.photo_id = photos.id 
INNER JOIN users ON photos.user_id = users.id 
GROUP BY photos.id ORDER BY total_likes DESC LIMIT 3;

# CHALLENGE 5 AVG POSTS PER USER 
SELECT(SELECT COUNT(*) FROM photos) /
(SELECT COUNT(*) FROM users) AS average_posts;

# CHALLENGE 6 MOST USED HASHTAG
SELECT tags.tag_name, COUNT(*) AS tag_num FROM photo_tags JOIN tags ON photo_tags.tag_id = tags.id GROUP BY tags.id 
ORDER BY tag_num DESC LIMIT 5;

# CHALLENGE 7 FIND BOTS WHO LIKE ALL PHOTOS 
SELECT username, Count(*) AS total_likes FROM users JOIN likes
ON users.id = likes.user_id GROUP BY likes.user_id
HAVING total_likes = (SELECT Count(*) FROM photos);
