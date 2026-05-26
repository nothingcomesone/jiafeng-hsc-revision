# 《夹缝中的光芒》HSC 中文与文学复习资源

> NSW HSC Chinese & Literature · prescribed text 《夹缝中的光芒》(Light in the Crevice) · 纪实文学 · Theme 1 + Theme 2 · 2025–2030 syllabus cycle

[**🌐 在线访问 / Live site →**](https://nothingcomesone.github.io/jiafeng-hsc-revision/)

---

## 内容 / What's inside

| 模块 | 文件 | 说明 |
|---|---|---|
| **9 课课堂资源** | `lessons/lesson-01/` … `lesson-09/` | 每课 2 个 HTML：课堂幻灯（教师讲课用）+ 学生工作纸（学生练习 / 课后温习）。覆盖 8 章节全部主要人物（梦兰 / 海燕 / 陈倩 / 丽颖 / 素婷 / 梅怡 / 国伟 / 志勇）。 |
| **章节分析全 8 章** | `analysis/chapter-analysis-all-8.html` | 每章 6 块：场景 + 议题映射 / 关键引文 / Q3 三 TEE / 学生思考题 / Q4 macro 钩子 / model 段。 |
| **附录 A · 叙事手法库** | `analysis/appendix-a-narrative-techniques.html` | 8 类非虚构论证技巧（对比论证 / 典型案例 / 数据论证 / 直接引语 / 反思性语言 / 隐喻 / 情感化叙述 / 时间线编排）× 文中出处 + Q3/Q4 用法。 |
| **附录 B · 议题词典** | `analysis/appendix-b-issue-dictionary.html` | Theme 1 (1.1 / 1.2 / 1.3) + Theme 2 (2.1 / 2.2 / 2.3) × NESA 子考点 × 本文承载 × Q3 题型方向 × Q4 essay 钩子。严格 Theme 1+2 边界（无 Theme 3/4 越界）。 |
| **附录 C · 人物议题表** | `analysis/appendix-c-character-grid.html` | 8 主要人物卡 + 8 × 6 议题速查矩阵 + 7 组同文本 + 3 组跨文本 Q4 配对（与《漂向北方》/《大江大河》/《二马》）。 |
| **附录 D · HSC 考试模板** | `analysis/appendix-d-hsc-templates.html` | Q3 [3+5+7] 三档分解（基于 2025 NESA 真题模式）+ Q4 25 分四段 cross-text 模板 + mini-TEEL 通用公式 + 评分要素 checklist + 禁词清单。 |
| **Q3 + Q4 练习集** | `practice/q3-q4-practice-set.pdf` + `.docx` | 8 道 Q3（每题 15 分 · 3+5+7 结构）+ 2 道 Q4（每题 25 分 · 4-段 cross-text 结构）。每题含中英双语题干 + 节选 verbatim + Band 6 范文 / 示范答案。 |

## 使用方式 / How to use

**学生**：从 [index 页](https://nothingcomesone.github.io/jiafeng-hsc-revision/) 进入。先看「学生工作纸」做章节精读；不懂的地方查附录 A（技巧）+ 附录 B（议题词典）+ 附录 C（人物配对）；考前用 Q3 + Q4 练习集 + 附录 D 模板复习。

**教师**：「课堂幻灯」是 55 分钟课的完整 lesson plan，含开场句、暖身问题、教师追问、Q4 论点框架。配「学生工作纸」可直接打印发给学生。

## 学术诚信 / Academic integrity

《夹缝中的光芒》是一部纪实文学作品，跟踪记录广东 F 学院 062111 班（80 后大学生）与作者自己 1995 年毕业的岳阳大学 9202 班（70 后大学生）的命运对比。文本节选与人物引用属<strong>合理使用</strong>（fair dealing for educational analysis），仅用于教学解读目的。

HSC 议题框架（Theme 1 / Theme 2）依据 [NSW Education Standards Authority (NESA) Chinese and Literature Syllabus](https://educationstandards.nsw.edu.au/wps/portal/nesa/11-12/stage-6-learning-areas/stage-6-languages/chinese-and-literature-syllabus)。

## License

教学分析内容采用 [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/) 协议授权。原作《夹缝中的光芒》文本属原版权人所有，本站引用基于合理使用条款。

## 反馈 / Issues

发现错误、需要补充？欢迎提 [Issue](https://github.com/nothingcomesone/jiafeng-hsc-revision/issues)。

## 维护 / Maintenance（仅 owner 用）

源文件在 Dropbox `#26CLNEW/夹缝中的光芒 DLC/`。Dropbox 里修改后跑：

```bash
cd ~/Code/jiafeng-hsc-revision
./sync-to-github.sh ["可选 commit message"]
```

脚本自动：
1. 把 Dropbox 里 9 课 + 5 分析 HTML + Q3+Q4 docx 拷到 repo
2. 用 LibreOffice 把 Q3+Q4 docx → PDF
3. `git add` + commit + push
4. GitHub Pages 1 分钟内自动重 build

依赖：`soffice`（LibreOffice headless）、`git`、`gh`（可选）。

---

*最后更新：2026-05-26*
