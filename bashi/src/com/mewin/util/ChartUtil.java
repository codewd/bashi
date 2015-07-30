package com.mewin.util;

import java.awt.Color;
import java.awt.Font;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.IntervalMarker;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.LayeredBarRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.ui.Layer;
import org.jfree.ui.LengthAdjustmentType;
import org.jfree.ui.TextAnchor;

public class ChartUtil {

	/**
	 * 创建饼图
	 * 
	 * @param keyValue
	 *            图标数据集
	 * @param title
	 *            图标标题
	 * @return 图片名称
	 */
	public static String createPie(HashMap<String, Double> keyValue,
			String title, String filePath) {
		DefaultPieDataset dpd = new DefaultPieDataset();
		Iterator<String> keys = keyValue.keySet().iterator();

		while (keys.hasNext()) {
			String key = keys.next();
			Double value = keyValue.get(key);
			dpd.setValue(key, value);
		}
		JFreeChart chart = ChartFactory.createPieChart(title, dpd, true, true,
				false);

		PiePlot piePlot = (PiePlot) chart.getPlot();
		piePlot.setLabelFont(new Font("黑体", Font.BOLD, 18));
		chart.getTitle().setFont(new Font("黑体", Font.BOLD, 20));
		chart.getLegend().setItemFont(new Font("黑体", Font.BOLD, 18));
		return saveImg(chart, filePath);
	}

	/**
	 * 创建柱状图
	 * 
	 * @param value
	 *            1.值 2.数据分类 3.x轴的值
	 * @param config
	 *            0.图标名称 1.x轴标题 2.y轴标题 4.
	 * @param filePath
	 *            图片路径
	 * @return 图标文件名字
	 */
	@SuppressWarnings("rawtypes")
	public static String createCategory(List<List> value, String[] config,
			String filePath) {
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		// 添加数据

		for (int i = 0; i < value.size(); i++) {
			List list = value.get(i);
			
			String[] k = ((String) list.get(0)).split(",");
			
			for(String str : k){
				String [] kv = str.split(":");
				dataset.setValue(Double.parseDouble(kv[1]),kv[0],(String)list.get(1));
			}
		}

		JFreeChart chart = ChartFactory.createBarChart(config[0],config[1],config[2],
				dataset, PlotOrientation.VERTICAL, true, true, true);

		chart.setBackgroundPaint(new Color(0xbbbbdd));// 设置背景色
		CategoryPlot plot = chart.getCategoryPlot();
		plot.setBackgroundPaint(Color.white); // 柱状图的背景
		plot.setRangeGridlinesVisible(true); // 横虚线是否可见
		plot.setRangeGridlinePaint(Color.gray); // 设置横虚线的颜色

		// 获取柱图的呈现器

		// 可以控制柱图的位置,但是不能把显示的数据置顶。
		LayeredBarRenderer renderer1 = new LayeredBarRenderer();
		// 不可以控制柱图的位置，可以把显示的数据置顶。

		BarRenderer renderer = new BarRenderer();

		renderer.setMaximumBarWidth(0.05); // 设置柱状的宽度
		renderer.setBase(0.01);

		renderer.setDrawBarOutline(true); // 设置边框是否可见
		renderer.setBaseOutlinePaint(Color.blue); // 设置边框的颜色

		renderer.setSeriesPaint(0, Color.blue); // 第一种柱状的颜色
		renderer.setSeriesPaint(1, Color.orange); // 第二种柱状的颜色
		renderer.setSeriesPaint(2, Color.gray); // 第三种柱状的颜色

		renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(
				ItemLabelAnchor.CENTER, TextAnchor.BASELINE_CENTER));
		// 偏移量
		renderer.setItemLabelAnchorOffset(-30.0f);

		// 这里设置柱状图 数值
		 renderer.setItemLabelGenerator(new
		 StandardCategoryItemLabelGenerator());
		 renderer.setItemLabelFont(new Font("宋体", Font.BOLD, 12));// 12号黑体加粗
		 renderer.setItemLabelPaint(Color.black);// 字体为黑色
		 renderer.setPositiveItemLabelPosition(new ItemLabelPosition());
		 renderer.setItemMargin(0.05D);
		 renderer.setItemLabelsVisible(true);

		// 文字的设置
		CategoryAxis domainAxis = plot.getDomainAxis();
		// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);
		domainAxis.setVisible(true);
		plot.setDomainAxis(domainAxis);
		ValueAxis rAxis = plot.getRangeAxis();

		// 设置标题的文字
		TextTitle textTitle = chart.getTitle();
		textTitle.setFont(new Font("宋体", Font.PLAIN, 12));
		// 设置X轴坐标上的文字
		domainAxis.setTickLabelFont(new Font("宋体", Font.PLAIN, 10));

		// 设置X轴的标题文字
		domainAxis.setLabelFont(new Font("宋体", Font.PLAIN, 12));
		// 设置Y轴坐标上的文字
		rAxis.setTickLabelFont(new Font("宋体", Font.PLAIN, 10));
		// 设置Y轴的标题文字
		rAxis.setLabelFont(new Font("宋体", Font.PLAIN, 12));

		rAxis.setUpperMargin(0.1);// 设置高度，能完全显示数据。

		domainAxis.setUpperMargin(0.1);// 左右两边靠边框
		domainAxis.setLowerMargin(0.1);

		// domainAxis.setCategoryLabelPositionOffset(4);

		plot.setNoDataMessage("no data");
		plot.setNoDataMessagePaint(Color.blue);

		// LayeredBarRenderer lbr = new LayeredBarRenderer();//(BarRenderer)类：
		// 给图添加呈现器
		renderer1.setSeriesBarWidth(1, 0.5);// 控制位置
		plot.setRenderer(renderer);
		chart.getLegend().setItemFont(new Font("黑体", Font.BOLD, 14));
		return saveImg(chart, filePath);
	}

	/**
	 * 创建折线图
	 * 
	 * @param value
	 *            折线图所需数据:1.折线名称 2.折线数值 (double数组)
	 * @param config
	 *            0.报表标题 1.横轴名称 2.纵轴名称
	 * @param filePath
	 *            图片路径
	 * @return
	 */
	public static String createLine(List<List> value,
			String[] config, String filePath) {
		DefaultCategoryDataset linedataset = new DefaultCategoryDataset();

		for (int i = 0; i < value.size(); i++) {
			List values = value.get(i);//0.数据 1.x轴 
			
			String[] k = ((String)values.get(0)).split(",");
			
			for(String str : k){
				String [] kv = str.split(":");//0.Key 1.Value
				linedataset.addValue(Double.parseDouble(kv[1]),// 值
							(String)kv[0],(String)values.get(1));
			}

		}

		// 定义图标对象
		JFreeChart chart = ChartFactory.createLineChart(config[0],// 报表题目，字符串类型
				config[1], // 横轴
				config[2], // 纵轴
				linedataset, // 获得数据集
				PlotOrientation.VERTICAL, // 图标方向垂直
				true, // 显示图例
				false, // 不用生成工具
				false // 不用生成URL地址
				);
		chart.getTitle().setFont(new Font("黑体", Font.BOLD, 20));
		
		// 生成图形
		CategoryPlot plot = chart.getCategoryPlot();
		// 图像属性部分
		plot.setBackgroundPaint(Color.white);
		plot.setDomainGridlinesVisible(true); // 设置背景网格线是否可见
		plot.setDomainGridlinePaint(Color.BLACK); // 设置背景网格线颜色
		plot.setRangeGridlinePaint(Color.GRAY);
		plot.setNoDataMessage("没有数据");// 没有数据时显示的文字说明。
		
		// 数据轴属性部分
		NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
		rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
		rangeAxis.setAutoRangeIncludesZero(true); // 自动生成
		rangeAxis.setUpperMargin(0.20);
		rangeAxis.setLabelAngle(Math.PI / 2.0);
		rangeAxis.setAutoRange(false);
		rangeAxis.setLabelFont(new Font("黑体", Font.PLAIN, 18));//x axis
		// 数据渲染部分 主要是对折线做操作
		LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot
				.getRenderer();
		renderer.setBaseItemLabelsVisible(true);
		renderer.setSeriesPaint(0, Color.black); // 设置折线的颜色
		renderer.setBaseShapesFilled(true);
		renderer.setBaseItemLabelsVisible(true);
		renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(
				ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));
		renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
		/*
		 * 这里的StandardCategoryItemLabelGenerator()我想强调下：当时这个地*方被搅得头很晕，Standard**
		 * ItemLabelGenerator是通用的 因为我创建*的是CategoryPlot 所以很多设置都是Category相关而XYPlot
		 * 对应的则是 ： StandardXYItemLabelGenerator
		 */
		renderer.setBaseItemLabelFont(new Font("Dialog", 1, 14)); // 设置提示折点数据形状
		plot.setRenderer(renderer);
		// 区域渲染部分
//		double lowpress = 4.5;
//		double uperpress = 8; // 设定正常的范围
//		IntervalMarker inter = new IntervalMarker(lowpress, uperpress);
//		inter.setLabelOffsetType(LengthAdjustmentType.EXPAND); // 范围调整——扩张
//		inter.setPaint(Color.LIGHT_GRAY);// 域顏色
//
//		inter.setLabelFont(new Font("SansSerif", 41, 14));
//		inter.setLabelPaint(Color.RED);
//		inter.setLabel("正常范围"); // 设定区域说明文字
//		plot.addRangeMarker(inter, Layer.BACKGROUND); // 添加mark到图形
		chart.getLegend().setItemFont(new Font("黑体", Font.BOLD, 18));
		return saveImg(chart, filePath);
	}

	/**
	 * 保存图标为图片
	 * 
	 * @param chart
	 * @param filePath
	 * @return 图片的名称
	 */
	private static String saveImg(JFreeChart chart, String filePath) {
		String fileName = UUID.randomUUID().toString();// 生成文件名字
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(filePath + fileName + ".png");
			ChartUtilities.writeChartAsPNG(fos, chart, 700, 500);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fileName;
	}

}
