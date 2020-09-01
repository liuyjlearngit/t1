//package xyz.yaxshi.dims;
//
///**
// * @author xl.zhao
// */
//
//
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
//import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
//import org.springframework.test.web.servlet.setup.MockMvcBuilders;
//import org.springframework.web.context.WebApplicationContext;
//import xyz.yaxshi.dims.data.service.IssueDataExportService;
//
//import java.io.*;
//import java.lang.reflect.Field;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.zip.ZipEntry;
//import java.util.zip.ZipOutputStream;
//
//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
//
//
//@RunWith(SpringRunner.class)
//@SpringBootTest
//@AutoConfigureMockMvc
//@WebAppConfiguration
//public class TestIssueData {
//
//    private MockMvc mvc;
//    @Autowired
//    private WebApplicationContext context;
//    @Before
//    public void setUp() {
//        mvc = MockMvcBuilders.webAppContextSetup(context).build();
//    }
//
//
//    @Autowired
//    IssueDataExportService issueDataExportService;
//
//    /**
//     * swagger欢迎页面
//     *
//     * @throws Exception
//     */
////    @Test
////    public void get() throws Exception {
////        mvc.perform(MockMvcRequestBuilders.get("/swagger"))
////                .andDo(print())
////                .andExpect(MockMvcResultMatchers.status().isOk())
////                .andExpect(MockMvcResultMatchers.content().string("hello swagger ..."));
////
////    }
//
////    @Test
////    public void export() throws  Exception{
////
////        issueDataExportService.batchExport(null,null,null,null);
////    }
//
//    public static void main(String[] args) throws IOException {
////        List<String> list=new ArrayList<String>();
////        list.add("nihao");
////        list.add("wangwu");
////
////        File f=new File("test.zip");
////        ZipOutputStream zipOut=new ZipOutputStream(new FileOutputStream(f));
////
////        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
////        byteArrayOutputStream.write("666".getBytes());
//
//
//    }
//
//
//
//    public void zip() throws IOException {
//        File  dir =new File("D:\\develop\\ideaworkspace\\dims\\dims-web\\temp\\faec5329d3094a7e97bea0a3313b2745");
//        File zipfile=new File("D:\\develop\\ideaworkspace\\dims\\dims-web\\temp\\A.zip");
//        InputStream input =null;//文件输入流
//        ZipOutputStream zipOut=null;//声明压缩对象
//        zipOut=new ZipOutputStream(new FileOutputStream(zipfile));
//        zipOut.setComment("11111");//注释
//        int temp=0;
//        if(dir.isDirectory()){
//            File lists[] = dir.listFiles();
//            for(int i=0;i<lists.length;i++){
//                input =new FileInputStream(lists[i]);
//                zipOut.putNextEntry(new ZipEntry( lists[i].getName()));
//                while((temp=input.read())!=-1){
//                    zipOut.write(temp);
//                }
//                input.close();
//            }
//        }
//        zipOut.close();
//
//    }
//}
