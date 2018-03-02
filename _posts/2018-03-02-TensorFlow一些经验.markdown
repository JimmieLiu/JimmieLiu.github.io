--- 
layout: post 
title: "TensorFlow一些经验"
date: 2018-03-02 10:46:33 -0800
categories: thoughts 
---
This post will be updated progressively...

## 经验
- 1 worker报错 tensorflow.python.framework.errors_impl.UnavailableError: Transport closed 并无其他报错细节
  - when: 似乎网络延迟高或者workers过多的时候，有概率发生
  - how: 提高ps数量，或添加重试机制

- 2 使用tf.feature_column
  - why: fc提供了很多现成(of-the-shelf feature tramsformation methods)的特征变换方法
  - how: 利用tf.feature_column里面各种特征转换的方法，可输入到tf.feature_column.input_layer 或者 tf.feature_column.linear_model，获得转换好的tensor

- 3 运行TF分布式框架时，因为没有明确的标志表明分布式框架已启动。需要查看日志中grpc的相关信息，来确定框架是否启用。

- 5 TF分布式框架，仅chief进行checkpoint的记录。其余的worker不记录checkpoiint

## 未解决
- 1 tf.Supervisor 和 tf.train.MonitoredTrainingSession 的区别
  - why 1: 每次调用supervisor的时候，会提示请改用Mon_Session，但二者的参数和调用逻辑不一样
  - why 2: Mon_Session在分布式时候的配置，可能还要配置ENV -- TF_CONFIG. 尝试各种配置都不能启动分布式框架。

- 2 有时候报错Graph finalized
  - todo: 什么操作下会finalize graph, with control_dependencies?


---
*以上经验是我在项目中遇到的，有待解决和未解决的。因为个人精力有限，仅做问题记录和经验记录。您若有更好的诠释，欢迎提交修改。
Above questions and solutions are merely a simple record of what i encountered during projects. Pls submit edition if you have better explainations.*

