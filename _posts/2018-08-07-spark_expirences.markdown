--- 
layout: post 
title: "spark expirences" 
date: 2018-08-07 10:36:10 -0800 
categories: thoughts 
---

## 前言
Spark是一个非常好用的分布式计算平台，带有很多方便的ml库，但是其陡峭的学习曲线和抽象的debug流程，让人望而却步，也让初出茅庐的同学遇到问题束手无措。

## 问题汇总


### Hive\*SocketTimeout
如果是在执行sql的时候，程序idle了很久，最后报错是这个，可能原因是解析hive表分区失败。
Spark处理hive sql和hive原生的解析还是有区别的，解析逻辑复杂一些，分区多一些，spark就会难以解析。可能是Spark没有对分区的树形结构做优化之类，在遍历的过程中陷入bug。这是我从现象中分析出它代码可能有的问题。

### OutOfMemory\*Overhead Memory
rdd的数据是在JVM内存里存储的，其占用的不同的内存是符合JVM的分配方式的。比如rdd里面有较多、较长字符串，则会occupy较多Overhead memory。
spark分配给executor总内存 = executor-memory + overhead-memory

