#READ ME FIST
### 0.编码前必须要了解的内容

- [JAVA JDK1.8](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [MAVEN 最新版本](http://maven.apache.org/)
- [JENKINS 持续集成](http://jenkins.org/)
> Jenkins Pipeline、Groovy 等需要有一定的了解
- [POSTGRES 数据库](https://www.postgresql.org)
> 数据库要有一定的SQL基础
- [Spring Boot](https://spring.io/projects/spring-boot)
> spring-boot-jpa, spring-boot-batch
- 其他JAVA组件
> [LMAX Disruptor 高性能多线程消息](https://lmax-exchange.github.io/disruptor/), [POI Excel处理](http://poi.apache.org/),
> Apache commons系列(commons-net用于网络通信比如FTP等,commons-lang3, commons-collection4, commons-compress压缩等),
> [Open feign API集成](https://github.com/OpenFeign/feign)
- [SWAGGER API工具](https://swagger.io/)
- [Flyway 数据库脚本版本管理工具](https://flywaydb.org/)

### 1.结构

>dims-batch<br>
>dims-batch-gx<br>
>dims-database-initializer<br>
>dims-domain<br>
>dims-key-generator<br>
>dims-web<br>
>pom.xml<br>

##### 1.1 目前项目主要包含了4部分
1. 数据核查Master服务，负责数据存储，数据展现，驱动核查等功能

    `dims-web` 主要负责前台的交互, `dims-domain` 主要负责后端业务逻辑
2. 数据核查引擎，主要负责核查数据-包含下载数据，数据入库，数据核查，以及错误数据回传。
    
    > `dims-batch` 主要负责大部分专业, `dims-batch-gx` 主要负责管线专业，目前由于管线专业与其他专业脚本设计上存在差异，所以需要单独处理
    从长远来讲，需要合并到一个里面，不然维护两套差不多的核查任务很麻烦
    
3. 数据库初始化，这个主要是为了驱动核查引擎的时候自动初始化数据做的
    
    > `dims-database-initializer`之前是直接用jenkins pipeline里面的groovy写的脚本去初始化，但是因为jenkins的脚本限制安装使用比较麻烦
    而且不能直接使用localhost，所以废弃，写了一个简单的jar去执行创建删除数据库的功能

4. 简单的License生成工具

    > `dims-key-generator` 防君子不防小人，其实项目结构足够复杂，驱动起来也是非常麻烦的不能单纯通过复制就能直接使用
    
##### 1.2 项目依赖关系
从结构上讲上面的4部分都可以独立编译，但是这里面有一点点弱依赖，这点弱依赖，决定编译的成功与否

目前发布项目是整体发布的模式，就是只提供一个JAR，就可以完成整个发布，避免部署麻烦，所以`数据库初始化`,`核查引擎`这两部分是需要提前编译好，放在`主服务`里面的
所以一定是先编译两个核查引擎以及数据库初始化工具，因为这两部分在maven角度是没有强关联的，目前是在maven的module部分，通过先后顺序来决定的，而不是显示的依赖关系。
之所以没有定义显示的依赖关系，主要是代码洁癖，不想因为这部分依赖，导致项目臃肿

##### 1.3 项目设计
###### 背景
1. 核查引擎，对IO，CPU消耗比较严重，只在需要的时候才会启动
2. 数据服务，要7x24在线提供服务
3. 如果把两者设计成一体的，一个是单节点不能满足同时并发核查，另外就是核查的时候对数据展现等服务造成影响
4. 项目属于异地部署，内网部署，所以部署方式越简单越好，不宜增加过多的刚性依赖

###### 设计
1. 主服务采用spring-boot为基础构建，主要提供两部分API，数据展现的API与核查引擎上报数据API
    
    > a. 可以启动后查看swagger工具<br>
    b. 系统采用前后端分离框架，所以后端在authorization, authentication上使用的JWT框架<br>
    c. 为了能够驱动核查引擎核查，引入了jenkins，在jenkins的集群基础上让jenkins去驱动核查引擎去核查数据，而主节点只需要负责管控jenkins即可
    
2. 核查引擎，采用spring-batch为基础构建，为何选择spring-batch，其实最简单的java项目其实也是可以的，但这里为了解耦整个过程，而选择了spring-batch
    
    > spring-batch主要有step的概念，这里把核查分成了几个步骤，每个步骤理论上都可以单独执行。
    
3. Jenkins集群，选择jenkins集群，它是一个成熟的工具，集群规模容易扩展，而且适合当前的业务场景。

主节点 - 主DB<br>
|<br>
jenkins master<br>
| <br>

| slave1|  slave2 | slave3 |
|---------------|-----------------|----------------|
| 核查DB1|  核查DB2 | 核查DB3 |

### 2.开发

##### 2.1 开发工具选择

> 建议试用Intellij IDEA，不建议eclipse，9102年了

##### 2.2 项目编译

```
# 项目根目录
mvn clean package

# 由于batch项目依赖的API是基于open feign的，需要提前编译一次生成代码有src/generated/java的目录，请不要提交或者修改代码，每次编译这部分都会重新覆盖的。
```

##### 2.3 项目启动

```
# dims-batch 直接启动该java类, 需要配置启动参数"--job=dataCollector --province=<province_code:420000> --specialty=<speciality:空间>"
xyz.yaxshi.dims.DimsBatchApplication

# dims-batch-gx 直接启动该java类, 需要配置启动参数"--job=dataCollector --province=<province_code:420000> --specialty=<speciality:管线>"
xyz.yaxshi.dims.DimsBatchGxApplication

# dims-web 直接启动该java类， 由于目前需要license，所以提前用license工具生成然后加入参数 "-Ddims.license.key=<license>"
xyz.yaxshi.dims.DimsApplication

# 以上三个项目都属于spring-boot应用，编译好jar包后启动只需要java -jar xxx.jar 同时加入参数
# 另外核查需要一定的内存，建议试用最少2G, 4G最优 -Xms4G -Xmx4G

```

##### 2.4 开发规约

1. *包名全部小写 （最基本的要求）
2. *类名驼峰首字母大写（最基本的要求）
3. *方法，变量名驼峰首字母小写（最基本的要求）
4. 请尽量保持代码精简，不建议代码过长
5. 请参考[阿里巴巴java代码规范](https://github.com/alibaba/p3c)，做一个合格的开发人员
6. 请不要写无聊的注释

##### 2.5 数据库管理

1. 采用flyway管理脚本
2. 脚本有4部分：系统跟核查无关的DDL、核查相关的DDL、元数据DML、核查脚本DDL

    > a. 系统跟核查无关的DDL: 这部分由开发人员自行设计，只在`dims-domain`中管理，增量脚本，不可以每次重复执行，会清理数据<br>
    b. 核查相关的DDL：由DB设计管理，`dims-domain`, `dims-batch`, `dims-batch-gx`三者需要保持同步， 可重复执行，需要配合元数据DML重复执行<br>
    c. 元数据DML：由DB设计管理，包含管线和非管线`dims-domain`, `dims-batch`, `dims-batch-gx`三者需要保持同步， 可重复执行，需要配合元核查相关的DDL重复执行<br>
    d. 核查脚本DDL: 由DB设计管理，包含管线和非管线`dims-batch`, `dims-batch-gx`只在这两者里面，注意管线和非管线是分开的。
    
3. 脚本发布要慎重，`dims-batch`, `dims-batch-gx` 里面的脚本是每次都会重新执行的，但`dims-domain`第一部分是一次性的，不能重复执行，其他的是每次DB发布新脚本都要重复在主库执行的

##### 2.6 版本管理

1. 请使用develop分支作为开发分支
2. 请试用master分支作为发布分支，发布前请按照目前的格式更改版本编号

    > 2.0.20190909.2106.RC 目前是RC阶段，后续稳定了改为 RELEASE
    
3. 新feature尽量开新分支，分支以 `feature/` 为前缀
4. 线上bug修复，开新分支以 `hotfix/` 为前缀
5. 以上要求皆为契合 git-flow




