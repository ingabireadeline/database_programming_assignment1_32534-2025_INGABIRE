-- Recursive CTE to build the supplier organizational tree
WITH SupplierHierarchy (SupplierID, SupplierName, Region, ParentSupplierID, HierarchyLevel) AS (
    -- Anchor member: Top-level suppliers
    SELECT SupplierID, SupplierName, Region, ParentSupplierID, 1 AS HierarchyLevel
    FROM SUPPLIERS
    WHERE ParentSupplierID IS NULL
    UNION ALL
    -- Recursive member: Child suppliers
    SELECT s.SupplierID, s.SupplierName, s.Region, s.ParentSupplierID, sh.HierarchyLevel + 1
    FROM SUPPLIERS s
    INNER JOIN SupplierHierarchy sh ON s.ParentSupplierID = sh.SupplierID
)
SELECT LPAD(' ', 2 * (HierarchyLevel - 1)) || SupplierName AS SupplierTree, Region, HierarchyLevel
FROM SupplierHierarchy
ORDER BY HierarchyLevel, SupplierID;
