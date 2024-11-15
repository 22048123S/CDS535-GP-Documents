import pandas as pd
# 读取 CSV 文件
df = pd.read_csv('C:\\Users\\lenovo\\Desktop\\data mining\\group_assignment\\StudentPerformanceFactors.csv')
# 查看第五列的数据是否正确
print(df['Access_to_Resources'].head())
# 将 'high', 'medium', 'low' 替换为 1, 2, 3
df['Access_to_Resources'] = df['Access_to_Resources'].replace({
    'High': 3,
    'Medium': 2,
    'Low': 1
})
# 检查替换后的数据
print(df['Access_to_Resources'].head())
# 保存修改后的数据回到新的 CSV 文件
df.to_csv('C:\\Users\\lenovo\\Desktop\\data mining\\group_assignment\\StudentPerformanceFactors_modified.csv', index=False)
