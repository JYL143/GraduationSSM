package cn.jyl.Util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public  class FileInput {

    //添加图片操作
    public static String file(MultipartFile file) throws IOException {

        // 获取原始图片的扩展名
        String originalFilename = file.getOriginalFilename();
        if (originalFilename!=null && originalFilename!=""){  //防止收到的是空图片
            // 保存图片的路径，图片上传成功后，将路径保存到数据库,这里强行放到当前目录那个文件夹，这是绝对位置，所以到时候看看有没有空研究一些获取这个路径问题
            String filePath = "D:\\上课保存\\IJ2\\GraduationSSM\\src\\main\\webapp\\upload";

            // 生成文件新的名字,.toString().replace("-","")这个是去掉uuid的4个-
            String newFileName = UUID.randomUUID().toString().replace("-","") + originalFilename;
            // 封装上传文件位置的全路径
            File targetFile = new File(filePath, newFileName);  //图片存放的位置和图片新名字
            file.transferTo(targetFile);
            return newFileName;
        }else {

            return null;
        }



    }
}
