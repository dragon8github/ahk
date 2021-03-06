﻿::echarts.img::
::echarts.icon::
::echarts.image::
Var =
(
let spiritA = `image://${require('@/assets/icon-circleA.png')}`;

{
    symbol: spiritA,
    symbolSize: [15, 15],
}
)
txtit(Var)
return

::echarts.heat::
::echarts.hot::
::echart.heat::
::echart.hot::
Var =
(
{
    type: 'heatmap',
    coordinateSystem: 'geo',
    // 热力点的粗细值
    pointSize: 50,
    // 每个点模糊的大小，在地理坐标系(coordinateSystem: 'geo')上有效。
    blurSize: 30, // 30 50
    // 每帧渲染的个数，默认400
    progressive: 1000,
    // 关闭动画
    animation: false,
    // 层级
    zlevel: 1,
    // 热力数据，格式如下:
    // [{name: '不重要随便写点什么都可以', value: [经度, 纬度, 其他值]}, {...}, , {...}, , {...}]
    data: heatmap_data  
}
)
code(Var)
return

::echart.size::
::echarts.size::
Var =
(
symbolSize: val => {
    // 获取所有values
    const values = pin_data.map(_ => _.value[2])
    // 获取最大值
    const max = Math.max(Math.max(...values))
    // 获取最小值
    const min = Math.min(...values)
    // 定义最大气泡
    const maxSize4Pin = 100
    // 定义最小气泡
    const minSize4Pin = 50
    // 固定套路
    var a = (maxSize4Pin - minSize4Pin) / ((max - min) || 1)
    var b = maxSize4Pin - a * max;
    return a * val[2] + b;
},
---
// 这里的 this.option 只对部分有效。 也就是 class 有效。

// 气泡最大宽度
maxSize: 30,
// 气泡最小宽度
minSize: 10,
// 散点大小
symbolSize: (val, series) => {
    // 获取当前 serie 的索引
    const { seriesIndex } = series
    // 获取气泡宽度阈值
    const { maxSize, minSize } = this.option.series[seriesIndex]
    // 获取所有values
    const values = dgMockScatter.map(_ => _.value[2])
    // 获取最大值
    const max = Math.max(...values)
    // 获取最小值
    const min = Math.min(...values)
    // 固定套路
    var a = (maxSize - minSize) / (max - min);
    var b = maxSize - a * max;
    return a * val[2] + b;
},
---
import Chart from '../Chart.js'

import { maybe, objFirst } from '@/utils/utils.js'
import { getChartSeries } from '@/chartConfig/chartUtil.js'
import { DEFAULT_BUBBLE_OPTION, CHART_COLOR } from '@/chartConfig/options.js'

// ⚠️ 由于要使用上下文 this ，所以这个函数不能是箭头函数
const SYMBOL_SIZE = function(val, params) {
    // 找到当前数据维度
    const { componentIndex } = params

    // 获取数据源
    // 🚀 外部必须注入 Chart 类的上下文才可以正常访问到数据源
    const source = maybe(_ => this.option.dataset.source, {})
    // 获取数据源中所有 『数字类』 数据
    const values = Object.values(source).flat().filter(n => !isNaN(+n))

    // 获取最大值
    const max = Math.max(...values)
    // 获取最小值
    const min = Math.min(...values)

    // 定义最大气泡
    const maxSize = 60
    // 定义最小气泡
    const minSize = 10

    // 固定套路
    // ⚠️ fixbug： max === min 被除数为 0 时
    const a = max === min ? 0 : (maxSize - minSize) / (max - min)
    const b = maxSize - a * max

    // val[0]为x轴，默认维度加1
    const v = Number(val[componentIndex + 1])

    return a * v + b
}

export default class BubblePlot extends Chart {
    static name = 'BubblePlot'

    constructor(...props) {
        super(...props)

        // 定义显示名称
        this.__NAME__ = '气泡图'

        // 获取动态配置（第二个入参即是配置）
        const [, opts] = props

        // 定义依赖配置
        this.setStrForm('GlobalItem', 'xAxisItem', 'yAxisItem', 'BubbleSeries', 'LegendItem', 'TooltipItem')

        // 定义数据表单项配置
        this.setDataForm({
            panels: [{
                title: '维度设定',
                form: {
                    x: { title: '维度（X轴）', minCount: 1, maxCount: 1 },
                    value: { title: '指标', minCount: 1, maxCount: 5 },
                },
            }, ],
            relation: {},
        })

        // 绑定上下文
        this.SYMBOL_SIZE = SYMBOL_SIZE.bind(this)

        // 合成配置
        let _opts = _.defaultsDeep({}, opts, DEFAULT_BUBBLE_OPTION)

        // 为每个气泡 series 加入 动态 symbolSize 函数
        _opts.series.filter(_ => _.type === 'scatter').forEach(serie => serie.symbolSize = this.SYMBOL_SIZE)

        // 更新配置
        this.setOption(_opts)
    }

   

    setData({ rows, values, columns } = {}) {
        // 获取全系列
        const defaultSeries = this.option.series

        // 获取第一个 serie 配hi
        const serie = this.option.series[0]

        // 获取 x 轴（对象）的第一个属性的值
        const product = maybe(_ => objFirst(rows), [])

        // 数据源
        const source = { product, ...values }

        // 数据 + series
        const series = getChartSeries(source, { chartType: 'scatter', color: CHART_COLOR, defaultSeries, })

        // 合成最新的配置
        let opt = { dataset: { source }, series }

        // 为每个气泡 series 加入 动态 symbolSize 函数
        opt.series.filter(_ => _.type === 'scatter').forEach(serie => serie.symbolSize = this.SYMBOL_SIZE)

        // 更新配置
        this.updateData(opt)
    }
}
)
txtit(Var)
return

::echart.clear::
::echarts.clear::
Var =
(
export default {
  beforeRouteLeave(to, from, next) {
    // 获取页面中所有echarts的示例宿主
    const _echarts_instance_ = document.querySelectorAll("[_echarts_instance_]")
    // 遍历所有的宿主元素
    _echarts_instance_.forEach(function(e, i) {
      // 通过宿主进而获取对应的echarts，并且重置大小
      echarts.getInstanceByDom(e).clear()
    })
    // 放行
    next()
  }
}
)
code(Var)
return

::lunbo::
::echart.lunbo::
::echarts.lunbo::
Var =
(
broadcast(data) {
    // 只允许轮播一次
    this.timer && clearInterval(this.timer)
    // 定时器
    this.timer = setInterval(() => {
        const dataLen = data.length;
        // 取消之前高亮的图形
        this.myChart.dispatchAction({ type: 'downplay', seriesIndex: 0, dataIndex: this.currentIndex })
        // 翻页
        this.currentIndex = (this.currentIndex + 1) `% dataLen;
        // 高亮当前图形
        this.myChart.dispatchAction({ type: 'highlight', seriesIndex: 0, dataIndex: this.currentIndex })
    }, 1500)
},
mouseover(event) {
    const { dataIndex } = event
    this.myChart.dispatchAction({type: 'downplay',seriesIndex: 0, dataIndex: this.currentIndex })
    this.currentIndex = dataIndex
    clearInterval(this.timer)
},
mouseout() {
    this.myChart.dispatchAction({type: 'highlight',seriesIndex: 0, dataIndex: this.currentIndex })
    // 重新开始轮播
    this.broadcast(this.descPin[0].data.slice(0, 7));
},
)
code(Var)
return


::echarts.3dmap::
::echarts.map3d::
::echarts.3d::
Var =
(
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <script src="https://lib.baomitu.com/echarts/4.1.0/echarts.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://echartsjs.com/resource/echarts-gl-latest/dist/echarts-gl.min.js"></script>
    <script src="http://gallerybox.echartsjs.com/dep/echarts/map/js/china.js"></script>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 100`%;;height:100vh;"></div>
    <script type="text/javascript">
    
    // 基于准备好的dom，初始化echarts实例（必须先加载 echarts-gl.min.js ）
    // 基于准备好的dom，初始化echarts实例（必须先加载 echarts-gl.min.js ）
    // 基于准备好的dom，初始化echarts实例（必须先加载 echarts-gl.min.js ）
    var myChart = echarts.init(document.getElementById('main'));

    // https://github.com/dragon8github/Pandora/tree/master/data
    // echarts.registerMap('wangge', `这里写上你的geo.json`); 

     const distance = 100;
        const alpha = 54.49200177574249;
        const beta = -35.565489851313075;
        var option = {
            tooltip: {
                show: true,
                trigger:'item',
                alwaysShowContent:true,
                backgroundColor:'rgba(50,50,50,0.7)',
                hideDelay:100,
                triggerOn:'mousemove',
                enterable:true,
                padding: 15,
                formatter: function (params, ticket, callback) {
                  return '123'
                }
            },
            series: [{
              type: 'map3D',
              map: 'DongGuanGrid',
              top: '-16.8`%',
              left: '-4.8`%',
              viewControl: {
                  // 摄像头的距离 maxDistance: distance, minDistance: distance,
                  distance: distance, 
                  // 上下 minAlpha: alpha, maxAlpha: alpha,
                  alpha: alpha,
                  // 左右 minBeta: beta, maxBeta:beta,
                  beta: beta, 
              },
              itemStyle: {
                  areaColor: '#082974',
                  opacity: 0,
              },
              label: {
                  show: false,
                  textStyle: {
                      color: '#fff', //地图初始化区域字体颜色
                      fontSize: 14,
                      opacity: 1,
                      backgroundColor: 'rgba(0,23,11,0)'
                  },
              },
              emphasis: { //当鼠标放上去  地区区域是否显示名称
                  label: {
                      show: true,
                      textStyle: {
                          color: '#fff',
                          fontSize: 14,
                          backgroundColor: 'rgba(0,23,11,0)'
                      }
                  },
                  itemStyle: {
                      areaColor: '#082974',
                      opacity: 1,
                      borderWidth: 0.4,
                      borderColor: '#000'
                  },
              },
              //shading: 'lambert',
              light: { //光照阴影
                  main: {
                      color: '#fff', //光照颜色
                      intensity: 1.2, //光照强度
                      //shadowQuality: 'high', //阴影亮度
                      shadow: false, //是否显示阴影
                      alpha: 55,
                      beta: 10

                  },
                  ambient: {
                      intensity: 0.3
                  }
              },
            }]
        };
    myChart.setOption(option);
    </script>
</body>

</html>
)
code(Var)
return



::echarts.dian::
::echarts.san::
::echarts.sd::
::echarts.dian::
::echarts.point::
::echarts.points::
::echarts.sandian::
::echart.sandian::
::sandian::
Var =
(
// 小散点（旧版 'image://data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAEfklEQVRIiZWWy2/cVBTGf7avx/NI0iEzSSakCVQCQVUoFBCFVkiwQXTJhl2L2HQDEhsWIBZVV/0HWHUFYskOFtAVQqItSK2QClUpQmqakKRoJu+MM7avfdFxPIPjpq8zGsnyvef77nfOuefYqp75hgfYFPA6cASYAUay7RvAHPAbcBlYuB+Mus/a88BJ4NA91kez/4vAB8B14Gvg94clKgGngXcA60FycyYHOgf8AJwHwvyiXdg8nG0+8YgkfbMy33MZ1p6KPOAs8EzRW9WqDVWrTTqe17RspyzvTBL34iDo6G53SXf95YLLsxnWZ0AgLxz3zff6ix8CR3fJ9UpDlYnxI+7IyNO26+6zbNvF2vnJs7xTtdp+Va2OxmG4buI4H64mUAd+zSuSxL+9S0W1Oloea76CZaV71NxSyoBjYywLEoNl4nRvND3ZqLZax3rtzhXt+ys5GMH8UQqkn6OT+ZyIEi8jUfNLKUlSLqMnx9D7J7L/OLrZJHFd1Nwisld8xLeQs5NkxXCgWMLlZvOwJSSiwoBu1NEzkwTDVdrGoa1h1VFE9RFRQ1KrpWTiI76FfAn2ASE6Xkh803bdenocyyIeqpKMN9jWMXGoeWuiyqmnRnlhXxk/DAlsm3hqHOOVEfXiKxgFsuOqqEaqq/8suYjHmmwHmhHL4qPDk7z75GOMeoq/17c5e3WBy8s+vVKJSqOOu/TvAEN3/U4O9jlRtD9P5Hheo598PJfIsbGShBNP7OPjQxMcrJeZqCiOt4b5/KUpDtfLhDomKZdAubswcjZl53rXTvaye5Iqcl3CxFBVNsoYau7u+/1Ga5gRZWOZhNiyMI5zF0ZmI8XOIPDJgNQYpJJjY9gM9V07g9gQGzA7hQ/G3A2XmZ114f9p4ji9yVJlBCGe49DVhtmtkOsr/i7nL/9qs9jTadE4cYKldXbUuFfg2ZBi+CfrwqklUbTmKFVLFUUaZ7tHuVLmxnrA6Z9neXWsxtHxIb6bXeXGZsDtrZBKuYS1sgnJTjCSMFwtEC2orL0Paj/a6i46lcoUWSjUnTbmwBS65PLnesCcH/Ht/AY9HePHBrfioXoBankNg+ljFGfTHxK6i/k3uttti6rUYWYSO4pwZxdQYYRV9tg0Fh2d0LUVdqmE2tjCnV9MD6Xl8kbRmu52OwWii6LoVqZqcJ96nc61Sqt1TG66kLnzS5RuL2C8EmqoAraThtX2tyEM06KJZh7HGKODzvK1Aolg3+pXnUzGQckkQbgVtDtXMCbNrrQZPd3CDkKczhpOexlndR0rCFMVQiJ7xScOgq18bWXYg+4t4/dCNlV3Quj7K/6dO5ekd/VbUjTdYi+TcEkU5ICF5Qv90Z4ffOezBjsYfOLoLyxeUrVaU9WqMvgalu1UpIBNHG/HYbiqu/7SHjkRu5lhUiSS+3NmrykrQPcAu5fdzLCC/nqxM2wCnwLf53P2CCY+4isjXLAGttdXkIzjL4CfgPeBgw/JcwP46lE+t/omDp9k3f014GVgOvd1IyeeB64Cv2QdZm8D/gOkV87XV2/tuwAAAABJRU5ErkJggg=='）
let effectScattersymbol = `image://${require('@/assets/地图/symbol5.png')}`

const colorMap = ["#E83035", "#E88234", "#ECED08", "#01F1C4"]

// 创建散点配置项
const createPoints = (name, data) => {
	// 返回的这个配置对象，直接插入到series即可
    return {
    	// 设置名称，这和legend关联
    	name,
    	// 散点类型
        type: 'effectScatter',
        // 坐标系（默认上面的geo配置作为坐标系）
        coordinateSystem: 'geo',
        // 图形
        symbol: 'circle', // 'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow', 'none'，'image://url'
        // 层级
        zlevel: 2,
        // 绘制完成后显示特效
        showEffectOn: 'render',
        // 是否开启鼠标 hover 的提示动画效果
        hoverAnimation: true,
        // 散点大小
        symbolSize: 30,
        // 涟漪效果
        // rippleEffect: { period: 15, scale: 6, brushType: 'fill' },
        itemStyle: {
            normal: {            	
            	// 根据不同的 twoconsTypeId 渲染不同的颜色
                color: params => colorMap[params.value[3]] || "#ECED08", 
                shadowBlur: 10,
                shadowColor: '#333'
            }
        },
        // 涟漪的配置
        rippleEffect: {
            // 动画中波纹的最大缩放比例。
            scale: 7,
            // 动画的周期，秒数。
            period: 4,
            // 波纹的绘制方式，可选 'stroke' 和 'fill'
            brushType: 'fill'
        },
        // 散点数据，格式如下:
        // [{name: '不重要随便写点什么都可以', value: [经度, 纬度, 其他值]}, {...}, , {...}, , {...}]
        data: data
    }
}
---
// 尝试渲染 echarts 散点图
const scatter = {
    name: 'singlePoint',
    type: 'scatter',
    coordinateSystem: 'geo',
    zlevel: 2,
    symbol: 'circle',
    symbolSize: $adaptaWall(15),
    // label: { normal: { formatter: params => params.value[2].name, distance: $adaptaWall(5), backgroundColor: 'transparent', borderColor: '#fff', borderWidth: $adaptaWall(1), borderRadius: $adaptaWall(5), padding: [$adaptaWall(10), $adaptaWall(20), $adaptaWall(10), $adaptaWall(20)], show: true, position: 'bottom', textStyle: { color: '#fff', fontSize: $adaptaWall(16), textBorderColor: 'transparent' } } },
    itemStyle: { color: yellowColor, shadowBlur: 10, shadowColor: '#ccc' },
    emphasis: { scale: true, focus: 'self', itemStyle: { shadowColor: 'rgba(255, 255, 255, 1)', shadowBlur: 10, borderWidth: $adaptaWall(30), borderColor: yellowColor, borderType: 'dotted' }, },
    data: singlePointsData.map(_ => {
        // 获取散点「要素」的数据源
        const obj = _.values_.features[0].getProperties()
        // fixbug: 这个对象的存在会导致死循环。
        const pureobj = omit(obj, ['geometry'])
        // 返回 echarts 所需要格式
        return { name: obj.name, value: [...obj.lnglat, pureobj] }
    }),
}
---
const effectScatter = {
    name: 'sender',
    type: 'effectScatter',
    coordinateSystem: 'geo',
    zlevel: 2,
    rippleEffect: { brushType: 'stroke' },
    symbol: 'circle',
    symbolSize: params => _dynamicWidthSize(params[2]),
    label: { normal: { show: true, position: 'inside', formatter: params => params.value[2], color: '#fff', fontWeight: 'bold', fontSize: $adaptaWall(20) } },
    itemStyle: {
        normal: {
            color: {
                type: 'radial',
                x: 0.5,
                y: 0.5,
                r: 0.5,
                colorStops: [
                    { offset: 0, color: 'rgba(0, 0, 0, 0.3)' },
                    { offset: 0.8, color: 'rgba(239, 255, 55, 0.8)' },
                    { offset: 1, color: 'rgba(239, 255, 55, 0.7)' },
                ],
                global: false,
            },
        },
    },
    data: clustersData.map(_ => {
        // 获取当前的「聚合要素」
        const cluster = _.values_
        // 获取经纬度（转换）
        const lnglat = ol.proj.toLonLat(cluster.geometry.getCoordinates())
        // 聚合图的数值就是包含的子要素
        const val = cluster.features.length
        // 返回 echarts 所需要格式
        return { name: null, value: [...lnglat, val], label: { fontSize: _dynamicWidthLabel(val) } }
    }),
}

)
txtit(Var)
return

::echart.pin::
::echart.yuan::
::echarts.pin::
::echarts.yuan::
Var =
(
<template>
    <!-- 行业分类 -->
    <div class='category w-100 h-100' v-myLoading="descPinLoading">
        <v-chart :options='option' class='w-100 h-100' ref='pinchart' @mouseover='mouseover' @mouseout='mouseout'></v-chart>
    </div>
</template>

<script>
import { mapState } from "@/store/help.js"
import { lineFeedStr, drive } from '@/utils/utils'

export default {
    data () {
        return {
            option: {},
            myChart: null,
            currentIndex: -1
        }
    },
    computed: {
        ...mapState('pcMap', ['descPin', 'descPinLoading'])
    },
    methods: {
        renderEchart (ary) {
            const color = ['#e8ae75','#efea9a', '#57fbe9', '#30bcff', '#0f80ff', '#b48fff', '#ff8f92' ]

            // 以小带大
            const dataArr = drive(ary, (a, b) => +a.NUM - +b.NUM)

            const [legendData, seriesData] = dataArr.maps(
                // legend 业务类型
                v => v.BUSINESS,
                // series 核心数据源 
                (v, i) => ({ value: v.NUM, name: v.BUSINESS, itemStyle: { color: color[i] } })
            `)

            // 半圆策略
            for (let i = 0; i < 7; i++) {
                seriesData.push({ value: 0, name: '', label: { show: false }, labelLine: { show: false }, itemStyle: { color: 'rgba(0,0,0,0)'} })
            }

            // legend
            const legend = {
                icon: 'circle',
                data: legendData,
                textStyle: { color: '#fff', fontSize: 12 },
                right: '5`%',
                top: 0,
                orient: 'vertical',
                itemWidth: 10,
                itemHeight: 30,
                itemGap: window.innerWidth > 1600 ? 15 : 12,
                selectedMode: false,
                formatter: params => {
                    if(window.innerWidth > 1600 ){
                        return params
                    } else {
                        // return lineFeedStr(params, 7)
                        return params.length > 7 ? params.substr(0, 8) + '...' : params
                    }
                }
            }
            // series
            const series = [{
                name: "",
                type: "pie",
                radius: [ '50`%', '70`%'],
                avoidLabelOverlap: false,
                startAngle: 90,
                center: [ "25`%", "50`%" ],
                label: { show:false, position: 'center' },
                emphasis: {
                    label: {
                        show: true,
                        fontSize: "100`%",
                        formatter: params => {
                            return `{a|${lineFeedStr(params.name, 7)}}\n\n{b|${params.value}}`
                        },
                        rich: {
                            a: { textAlign: 'right', fontSize: '80`%', padding: [3,0], color:'#fff' },
                            b: { fontWeight: 'bold', fontSize: '110`%' }
                        }
                    }
                },
                data: seriesData,
            },]

            this.option = { legend, series } 

            // 启动轮播
            this.broadcast(dataArr)
        },
        broadcast(data) {
            // 只允许轮播一次
            this.timer && clearInterval(this.timer)
            // 定时器
            this.timer = setInterval(() => {
                const dataLen = data.length;
                // 取消之前高亮的图形
                this.myChart.dispatchAction({ type: 'downplay', seriesIndex: 0, dataIndex: this.currentIndex })
                // 翻页
                this.currentIndex = (this.currentIndex + 1) `% dataLen;
                // 高亮当前图形
                this.myChart.dispatchAction({ type: 'highlight', seriesIndex: 0, dataIndex: this.currentIndex })
            }, 1500)
        },
        mouseover(event) {
            const { dataIndex } = event
            this.myChart.dispatchAction({type: 'downplay',seriesIndex: 0, dataIndex: this.currentIndex })
            this.currentIndex = dataIndex
            clearInterval(this.timer)
        },
        mouseout() {
            this.myChart.dispatchAction({type: 'highlight',seriesIndex: 0, dataIndex: this.currentIndex })
            // 重新开始轮播
            this.broadcast(this.descPin[0].data.slice(0, 7));
        },
    },
    watch: {
        descPin: {
            deep: true,
            immediate: true,
            handler(newV, oldV) {
                // const data = [{ BUSINESS: '农、林、牧、鱼业', NUM: 1200.58 }, { BUSINESS: '制造业', NUM: 1100.58 }, { BUSINESS: '电力、热力、燃气及水生产和供应业', NUM: 1200.58 }, { BUSINESS: '建筑业', NUM: 1100.58 }, { BUSINESS: '批发和零售业', NUM: 1200.58 }, { BUSINESS: '住宿和餐饮业', NUM: 1100.58 }, { BUSINESS: '金融业', NUM: 1200.58 }]
                // 我只取前 7 个即可
                const data = this.maybe(_ => newV[0].data.slice(0, 7), [])
                // 有数据才进行渲染
                data.length && this.renderEchart(data)
            }
        }
    },
    mounted () {
        this.myChart = this.$refs.pinchart
    }
}
</script>
<style lang='scss' scoped>
.category {

}
</style>
---
// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
myChart.setOption({
	title: {
		text: '经营占道',
		x: 'center',
		y: 'bottom'
	},
	series: [{
		name: '经营占道类型',
		type: 'pie',
		radius: '55`%',
		center: ['50`%', '60`%'],
		labelLine: {
			normal: {
				// 引导线的长度
				length: 1
			}
		},
		data: [
			{ value: 1210, name: '店外经营占道' },
			{ value: 1030, name: '流动经营占道' }
		],
		itemStyle: {
			emphasis: {
				shadowBlur: 10,
				shadowOffsetX: 0,
				shadowColor: 'rgba(0, 0, 0, 0.5)'
			},
			// normal 是图形在默认状态下的样式；emphasis是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
			normal: {
				// 饼图图形上的文本标签
				label: { show: true },
				// 标签的视觉引导线样式
				labelLine: { show: true }
			}
		}
	}],
	color: ['#e76660', '#df4547']
});
)
txtit(Var)
return

::echarts.bar::
::echarts.zhu::
::echarts.zhuzi::
Var =
(
var myChart = echarts.init(document.getElementById('main'));
    myChart.setOption({
        title: {
            text: '占用道路问题结构',
            x: 'center',
            align: 'right'
        },
        xAxis: {
            data: ["经营占道", "垃圾占道", "车辆占道", "霸占车位", "其他占道"],
            axisLine: {
                lineStyle: {
                    color: 'black',
                    width: 0.5
                }
            },
            axisLabel: {
                interval: 0,
                textStyle: {
                    color: 'black',
                    fontSize: 18
                }
            }
        },
        yAxis: {
            splitLine: {
                show: true
            },
            type: 'value',
            axisLine: {
                lineStyle: {
                    width: 0
                }
            },
            axisLabel: {
                interval: 0,
                textStyle: {
                    color: 'black',
                    fontSize: 14
                }
            }
        },
        series: [{
            name: '销量',
            type: 'bar',
            data: [2240, 1768, 1547, 600, 31],
            barWidth: 25,
            itemStyle: {
                normal: {
                    color: function(params) {
                        var colorList = ['#00a0e9', '#00a0e9 ', '#00a0e9 ', '#00a0e9 ', '#00a0e9'];
                        return colorList[params.dataIndex]
                    },
                    label: {
                        show: true,
                        position: 'top',
                        color: 'black',
                        fontSize: 14,
                        formatter: '{c}'
                    },
                    opacity: 0.4
                },
            },
        }]
    });
)
code(Var)
return

::echart.line::
::echarts.line::
::echarts.xian::
Var =
(
var myChart = echarts.init(document.getElementById('main'));
    var option = {
        grid: { left: '12`%', right: '3`%', bottom: '35px', top: '35px', },
        xAxis: [{
            type: 'category',
            axisTick: { show: false },
            axisLine: { show: false, },
            axisLabel: {
                textStyle: {
                    color: '#444444',
                    fontSize: '16'
                }
            },
            data: ['1月', '2月', '3月', '4月', '5月', '6月']
        }],
        yAxis: [{
            type: 'value',
            splitLine: {
                lineStyle: {
                    color: 'rgba(52,73,94, .23)',
                    type: 'dashed'
                },
            },
            axisTick: { show: false },
            axisLine: { show: false, },
            axisLabel: {
                margin: '10',
                textStyle: {
                    color: '#444444',
                    fontSize: '16',
                    align: 'right',
                    baseline: 'bottom'
                }
            }
        }],
        series: [{
            type: 'line',
            symbol: 'emptyCircle',
            symbolSize: 7,
            itemStyle: {
                normal: {
                    color: '#118cfe',
                    lineStyle: {
                        color: '#118cfe'
                    }
                }
            },
            label: {
                show: true,
                position: 'top',
                distance: 8,
                textStyle: {
                    color: '#444444',
                    fontSize: 18
                }
            },
            data: [1020, 324, 1132, 1389, 1288, 1358],
        }, ]
    };
    myChart.setOption(option);
---
<template>
    <v-chart class="full medical__chart" :options="option"></v-chart>
</template>

<script>
import { getMixins } from '@/mixins/data'

const dateYYYYMMDD = t => {
    const date = new Date(t)
    const year = date.getFullYear()
    const month = date.getMonth() + 1
    const day = date.getDate()
    return [month, day].map((item, index) => (item < 10 ? '0' + item : item)).join('-')
}

export default {
    name: 'medicalTreatmentButtom',
    mixins: [getMixins('medicalTreatment')],
    data() {
        return {
                option: {
                    
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            // 默认为直线，可选为：'line' | 'shadow'
                            type: 'shadow',
                        },
                    },
                    grid: { left: '4`%', right: '6`%', top: '15`%', bottom: '6`%', containLabel: true },
                    xAxis: [
                        {
                            name: '日期',
                            type: 'category',
                            boundaryGap: false,
                            data: ['12-10', '12-12', '12-14', '12-16', '12-18', '12-20', '12-22', '12-24', '12-26', '12-28', '12-30', '01-01', '01-03', '01-05', '01-07'],
                            axisLine: {
                                lineStyle: {
                                    color: 'rgba(240,199,37,0.5)',
                                },
                            },
                            offset: 10,
                            axisLabel: { interval: 0, rotate: '45', color: '#c1cadf' },
                        },
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            name: '(人数)',
                            nameTextStyle: {
                                color: '#c1cadf',
                                align: 'right',
                                lineHeight: 10,
                            },
                            axisLine: {
                                lineStyle: {
                                    color: 'rgba(240,199,37,0.5)',
                                },
                            },
                            axisLabel: {
                                interval: 0,
                                color: '#c1cadf',
                            },
                            splitLine: {
                                width: 1,
                                lineStyle: { color: 'rgba(255, 255, 255, .08)' },
                            },
                        },
                    ],
                    series: [
                        {
                            name: '发热人数',
                            type: 'line',
                            symbolSize: 8,
                            areaStyle: {
                                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                                    { offset: 0, color: 'rgba(242, 255, 92, 1)' },
                                    { offset: 1, color: 'rgba(242, 255, 92, 0.01)' },
                                ]),
                            },
                            data: [0, 0, 34, 11, 29, 0, 0, 34, 11, 29, 0, 0, 34, 11, 29],
                            barWidth: '30`%',
                            itemStyle: { normal: { color: '#16f892' } },
                        },
                        {
                            name: '购买发烧感冒类药物人数',
                            type: 'line',
                            symbolSize: 8,
                            areaStyle: {
                                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                                    { offset: 0, color: 'rgba(133, 255, 202, 1)' },
                                    { offset: 1, color: 'rgba(133, 255, 202, 0.01)' },
                                ]),
                            },
                            data: [5, 1, 19, 42, 13, 5, 1, 19, 42, 13, 5, 1, 19, 42, 13],
                            barWidth: '30`%',
                            itemStyle: { normal: { color: '#16f892' } },
                        },
                    ],
                }
    },
    watch: {
        _data_20201229122: {
            deep: true,
            immediate: true,
            handler(newV, oldV) {
                if (newV) {
                    const [TIME, COLD_NUM, FEVER_NUM] = newV[1].data.maps(
                        _ => _.TIME,
                        _ => _.COLD_NUM,
                        _ => _.FEVER_NUM,
                    `)
                    this.option.series[0].data = FEVER_NUM
                    this.option.series[1].data = COLD_NUM
                    this.option.xAxis[0].data = TIME.map(_ => dateYYYYMMDD(_))
                }
            },
        },
    },
}
</script>
)
txtit(Var)
return


::echarts.rose::
::echarts.rosepin::
Var =
(
var myChart = echarts.init(document.getElementById('main'));
var data = [
	{ value: 10, name: '就业保障类' },
	{ value: 5, name: '其他类' },
	{ value: 15, name: '城市建设类' },
	{ value: 25, name: '民政救济类' },
	{ value: 20, name: '市场监管类' },
	{ value: 35, name: '市容城管类' },
	{ value: 30, name: '公共安全类' },
	{ value: 40, name: '公安消防类' }
];
var category = [];
for (var i = 0; i < data.length; i++) {
	category.push(data[i].name);
}
var option = {
	legend: {
		x: 'center',
		y: 'bottom',
		data: category
	},
	series: [{
		type: 'pie',
		radius: [25, 95],
		center: ['50`%', 140],
		roseType: 'area',
		clockWise: false,
		itemStyle: {
			normal: {
				label: {
					formatter: [
						'{b}', '占比{d}`%'
					].join('\n'),
					textStyle: {
						color: '#000000',
						fontSize: 16
					}
				},
			}
		},
		data: data
	}]
};
myChart.setOption(option);
)
code(Var)
return

::echarts.options::
::echarts.option::
::ehcarts.opts::
::echarts.default::
::echarts.defaultopt::
::echarts.defaultopts::
::echarts.defaultoptions::
::echarts.defaultoption::
Var =
(
// 基础配置
const options = {
    // 地图的geo配置(这里选择东城地图作为底层背景图，又可以作为热力图的坐标系)
    geo: { 
        id:'0', 
        silent: true,
        map: 'dongcheng', 
        itemStyle: {
            normal: {
                areaColor: '#0a57f2', 
                opacity: 0.33, 
                borderColor: '#7aa5f3', 
                borderWidth: 3, 
            }
        }
    },
    tooltip: { trigger: 'item', formatter: '{b}' },
    series: [
      // 网格的基本配置
      {
          // silent: true,
          type: 'map', 
          mapType: 'wangge', 
          zlevel: 1, 
          label: {
              show: true,
              color: '#fff',
              fontSize: 20,
          },
          itemStyle: {
              borderColor: '#092A81',
              // areaColor: 'rgba(122, 165, 243, 0.3)',
              areaColor: {
                  type: 'radial',
                  x: 0.5,
                  y: 0.5,
                  r: 0.8,
                  colorStops: [{
                      offset: 0, 
                      color: 'rgba(147, 235, 248, 0)' // 0`% 处的颜色
                  }, {
                      offset: 1, 
                      color: 'rgba(147, 235, 248, .2)' // 100`% 处的颜色
                  }],
                  globalCoord: false // 缺省为 false
              }
          },
          emphasis: {
            label: {
              color: '#fff'
            }
          }
      }
  ]
}
)
code(Var)
return

::echarts.label::
Var =
(
label: {
   show: true,
   color: '#fee002',
   padding: [13, 20],
   fontSize: 20,
   borderColor: '#15c3f5',
   backgroundColor: 'rgba(0, 0, 0, .1)',
   borderWidth: 0,
   borderRadius: 8,
   position: 'bottom',
   formatter: function (params) {
	  // 网格名称 [网格人员/企业数]
	  return `${e.gridName} [${e.gridMan}/${e.gridEnterprise}]`
   }
}
)
code(Var)
return

::echarts.click::
Var =
(
myChart.on('click', params => {
    console.log(20180824012121, params)
});
)
code(Var)
return

::echarts.qipao::
Var =
(
 // 散点气泡图
{
    type: 'scatter',
    // 坐标系（默认上面的geo配置作为坐标系）
    coordinateSystem: 'geo',
    // 图形
    symbol: 'pin', // 'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow', 'none'，'image://url'
    // 动态设置气泡的大小
    symbolSize: val => {
        var a = (this.maxSize4Pin - this.minSize4Pin) / (this.max - this.min);
        var b = this.minSize4Pin - a * this.min;
        b = this.maxSize4Pin - a * this.max;
        return a * val[2] + b;
    },
    label: {
        normal: {
            show: true,
            textStyle: {
                color: '#fff',
                fontSize: 12,
            },
            formatter: function (params) {
                return params.value[2]
            }
        }
    },
    itemStyle: {
        normal: {
            color: '#F62157',
        }
    },
    zlevel: 6,
    data: [],
}
)
code(Var)
return

::echarts.title::
Var =
(
title: {
	 show: true,
	 bottom: 200,
	 right: 20,
	 text: '网格名称 [网格人员/企业数量]',
	 textStyle: {
	   fontSize: 30,
	   color: '#fee002',
	   fontWeight: '100'
	 }
 },
)
code(Var)
return

::echarts.legend::
Var =
(
// 放置在根配置
// 通过data属性来匹配所有的series的name属性，然后自动识别series中的color进行映射，所以你必须要多个series才可以配合legend使用。其中legend的data属性最好是动态的。
legend: {
    // vertical
    orient: 'horizontal',
    selectedMode: 'multiple',
    bottom: '0',
    left: 'center',
    width: 740,
    itemWidth: 20,
    itemHeight: 20,
    // 每项之间的间距，用padding反而没用？
    itemGap: 15,
    textStyle: {
        color: '#000',
        fontSize: 16
    },
    // 这个值最好是动态配置的
    data: ['治安消防', '交通管理', '市场管理'],
},
)
code(Var)
return


::echart.vi::
::echart.visu::
::echart.visual::
::echart.visualMap::
::echarts.vi::
::echarts.visu::
::echarts.visual::
::echarts.visualMap::
Var =
(
visualMap: {
	show: false,
	min: 0,
	max: 5,
	right: '80',
	bottom: '200',
	// splitNumber: new Set(countByGridList).size,
	// itemWidth: 60,
	// itemHeight: 25,
	realtime: false,
	calculable: true,
	seriesIndex: 0,  // 这里需要指定，是映射哪个series配置
	inRange: {
		color: ['#1E81F1', '#1A66F3', '#144CF7', '#1032F9']
	},
	textStyle: {
		 color: '#fff',
		 fontSize: 28,
	}
}
)
code(Var)
return

::tip::
::tooltip::
::echartstooltip::
::echartstip::
::echarts.tooltip::
::echarts.tool::
::echarts.tip::
t := A_YYYY . A_MM . A_DD . A_Hour . A_Min . A_Sec
Var =
(
tooltip: {
    trigger: 'item',
    enterable: true,
    confine: true,
    hideDelay: 1500,
    appendToBody: true,
    triggerOn: 'mousemove|click',
    backgroundColor: 'transparent', padding: 0, borderWidth: 0, borderColor: 'transparent', extraCssText: 'box-shadow: none !important;',
    padding: [$adaptaWall(10), $adaptaWall(15)],
    textStyle: { fontSize: $adaptaWall(20), },
    // position: (point, params, dom, rect, size) => [point[0] + 20, '0`%'],
    formatter: params => {
        const { componentType } = params
        if (componentType === 'series' || componentType === 'effectScatter') {
            return `<div class='pop' style="display: block">
                <div class='pop__content'>
                    ${params.name}
                </div>
            </div>`
        }

        return ''
    },
},
---
// 根配置，如果formatter返回空则或者干脆不返回，则不会显示，可以用来显示series的数据。也可以通过判断params.componentSubType来进行显示。
tooltip: {
   trigger: 'item',
   enterable: true,
   confine: true,
   padding: [10, 15],
   textStyle: {
	  fontSize: 20
   },
   position: function(point, params, dom, rect, size) {
        return [point[0] + 20, '0`%']
    },
   formatter: function (params) {
	    console.log(%t%, params)
		// 返回空说明不展示tooltip
		return ''
   }
}
---
const __echartslayer__ = new ol3Echarts(
    {
        tooltip: {
            // 不在 'mousemove' 或 'click' 时触发，用户可以通过 action.tooltip.showTip 和 action.tooltip.hideTip 来手动触发和隐藏。
            triggerOn: 'none',
            // action.tooltip.hideTip 会受到此参数的影响
            hideDelay: 0,
            // 这两个核心参数几乎所有 tooltip 都要。
            confine: true, appendToBody: true,
            // 重置 tooltip 样式
            backgroundColor: 'transparent', padding: 0, borderWidth: 0, borderColor: 'transparent', extraCssText: 'box-shadow: none !important;',
            // 内间距（其实可以 Pop.scss 来代替使用）
            padding: [$adaptaWall(10), $adaptaWall(15)],
            // 字体大小（毫无意义，依然可以用 pop.scss 来代替）
            textStyle: { fontSize: $adaptaWall(20) },
            formatter: params => {},
        },
        series: [scatter, effectScatter],
    },
    {
        // https://sourcegraph.com/github.com/sakitam-fdd/ol3Echarts/-/blob/docs/guide/api.md
        // 必须开启这个才可以使用点击事件。被坑了好久。
        polyfillEvents: true,
        // 开启能提高性能和用户体验
        hideOnZooming: true, hideOnMoving: true, hideOnRotating: true, }
`)
---
$chart.on('mouseover', params => {
    $chart.dispatchAction({ type: 'showTip', seriesIndex: params.seriesIndex, name: params.name })
})

$chart.on('mouseout', params => {
    $chart.dispatchAction({ type: 'hideTip', seriesIndex: params.seriesIndex, name: params.name })
})

// showTip 显示
__echartslayer__.$chart.dispatchAction({ type: 'showTip', seriesIndex: 0, name })

// 修改该点的样式（能否添加点的 hover 样式，然后到时候去 dispatch 它即可）
__echartslayer__.$chart.dispatchAction({ type: 'highlight', seriesIndex: 0, name })

// 一般要配合一些特殊配置
tooltip: {
    // 不在 'mousemove' 或 'click' 时触发，用户可以通过 action.tooltip.showTip 和 action.tooltip.hideTip 来手动触发和隐藏。
    triggerOn: 'none', 
    // action.tooltip.hideTip 会受到此参数的影响
    hideDelay: 0,
    trigger: 'item',
    confine: true,
    appendToBody: true,
    backgroundColor: 'transparent', padding: 0, borderWidth: 0, borderColor: 'transparent', extraCssText: 'box-shadow: none !important;',
    padding: [$adaptaWall(10), $adaptaWall(15)],
    textStyle: { fontSize: $adaptaWall(20), },
    formatter: (params, ticket, callback) => {
        // 获取镇街名
        const name = params.name

        // 返回基础容器
        return `<div class='popvertical'>
            <div class='popvertical__wrap'>
                <div class='popvertical__title'>${name}</div>
            </div>
        </div>`
    },
},
---
// root
tooltip: {
    show: true,
    // 不可操作
    triggerOn: 'mousemove|click',
    // 必须手动触发一次，才会出现。所以需要调用 action
    alwaysShowContent: true,
    // 透明化 wrap
    backgroundColor: 'transparent', padding: 0, borderWidth: 0, borderColor: 'transparent', extraCssText: 'box-shadow: none !important;',
},

// scatter
tooltip: {
    position: (point, params, dom, rect, size) => {
        // 获取弹窗的大小
        const [width, height] = size.contentSize
        // 简单的居中公式
        return [point[0] - width / 2, point[1] - height]
    },
    formatter: params => {
        const [lng, lat, item] = params.value

        const { componentType } = params

        if (componentType === 'series' || componentType === 'effectScatter') {
            return `<div class='popregion'>
                <div class='popregion__content flex-cc flex-column'>
                    <div class='f12 pt-2'><span class='f24'>${item.value}</span>人</div>
                    <div class='f14'>${params.name}</div>
                </div>
            </div>`
        }

        return ''
    },
},
---
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <script src="https://cdn.staticfile.org/echarts/4.7.0/echarts.min.js"></script>
</head>

<body>
    <div id="main" style="width: 600px;height:400px;"></div>

    <script>
    let fetchData = callback => {        
        // 模拟 ajax
        setTimeout(() => {
            callback('<div>hello world</div>')
        }, 1000)
    }

    var myChart = echarts.init(document.getElementById('main'))

    var option = {
        tooltip: {
            trigger: 'item',
            enterable: true,
            confine: true,
            formatter: function(params, ticket, callback) {
                // callback 的第一个参数必须是 ticket，第二个参数必须是字符串
                const cb = callback.bind(null, ticket)

                // 获取数据，并且注入回调 Hook
                fetchData(cb)

                // 默认返回的
                return 'loading'
            }
        },
        series: [{
            name: '访问来源',
            type: 'pie',
            radius: ['65`%', '75`%'],
            center: ['49.5`%', '50.5`%'],
            color: ['#00a0e9', '#ea7e6f', '#fe8f18', '#f6c272', '#7c77b9'],
            avoidLabelOverlap: false,
            label: { show: true, },
            labelLine: { show: true },
            data: [{ value: 335, name: '直接访问' }, { value: 310, name: '邮件营销' }, { value: 234, name: '联盟广告' }, { value: 135, name: '视频广告' }, { value: 1548, name: '搜索引擎' }]
        }]
    }

    myChart.setOption(option)
    </script>
</body>

</html>
)
txtit(Var)
return

::echarts.init::
Var =
(
var myChart = echarts.init(document.getElementById('eastCityMap'));

// 获取默认配置
var getDeafaultOption = () => {
    return $.extend(true, {}, options)
}

// 不可变动的配置
const options = {
	series: [
		{
			type: 'map',
			label: {
				show: true,
				color: '#fff',
				fontSize: 14,
			},
			itemStyle: {
				normal: {
					borderColor: '#092A81'
				}
			},
			data: []
		}
	]
}

myChart.setOption(options);
)
code(Var)
return

:?:echarts.load::
:?:echarts.loading::
Var =
(
this.myChart.showLoading({
     text: '正在加载数据...',
     color: '#c23531',
     textColor: '#000',
     maskColor: 'rgba(255, 255, 255, 0.7)',
     zlevel: 199307100338
});
this.myChart.hideLoading();
)
code(Var)
return


::echarts.dataSet::
::dataset::
Var =
(
dataset: {
    source: {
        '时间': ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        '数值': [220, 182, 191, 234, 290, 330, 310],
        '数值2': [220, 182, 191, 234, 290, 330, 310],
    }
},
)
code(Var)
return

::echarts.center::
::maps.center::
::getpointcenter::
::getcenterpoint::
Var =
(
var getcenterpoint = function (val) {
    var myarr = val.split(';');
    var lngarr = []
    var latarr = []
    myarr.forEach(function (e, i) {
         const [lnt, lat] = e.split(',');
         lngarr.push(lnt)
         latarr.push(lat)
    });
    var maxlng = Math.max(...lngarr)
    var minlng = Math.min(...lngarr)
    var maxlat = Math.max(...latarr)
    var minlat = Math.min(...latarr)
    var mylng = (maxlng - minlng) / 2 + minlng
    var mylat = (maxlat - minlat) / 2 + minlat
    return [mylng, mylat]
}
)
code(Var)
return