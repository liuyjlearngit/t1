package com.cmdi.dims;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.ArchiveInputStream;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;

public class TestCompressMain {

    public static void main(String[] args) throws Exception {
//        InputStream fs = Files.newInputStream(Paths.get("C:\\Users\\ZhongnanLI\\Downloads\\test\\zip", "commons-compress-1.18-bin.tar.gz"));
//        BufferedInputStream bis = new BufferedInputStream(fs);
//
//
////        CompressorInputStream cis = CompressorStreamFactory.getSingleton().createCompressorInputStream(bis);
//
//        ArchiveInputStream ais = new ArchiveStreamFactory().createArchiveInputStream(bis);
//        ArchiveEntry entry = null;
//        while ((entry = ais.getNextEntry()) != null) {
//            if (entry.isDirectory()) {
//                Files.createDirectories(Paths.get("C:\\Users\\ZhongnanLI\\Downloads\\test\\zip", entry.getName()));
//                continue;
//            } else {
//                Files.copy(ais, Paths.get("C:\\Users\\ZhongnanLI\\Downloads\\test\\zip", entry.getName()));
//            }
//        }
        System.out.println("123456".substring(0,4));
    }
}
