# 曲奇饼问题

# 问题描述（见书1.3节）：
#   假设有两碗曲奇饼，碗1包含30个香草曲奇饼和10个巧克力曲奇饼，碗2有上述两种饼干各20个。
# 现在设想你在不看的情况下随机地挑一个碗拿一块饼，得到了一块香草曲奇饼。我们的问题是：
# 取到的香草曲奇饼来自碗1的概率是多少？

source("thinkbayes.R")

cookie <- Pmf() %>%
    Set("Bowl 1", .5) %>% # 先验概率
    Set("Bowl 2", .5)

cookie <- cookie %>%
    Mult("Bowl 1", .75) %>% # 先验分别乘以对应的似然度
    Mult("Bowl 2", .5)

cookie <- cookie %>% Normalize()

print(cookie)
