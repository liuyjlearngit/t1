package com.cmdi.db.initializer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Main {

    public static void main(String[] args) {
        if (null == args || args.length != 4) {
            throw new IllegalArgumentException("参数错误");
        }
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new IllegalArgumentException("没有找到JDBC驱动");
        }
        String url = args[0];
        String username = args[1];
        String password = args[2];
        String database = args[3];
        try {
            Connection connection = DriverManager.getConnection(url, username, password);
            Statement statement = connection.createStatement();
            String dropDB = "DROP DATABASE IF EXISTS \"" + database + "\"";
            int result = statement.executeUpdate(dropDB);
            System.out.println("DROP DB: " + dropDB + ", RESULT: " + result);
            String createDB = "CREATE DATABASE \"" + database + "\"";
            result = statement.executeUpdate(createDB);
            System.out.println("CREATE DB: " + createDB + ", RESULT: " + result);
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }
}
