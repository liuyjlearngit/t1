package com.cmdi.dims.config.security;

import com.cmdi.dims.system.entity.User;
import com.cmdi.dims.system.repository.UserRepository;
import com.cmdi.dims.task.entity.AreaCodeConfig;
import com.cmdi.dims.task.repository.AreaCodeConfigRepository;
import com.cmdi.dims.task.repository.FileLocationRepository;
import com.cmdi.dims.task.repository.TaskLatestRepository;
import com.cmdi.dims.task.repository.TaskRepository;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


@Service
public class IssueDataInterceptor  implements HandlerInterceptor {


    @Autowired
    private TaskLatestRepository taskLatestRepository;
    @Autowired
    private TaskRepository taskRepository;
    @Autowired
    private AreaCodeConfigRepository areaCodeConfigRepository;
    @Autowired
    private FileLocationRepository fileLocationRepository;
    @Autowired
    private UserRepository userRepository;



    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String  province=request.getParameter("province");
        String  speciality=request.getParameter("speciality");
        String  regionCode=request.getParameter("regioncode");
        Long  userId=Long.parseLong(request.getParameter("userid"));
        //获取当前界面传过来的regioncode
        AreaCodeConfig areaCodeConfig = areaCodeConfigRepository.findByCode(regionCode);
        //查询相应的区域级别
        int regionType = areaCodeConfig.getRegionType();
        //根据获取userid获取相应的区域级别
        User user = userRepository.findByUserId(userId);
        int userRegionType = user.getRegionType();
        //当前界面级别大于用户,返回不能查询
        if (userRegionType == 1) {
//            System.out.println("都能进行查询");
            return true;
        } else if (regionType > userRegionType) {
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write("权限不足");


            response.setContentType("application/json; charset=utf-8");
            PrintWriter writer = response.getWriter();
            JSONObject o = new JSONObject();
            o.put("status", "false");
            o.put("msg","权限不足");
            writer.write(o.toString());
            //不能进行查询
            return false;
        } else if (regionType <= userRegionType) {
            if (regionCode.substring(0, 4) != user.getRegionCode().substring(0, 4)) {
                //不能进行查询
                response.setContentType("application/json; charset=utf-8");
                PrintWriter writer = response.getWriter();
                JSONObject o = new JSONObject();
                o.put("status", "false");
                o.put("msg","权限不足");
                writer.write(o.toString());
                return false;
            }
        }
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
