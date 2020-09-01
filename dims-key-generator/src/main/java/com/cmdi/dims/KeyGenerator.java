package com.cmdi.dims;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class KeyGenerator {

    public static String encrypt(String strToEncrypt, String keyStr, String ivStr) {
        try {
            IvParameterSpec iv = new IvParameterSpec(ivStr.getBytes("UTF-8"));
            SecretKeySpec key = new SecretKeySpec(keyStr.getBytes("UTF-8"), "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.ENCRYPT_MODE, key, iv);
            return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
        } catch (Exception e) {
            System.out.println("Error while encrypting: " + e.toString());
        }
        return null;
    }

    public static String decrypt(String strToDecrypt, String keyStr, String ivStr) {
        try {
            IvParameterSpec iv = new IvParameterSpec(ivStr.getBytes("UTF-8"));
            SecretKeySpec key = new SecretKeySpec(keyStr.getBytes("UTF-8"), "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, key, iv);
            return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
        } catch (Exception e) {
            System.out.println("Error while decrypting: " + e.toString());
        }
        return null;
    }

    private static final String LETTERS = "abcdefghijklmnopqrstuvwxyz0123456789";

    private static final Random RANDOM = new Random(System.currentTimeMillis());

    private static String random(int length) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < length; i++) {
            builder.append(LETTERS.charAt(RANDOM.nextInt(36)));
        }
        return builder.toString();
    }

    public static void main(String[] args) {
        if (null == args || args.length != 1) {
            throw new IllegalArgumentException("参数错误");
        }
        String mac = args[0].toUpperCase();

        String key = random(16);
        String iv = random(16);
        String encrypted = encrypt(mac, key, iv);
        String finalKey = key + "$" + iv + "$" + encrypted;
        System.out.println(Base64.getEncoder().encodeToString(finalKey.getBytes(StandardCharsets.UTF_8)));
    }
}
