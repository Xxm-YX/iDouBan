package com.lzh.servlet;

import com.google.gson.Gson;
import com.lzh.entity.User;
import com.lzh.service.UserService;
import com.lzh.util.ImageUrl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        ArrayList<String> fileList = new ArrayList<>();
        String rel = getServletContext().getRealPath("/image");
        String path = request.getContextPath();

        PrintWriter out = response.getWriter();
        File root = new File(rel);
        File[] files = root.listFiles();
        for (File file : files) {
            String name = file.getName();
            String picPathStr = "http://localhost:8080"+path+"/image/"+name;
            fileList.add(picPathStr);
            System.out.println(picPathStr);
        }

        Gson gson = new Gson();
        String info = gson.toJson(fileList);
        System.out.println(info);

        out.write(info);




        //       String rel = req.getServletContext().getRealPath("/image");
//       File f = new File(rel);
//
//       if(!f.exists()){
//           System.out.println("文件夹不存在");
//       }else {
//           File temp[] = f.listFiles();
//           FileInputStream fis = null;
//           for (int i = 0; i < temp.length; i++) {
//               String name = temp[i].getName();
//               System.out.println("图片"+name+"~~~~~~~~~~~~~~~");
//               fis = new FileInputStream(temp[i].getAbsolutePath());
//               int size = fis.available();//文件大小
//               byte data[] = new byte[size];
//               fis.read(data);//读数据
//               fis.close();
//               req.setAttribute("data",data);
//           }
//           req.getRequestDispatcher(req.getContextPath()+"/photoGraph.jsp");
//    }


    }


}
