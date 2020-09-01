package com.cmdi.dims.file.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class FtpServiceTest {


    public static void main(String[] args) throws IOException {
        String fileName = "C:\\Users\\ZhongnanLI\\Downloads\\test\\20180823\\CM_PORT.csv";

//        InputStream is = new FileInputStream("C:\\Users\\ZhongnanLI\\Downloads\\test\\20180823\\CM_PORT.csv");
//
//        CSVParser parser = CSVFormat.DEFAULT.withFirstRecordAsHeader().parse(new InputStreamReader(is, "GBK"));
//        int i = 0;
//        for (CSVRecord r : parser) {
//            System.out.println(i++);
//        }

        RandomAccessFile raf = new RandomAccessFile(fileName, "r");
        //取得文件长度（字节数）
        long orignFileSize = raf.length();

        FileInputStream orginFile = new FileInputStream(fileName);

        MappedByteBuffer inputBuffer = null;
        //如果是整行，则改行最后两个字符是/r/n，所以index小于this.endFilePointer才需要进入
        int index = 0;
        ExecutorService executorService = Executors.newFixedThreadPool(4);
        int bufferSize = 1024 * 1024 * 20;
        for (long i = 0; i < orignFileSize; i = i + bufferSize) {

            inputBuffer = orginFile.getChannel().map(FileChannel.MapMode.READ_ONLY,
                    i, bufferSize);
            int j = 0;
            int preLfIdx = 0;
            while (j < bufferSize) {
                if (inputBuffer.get(j) == '\n') {
                    System.out.println(index++);
                }
                j++;
            }
        }

    }
}
