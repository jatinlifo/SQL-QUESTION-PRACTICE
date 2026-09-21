-- Table: Tree

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | p_id        | int  |
-- +-------------+------+
-- id is the column with unique values for this table.
-- Each row of this table contains information about the id of a node and the id of its parent node in a tree.
-- The given structure is always a valid tree.
 

-- Each node in the tree can be one of three types:

-- "Leaf": if the node is a leaf node.
-- "Root": if the node is the root of the tree.
-- "Inner": If the node is neither a leaf node nor a root node.
-- Write a solution to report the type of each node in the tree.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:


-- Input: 
-- Tree table:
-- +----+------+
-- | id | p_id |
-- +----+------+
-- | 1  | null |
-- | 2  | 1    |
-- | 3  | 1    |
-- | 4  | 2    |
-- | 5  | 2    |
-- +----+------+
-- Output: 
-- +----+-------+
-- | id | type  |
-- +----+-------+
-- | 1  | Root  |
-- | 2  | Inner |
-- | 3  | Leaf  |
-- | 4  | Leaf  |
-- | 5  | Leaf  |
-- +----+-------+
-- Explanation: 
-- Node 1 is the root node because its parent node is null and it has child nodes 2 and 3.
-- Node 2 is an inner node because it has parent node 1 and child node 4 and 5.
-- Nodes 3, 4, and 5 are leaf nodes because they have parent nodes and they do not have child nodes.
-- Example 2:


-- Input: 
-- Tree table:
-- +----+------+
-- | id | p_id |
-- +----+------+
-- | 1  | null |
-- +----+------+
-- Output: 
-- +----+-------+
-- | id | type  |
-- +----+-------+
-- | 1  | Root  |
-- +----+-------+
-- Explanation: If there is only one node on the tree, you only need to output its root attributes.
 

-- Note: This question is the same as 3054: Binary Tree Nodes.

-- 1. Create Database
CREATE DATABASE tree_db;

-- 2. Select Database
USE tree_db;


-- 3. Create Table
CREATE TABLE Tree (
    id INT PRIMARY KEY,
    p_id INT
);


-- 4. Insert Sample Data
INSERT INTO Tree (id, p_id) VALUES
(1, NULL),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 3);


-- 5. Check Table
SELECT * FROM Tree;


-- Write your PostgreSQL query statement below
SELECT 
    id,
    CASE 
        WHEN p_id IS NULL THEN 'Root' -- id is null then root node
        WHEN id NOT IN ( -- id is not p_id means id kisi ke bhi p_id nahi hai
            SELECT p_id -- p_id is not null 
            FROM Tree
            WHERE p_id IS NOT NULL -- id is not null 
        ) THEN 'Leaf' -- if true means leaf node
        ELSE 'Inner' -- otherwise inner node
    END AS type

FROM Tree;