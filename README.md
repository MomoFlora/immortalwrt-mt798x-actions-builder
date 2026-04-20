<h1 align="center">✨ ZeroWrt Mediatek 固件仓库 ✨</h1>

<p align="center">
  基于 <strong>ImmortalWrt-mt798x-6.6</strong> 源码编译，适用于 <strong>Mediatek</strong> 平台。<br>
  <strong style="color:red; font-size:16px;">⚠ 仅限个人自用，严禁商业使用。</strong>
</p>

<!-- 技能图标 -->
<p align="center">
  <a href="https://skillicons.dev#gh-light-mode-only" target="_blank">
    <img align="center" src="https://skillicons.dev/icons?theme=light&perline=16&i=linux,c,cpp,bash,git,github,vim,lua,cmake,regex,nginx,docker,kubernetes,prometheus,grafana,md" alt="OpenWrt Skills" />
  </a>
  <a href="https://skillicons.dev#gh-dark-mode-only" target="_blank">
    <img align="center" src="https://skillicons.dev/icons?perline=16&i=linux,c,cpp,bash,git,github,vim,lua,cmake,regex,nginx,docker,kubernetes,prometheus,grafana,md" alt="OpenWrt Skills" />
  </a>
</p>

<p align="center">
  <img src="./General/zerowrt.png" alt="ZeroWrt" width="1000"/>
</p>

---

## 📱 支持设备列表 (Supported Devices)

本固件基于 **ImmortalWrt (mt798x-6.6)** 源码深度定制，针对 MediaTek Filogic 820 平台进行底层优化，集成硬件转发加速（HWNAT）与最新的无线驱动，确保高性能与高稳定性。

| 设备型号 | SoC | 内存 (RAM) | 闪存 (Flash) | 硬件定位与推荐场景 |
| :--- | :---: | :---: | :---: | :--- |
| **Qihoo 360T7** | MT7981B | 256MB | 128MB SPI | **性价比首选**。支持无线 HWNAT，适合作为家用入门级 Wi-Fi 6 主路由。 |
| **Cudy TR3000 V1** | MT7981B | 512MB | 128MB SPI | **满血配置**。配备 **2.5G 网口**，完美契合千兆以上宽带或内网 NAS 传输。 |
| **Cudy TR3000 (256M)** | MT7981B | 512MB | 256MB SPI | **特定版本**。固件针对内存进行了精简优化，确保在基础路由模式下运行流畅。 |
| **JDCloud RE-CP-03** | **MT7986A** | 512MB | 128MB SPI | **性能怪兽**。四核 A53 架构，多线程处理能力强，适合高并发、大流量转发场景。 |
| **Netcore N60 Pro** | MT7981B | 512MB | 128MB SPI | **信号标杆**。磊科调教的射频前端，适合作为大户型覆盖或运行较多插件。 |
| **Philips HY3000** | MT7981B | 1GB DDR3 | 128G emmc | **稳定性优先**。硬件散热设计合理，适合长期不关机的家庭/办公基础网络。 |
| **Cetron CT3003** | MT7981B | 256MB | 128MB SPI | **面板/吸顶机**。体积小巧，适合作为分布式网络中的 AP 节点或 Mesh 扩展。 |
| **CLX S20P** | **MT7986A** | **2GB DDR4** | **128GB eMMC** | **旗舰级顶配**。双 2.5G 网口 + 超大存储，完美支持 Docker 容器化部署与全功能自建服务。 |

---
