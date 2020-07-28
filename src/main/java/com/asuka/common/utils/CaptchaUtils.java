package com.asuka.common.utils;

import cn.hutool.cache.Cache;
import cn.hutool.cache.CacheUtil;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.img.GraphicsUtil;
import cn.hutool.core.img.ImgUtil;
import cn.hutool.core.util.RandomUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

/**
 * 验证码工具
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/5/20
 */
public class CaptchaUtils {

    private static final Logger log = LoggerFactory.getLogger(CaptchaUtils.class);

    // 干扰线数量
    public static final int interfereCount = 66;

    private static final Cache<String, String> codeCache = CacheUtil.newFIFOCache(300);

    /**
     * 输出验证码
     *
     * @param key
     * @param code
     * @param outputStream
     */
    public static void out(String key, String code, OutputStream outputStream) {
        // 验证码缓存保存3分钟
        codeCache.put(key, code, DateUnit.MINUTE.getMillis() * 3);
        try {
            ImageIO.write(createImage(code), "jpg", outputStream);
        } catch (IOException e) {
            log.error(e.getMessage(), e);
        }
    }

    /**
     * 校验验证码
     *
     * @param key
     * @param code
     * @return
     */
    public static boolean verify(String key, String code) {
        String cacheCode = codeCache.get(key);
        if (cacheCode != null && cacheCode.equals(code)) {
            codeCache.remove(key);
            return true;
        }
        return false;
    }


    /**
     * 生成图片流
     *
     * @param code
     * @return
     */
    public static BufferedImage createImage(String code) {
        // 生成图片
        int imgWidth = 300;
        int imgHeight = 100;
        Random random = new Random();

        BufferedImage img = new BufferedImage(imgWidth, imgHeight, BufferedImage.TYPE_INT_BGR);
        // 转成可以画扭曲字符的画笔
        Graphics2D g = (Graphics2D) img.getGraphics();
        // 灰色
        g.setColor(Color.WHITE);
        // 填充画布
        g.fillRect(0, 0, imgWidth, imgHeight);
        // 边框
        g.drawRect(0, 0, imgWidth - 1, imgHeight - 1);
        // 字体
        g.setFont(new Font("Courier", Font.BOLD, imgHeight - 10));
        // 干扰线
        drawInterfere(imgWidth, imgHeight, g);

        // 随机颜色、随机角度旋转
        int x = 20;
        int y = (int) (imgHeight * 0.8);
        for (int i = 0; i < 4; i++) {
            // 生成随机数得到随机字符
            char ch = code.charAt(i);
            // 生成随机弧度
            int angle = random.nextInt(60) - 30;// 角度正负30度
            double radian = angle * Math.PI / 180;// 弧度
            // 旋转
            g.rotate(radian, x, y);
            // 随机颜色
            g.setColor(ImgUtil.randomColor(random));
            // 画字符串
            g.drawString("" + ch, x, y);
            // 会累计旋转 所以要转回去
            g.rotate(-radian, x, y);
            x += 60;
        }

        return img;
    }

    /**
     * 输出到流
     *
     * @param bytes
     * @param outputStream
     */
    public static void write(byte[] bytes, OutputStream outputStream) {
        try {
            outputStream.write(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static Image createImage(int width, int height, Font font, String code) {
        // 图像buffer
        final BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        final Graphics2D g = GraphicsUtil.createGraphics(image, Color.WHITE);

        // 干扰线
        drawInterfere(width, height, g);

        // 字符串
        GraphicsUtil.drawStringColourful(g, code, font, width, height);

        return image;
    }

    private static void drawInterfere(int width, int height, Graphics2D g) {
        final ThreadLocalRandom random = RandomUtil.getRandom();
        // 干扰线
        for (int i = 0; i < interfereCount; i++) {
            int xs = random.nextInt(width);
            int ys = random.nextInt(height);
            int xe = xs + random.nextInt(width / 8);
            int ye = ys + random.nextInt(height / 8);
            g.setColor(ImgUtil.randomColor(random));
            g.drawLine(xs, ys, xe, ye);
        }
    }

}
