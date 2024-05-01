<?php
class dbReq{
    private static $username;
    private static $password;
    private static $itemCode;
    static public function checkUsernameAndPass($username, $password){
        self::$username = $username;
        self::$password = $password;
        include ('dbcon.php');
        $pdo = Database::Connect();
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = "select * from staff where StaffName = '".self::$username."'";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetch();
        if ($result['StaffName'] == self::$username) {
            return "success";
        }
        return "noValidUser";
    }
    public static function returnItemCode($itemCode){
        self::$itemCode = $itemCode;
        include ('dbcon.php');
        $pdo = Database::Connect();
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = "select p.ProductCode, p.ProductName, p.ProductPrice, pc.ProductCategoryName from product p join productcategory pc on p.productCategoryCode = pc.productCategoryCode where p.productCode = ".self::$itemCode.";";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetch();
        if ($result['ProductCode'] == self::$itemCode) {
            return $result;
        }
        return "noValidItemCode";
    }
}
