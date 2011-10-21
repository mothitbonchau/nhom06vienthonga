/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.UTIL;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/**
 *
 * @author LAPTOP
 */
public class HinhAnh {

    public static int DiChuyenHinhAnh(String path_cu, String path_moi) {
        try {
            File hinh_cu = new File(path_cu);
            FileInputStream fis = new FileInputStream(hinh_cu);
            File hinh_moi = new File(path_moi);
            FileOutputStream fos = new FileOutputStream(hinh_moi);

            byte[] temp = new byte[10000];
            do {
                fis.read(temp);
                fos.write(temp);
            } while (fis.available() > 0);

            fis.close();
            fos.close();
            
            hinh_cu.delete();
        } catch (Exception ex) {
            return 0;
        }
        return 1;
    }
}
