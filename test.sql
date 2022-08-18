-- What are the Top 25 schools (.edu domains)?
SELECT email_domain, COUNT(email_domain) AS 'Count Domain'
FROM users
GROUP BY 1
ORDER BY 2 DESC
LIMIT 25;

-- How many .edu learners are located in New York?
SELECT COUNT(*) AS 'Count New York'
FROM users
WHERE city = 'New York';

-- The mobile_app column contains either mobile-user or NULL. How many of these Codecademy learners are using the mobile app?
SELECT COUNT(mobile_app) AS 'Count Mobile App'
FROM users
WHERE mobile_app = 'mobile-user';

-- Query for the sign up counts for each hour.
SELECT strftime('%H', sign_up_at) AS 'Hour', 
    COUNT(*) AS 'Count Sign up' 
FROM users 
GROUP BY 1;

-- Do different schools (.edu domains) prefer different courses?
SELECT users.email_domain,
  COUNT(
    CASE
      WHEN progress.learn_cpp = 'started' OR progress.learn_cpp = 'completed' 
      THEN users.user_id
    END) AS 'CPP',
  COUNT(
    CASE
      WHEN progress.learn_sql = 'completed' OR progress.learn_sql = 'started' 
      THEN users.user_id
    END) AS 'SQL',
  COUNT(
    CASE
      WHEN progress.learn_html = 'completed' OR progress.learn_html = 'started' 
      THEN users.user_id
    END) AS 'HTML',
  COUNT(
    CASE
      WHEN progress.learn_javascript = 'started' OR progress.learn_javascript = 'completed' 
      THEN users.user_id
    END) AS 'JavaScript',
  COUNT(
    CASE
      WHEN progress.learn_java = 'started' OR progress.learn_java = 'completed' 
      THEN users.user_id
    END) AS 'Java'
FROM users
JOIN progress
  ON users.user_id = progress.user_id
GROUP BY 1
ORDER BY 2 DESC;
