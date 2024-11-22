# 加载 SlidingWindow 包

library(SlidingWindow)

# 加载数据
filepath <- "/Users/jinghua.wu/Library/CloudStorage/OneDrive-KarolinskaInstitutet/Mac/Documents/course/Intermediate R – Data Science and Visualization Techniques Beyond Base R/SlidingWindow/data/Example_window.csv"

# 然后调用函数
data <- calculate_acceleration(file_path = filepath, "x", "y", "z")

# 定义参数
window_size <- 1000  # 窗口大小
threshold <- 0.5   # 阈值

# 应用滑动窗口分析
data <- Iterate_time_series(data, window_function, window_size, threshold)

# 生成图表
plot_results(data)
