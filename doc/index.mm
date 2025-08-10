<map version="freeplane 1.12.1">
<!--To view this file, download free mind mapping software Freeplane from https://www.freeplane.org -->
<attribute_registry SHOW_ATTRIBUTES="selected"/>
<bookmarks>
    <bookmark nodeId="ID_20240928140957816" name="Root" opensAsRoot="true"/>
</bookmarks>
<node TEXT="index" FOLDED="false" ID="ID_20240928140957816" CREATED="1609150826839" MODIFIED="1754792950792">
<hook NAME="accessories/plugins/AutomaticLayout.properties" VALUE="ALL"/>
<attribute_layout NAME_WIDTH="100 pt" VALUE_WIDTH="100 pt"/>
<edge COLOR="#cccccc"/>
<hook NAME="MapStyle" background="#ffffffff" zoom="1.03">
    <conditional_styles>
        <conditional_style ACTIVE="false" STYLE_REF="content" LAST="false">
            <script_condition>
                <script>// Is File Link: 

node.link.text &amp;&amp; node.link.text.matches(&quot;.*\\.\\w+&quot;)</script>
            </script_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="exception" LAST="false">
            <script_condition>
                <script>// File Not Found: 
def link = node.link.text

if(link &amp;&amp; !link.contains(&quot;:&quot;) &amp;&amp; !link.endsWith(&quot;/&quot;)) {
    return !new File(node.mindMap.file.parent, URLDecoder.decode(link, &quot;utf-8&quot;)).exists()
}

return false</script>
            </script_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="highlight" LAST="false">
            <script_condition>
                <script>// Link Path Exists: 

if(!node.link.text || !c.selecteds.contains(node)) return false

def link = node.link.text
if(link.matches(&quot;(https*|file|\\w):.*&quot;)) return false
def path = node.pathToRoot
    .findAll { it != node.mindMap.root }
    .collect { it.plainText }
    .join(&quot;/&quot;)
def file = new File(node.mindMap.file.parent, path)
if(!file.exists() &amp;&amp; !link.endsWith(&quot;/&quot;)) file = new File(node.mindMap.file.parent, path + &quot;.mm&quot;)
return file.exists()</script>
            </script_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="highlight" LAST="false">
            <script_condition>
                <script>// highlight  
return node.icons.contains(&quot;highlight&quot;)
</script>
            </script_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="bg-gray" LAST="false">
            <script_condition>
                <script>// ? 
if(!node.icons) return false
def count = 1
if(node.icons.findAll{it == &quot;bookmark&quot;}.size() == count) return true
else return false</script>
            </script_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="bg-blue" LAST="false">
            <script_condition>
                <script>// ?? 
if(!node.icons) return false
def count = 2
if(node.icons.findAll{it == &quot;bookmark&quot;}.size() == count) return true
else return false</script>
            </script_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="bg-orange" LAST="false">
            <script_condition>
                <script>// ??? 
if(!node.icons) return false
def count = 3
if(node.icons.findAll{it == &quot;bookmark&quot;}.size() == count) return true
else return false</script>
            </script_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="0%" LAST="false">
            <disjunct_condition>
                <icon_contained_condition ICON="0%"/>
                <icon_contained_condition ICON="12.5%"/>
            </disjunct_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="25%" LAST="false">
            <disjunct_condition>
                <icon_contained_condition ICON="25%"/>
                <icon_contained_condition ICON="37.5%"/>
            </disjunct_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="50%" LAST="false">
            <disjunct_condition>
                <icon_contained_condition ICON="50%"/>
                <icon_contained_condition ICON="62.5%"/>
            </disjunct_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="75%" LAST="false">
            <disjunct_condition>
                <icon_contained_condition ICON="75%"/>
                <icon_contained_condition ICON="87.5%"/>
            </disjunct_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="100%" LAST="false">
            <disjunct_condition>
                <icon_contained_condition ICON="100%"/>
                <icon_contained_condition ICON="checked"/>
            </disjunct_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="hide" LAST="false">
            <disjunct_condition>
                <icon_contained_condition ICON="closed"/>
                <icon_contained_condition ICON="stop-sign"/>
            </disjunct_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="doubt" LAST="false">
            <disjunct_condition>
                <icon_contained_condition ICON="messagebox_warning"/>
                <icon_contained_condition ICON="help"/>
            </disjunct_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="wrong" LAST="false">
            <icon_contained_condition ICON="button_cancel"/>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="green" LAST="false">
            <icon_contained_condition ICON="button_ok"/>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="notice" LAST="false">
            <icon_contained_condition ICON="yes"/>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="mark" LAST="false">
            <icon_contained_condition ICON="info"/>
        </conditional_style>
        <conditional_style ACTIVE="false" LOCALIZED_STYLE_REF="default" LAST="false">
            <script_condition>
                <script>// code | content  
if(!node.parent) return false
if(node.style.name == &quot;default&quot; || !node.style.name) {
    def regex = &quot;(code|content|comment)&quot;
    def styleName = node.parent.style.name
    if(styleName &amp;&amp; styleName.matches(regex)) {
        node.style.name = styleName
    }
}
if(node.plainText.startsWith(&quot;::&quot;)) {
    try {
        
        def styleName = node.plainText.substring(2)
        if(styleName.contains(&quot;:&quot;)) {
            node.text = styleName.substring(styleName.indexOf(&quot;:&quot;)+1)
            styleName = styleName.substring(0, styleName.indexOf(&quot;:&quot;))
        } else {
            node.text = &quot;&quot;
        }
        node.style.name = styleName
        
    } catch(Exception e) {
        node.text = &quot;&lt;html&gt;&lt;div&gt;&lt;b class=&apos;code-exception&apos;&gt;Exception: &lt;/b&gt;&quot; + node.plainText + &quot;&lt;/div&gt;&lt;/html&gt;&quot;
    }
}
return false</script>
            </script_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="script" LAST="false">
            <disjunct_condition>
                <node_compare_condition VALUE="test" COMPARATION_RESULT="0" SUCCEED="true" ITEM="filter_node"/>
                <hyper_link_contains TEXT="RunNoteScript"/>
            </disjunct_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" LOCALIZED_STYLE_REF="defaultstyle.floating" LAST="false">
            <script_condition>
                <script>//�����ڵ�

if(node.children.size()==0) return false
def stream = new ArrayList(node.children).stream()
if(stream.anyMatch(x -&gt; x.isFree())) return true

return false</script>
            </script_condition>
        </conditional_style>
        <conditional_style ACTIVE="false" STYLE_REF="doubt" LAST="false">
            <script_condition>
                <script>//map file not found:  

def link = node.link.text
if(!c.selecteds.contains(node) || !link || !link.endsWith(&quot;.mm&quot;)) return false

def index = link.lastIndexOf(&quot;/&quot;)
if(index == -1) return false
def fileName = link.contains(&quot;/&quot;) ? link.substring(index+1) : link
def pathToRootText = node.pathToRoot
        .findAll { it != node.mindMap.root &amp;&amp; it != node }
        .collect { it.plainText }
        .join(&quot;/&quot;)

def file = new File(node.mindMap.file.parent, pathToRootText + &quot;/&quot; + fileName)

return !file.exists()</script>
            </script_condition>
        </conditional_style>
    </conditional_styles>
    <properties show_icon_for_attributes="true" edgeColorConfiguration="" spatiallySeparateSubtrees="true" show_tags="UNDER_NODES" show_note_icons="true" associatedTemplateLocation="template:/_light.mm" fit_to_viewport="false" show_icons="BESIDE_NODES" showTagCategories="false"/>
    <tags category_separator="::"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" FORMAT="STANDARD_FORMAT" VGAP_QUANTITY="24 pt" BORDER_WIDTH="1 px">
<font SIZE="24"/>
<edge STYLE="horizontal" COLOR="#cccccc" WIDTH="2"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="bottom_or_right" STYLE="bubble" FORMAT="STANDARD_FORMAT" BORDER_WIDTH="1 px">
<edge STYLE="horizontal" COLOR="#cccccc" WIDTH="2"/>
<stylenode LOCALIZED_TEXT="default" ID="ID_1895114196" ICON_SIZE="15 pt" FORMAT_AS_HYPERLINK="false" COLOR="#333333" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" TEXT_ALIGN="DEFAULT" TEXT_WRITING_DIRECTION="LEFT_TO_RIGHT" MAX_WIDTH="800 px" MIN_WIDTH="50 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#cccccc" BORDER_DASH_LIKE_EDGE="false" BORDER_DASH="SOLID" VGAP_QUANTITY="2 pt" COMMON_HGAP_QUANTITY="20 pt" CHILD_NODES_LAYOUT="AUTO_CENTERED">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#cccccc" WIDTH="2" TRANSPARENCY="255" DASH="" FONT_SIZE="8" DESTINATION="ID_1895114196" STARTARROW="NONE" ENDARROW="DEFAULT"/>
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false" STRIKETHROUGH="false" ITALIC="false"/>
<edge STYLE="horizontal" COLOR="#cccccc" WIDTH="1" DASH="SOLID"/>
<richcontent TYPE="DETAILS" CONTENT-TYPE="plain/html"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/html"/>
<hook NAME="NodeCss">
h1 {
  color:#B5A0C9; /*#B5A0C9;*/
  font-size: 12pt;
}
h2 {
  color:#400080; /*#400080,#B5A0C9;*/
  font-size: 10pt;
  border-bottom: 2px solid #E1EBF5;
}
h3 {
  color:#5D17A3; /*#5D17A3,#B5A0C9;*/
  font-size: 9pt;
  padding-left: 5px;
}

h4 {
  color:#8148BA; /*#8148BA,#877EB8;*/
  font-size: 8pt;
  padding-left: 5px;
}

h5 {
  color: #B591D9; /*#B591D9,#8160A1;*/
  font-size: 7pt;
  padding-left: 5px;
}
h6 {
  color: #D5C5E6; /*#D5C5E6,#FFFFFF;*/
  font-size: 6pt;
  padding-left: 5px;
}

.title5 {
  color: #8698F2;
  background-color:#DBE4EB;
  text-decoration: overline;
  font-weight: normal;
}

.title6 {
  color: black,#D5C5E6;
  background-color:#DBE4EB;
  font-weight: normal;
  text-decoration: overline;
}

pre {
  /* font-size: 10pt; */
  margin-left: 10px;
  margin-right: 10px;
  padding: 3px;
  /* background-color:#DBE4EB;  */
  background-color:#F3F2F2; 
  font-family: consolas, Microsoft YaHei, serif;

}
pre.input {
  border-left-color: #89A8D6; 
  /* border-left: 2px solid #89A8D6; */
}
pre.output {
  color: #787AB2;
  border-left: 2px solid #787AB2;
}
/* code.details {
  font-size: 10pt;
} */
code, kbd {
  font-size: 10pt;
  background-color:#F3F2F2;
  /* background-color:#DBE4EB; */
  font-family: consolas, serif;
}

blockquote {
  margin-top: 1px;
  margin-bottom: 1px;
  margin-left: 10px;
  margin-right: 10px;
  color: #769496;
  padding: 5px;
  border-top: 0px solid #769496;
  border-bottom: 0px solid #769496;
  border-left: 1px solid #769496;
  border-right: 0px solid #769496;
}

/* table {
  width: 100%;
  margin: 1px;
}

th {
  background-color:#DBE4EB;
}

th, td {
  text-align: left; 
  border-top: 0px solid white;
  border-bottom: 1px solid #CCCCCC;
  border-left: 0px solid white;
  border-right: 0px solid white;
}
tr {
  text-align: left; 
} */

table {
  width: 100%;
}

th {
  max-width: 20%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  font-weight: bold;
}

tr {
  text-align: left; 
}

th, td {
  border: 1px solid #f3f2f2;

}



ol, ul, dl {
  margin-left: 10px;
  margin-top: 1px;
  margin-bottom: 1px;
}

ul.outline, ul.outline ul {
  list-style-type: none; /* 移除列表项目符号 */
  margin-left: 5px; /* 列表的整体左边距 */
  padding-left: 0; /* 移除列表的内边距 */
}

ul.outline li {
  border-left: 1px solid #d1d1d1; /* 左侧显示竖线 */
  padding-left: 5px; /* 列表项内容与竖线之间的空间 */
}


a {
  color: #829CF8;
}

u {
  background-color:#f3f2f2;
}


abbr {
  color: gray;
  text-decoration: dotted;
}

img {
  width: 100%;
}

details {
  border: 1px solid #24272E;
}

/* p {
  padding-top: 3pt;
  padding-bottom: 3pt;
} */

.toc {
   border-top: 2px solid #DBE4EB;
}

span[data-type=&apos;emoji&apos;] {
  font-family: sans-serif;
}

.info, .info-details {
  background-color:#DBE4EB;
  border-top: 1px solid #C9C9E0;
  border-bottom: 1px solid #C9C9E0;
  border-left: 0px solid #C9C9E0;
  border-right: 0px solid #C9C9E0;
}
.warn, .warn-details {
  background-color:#DBE4EB;
  color: #F54D4D;
  border-top: 1px solid #F54D4D;
  border-bottom: 1px solid #F54D4D;
  border-left: 0px solid #F54D4D;
  border-right: 0px solid #F54D4D;
}
.check, .check-details {
  background-color:#DBE4EB;
  color: green;
  border-top: 1px solid green;
  border-bottom: 1px solid green;
  border-left: 0px solid green;
  border-right: 0px solid green;
}
.refer, .refer-details {
  /* font-family: 迷你简启体; */
  /* font-size: 11pt; */
  font-style: italic;
  background-color:#DBE4EB;
  border-top: 1px solid #C9C9E0;
  border-bottom: 1px solid #C9C9E0;
  border-left: 0px solid #C9C9E0;
  border-right: 0px solid #C9C9E0;
}
.details {
  border: 1px dashed #DBE4EB;
}
.default-details, .info-details, .warn-details, .check-details, .refer-details {
  text-decoration: none;
  border-style: dashed;
}

.keyword {
  font-family: Microsoft YaHei, 微软雅黑, serif;
  font-weight: bold;
}


blockquote.comment {
  position: relative;
  padding-left: 2em;
  font-style: italic;
  color: gray;
  border-left: 5px;
}
blockquote.comment p {
  font-family: kaiti, Microsoft YaHei, 微软雅黑, Noto Sans CJK SC, &quot;PingFang SC&quot;, sans-serif !important;
  border-bottom: 1px solid #DBE4EB;
}

.code-public {
  color: #0D9A37;
  font-family: consolas;
}
/* .code-public {
  color: #F4EA2A;
} */
.code-private {
  color: red;
  font-family: consolas;
}
.code-static {
  font-style: italic;
  text-decoration: underline;
  /* background-color: gray; */
  font-family: consolas;
}

.code-method {
  color: #72A9FF;
  font-weight: bold;
  font-family: consolas;
}
.code-field {
  color: #E66D64;
  font-weight: bold;
  font-family: consolas;
}
.code-class {
  color: #A2BA1B;
  font-weight: bold;
  font-family: consolas;
}

.code-enum {
  color: #D1D67D;
  font-weight: bold;
  font-family: consolas;
}

.code-constructor {
  color: #4C6CF5;
  font-weight: bold;
  font-family: consolas;
}
.code-interface {
  color: #AB4986;
  font-family: consolas;
}
.code-annotation {
  color: #AB4986;
  font-weight: bold;
  font-family: consolas;
}
.code-exception {
  color: #CC3142;
  font-family: consolas;
}
.code-param {
  font-weight: normal;
  font-family: consolas;
}
.code-string {
  color: #965D23;
  font-family: consolas;
}
.code-comment {
  color: gray;
  font-family: consolas;
}


.color-blue {
  color: #72A9FF;
}
.color-orange {
  color: #FFA952;
}
.color-yellow {
  color: #A2BA1B,yellow;
}
.color-green {
  color: #3DCC7D;
}
.color-purple {
  color: #4C6CF5;
}
.color-gray {
  color:#a79c9c;
  font-weight: normal;
}
.color-red {
  color: #CC3142;
  font-weight: normal;
}

.point-red, .background-color-red {
  color: black,white;
  background-color: #CC3142;
}
.point-blue, .background-color-blue {
  color: black;
  background-color: #C9D5FF;
}
.point-orange, .background-color-orange {
  color: black;
  background-color: #FFA952;
  
}
.point-yellow, .background-color-yellow, .highlight {
  color: black;
  background-color: yellow;
}
.point-green, .background-color-green {
  color: black;
  color: #3DCC7D;
}
.point-gray, .background-color-gray {
  color: black,white;
  background-color:#CCCCCC;
  font-weight: normal;
  
}

.ai-explaination {
  border-left: dotted; 
  color: gray; 
  padding-left: 10px;
}
.translation {
  /* font-size: 8pt; */
  padding: 2px;
  margin-left: 5px;
  margin-right: 5px;
  color: gray;
  border: 1px dotted;
}

small, .inlinecomment {
  color: #ADADAD, gray;
  font-size: 9pt;
}


div.ai-chatgpt {
  border: 1px dotted;
  border-color: orange;
  margin: 2pt;
  padding: 2pt;
}

a.quicker-nav {
  color: gray;
}

.reference {
  font-style: italic;
}

div.tag, div.details, div.note {
  border-top: 1px solid gray; 
  margin: 0px 0;
}
.tag {
  border: 1px solid gray; 
  background-color: #E4E4E4, gray;
}



</hook>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details" ID="ID_1027068381" ICON_SIZE="15 pt" COLOR="#999999" BACKGROUND_COLOR="#fdfdfc" BACKGROUND_ALPHA="0" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="20 cm" BORDER_WIDTH="1 px" BORDER_COLOR="#fdfdfc" BORDER_COLOR_ALPHA="0">
<font NAME="Microsoft YaHei" SIZE="8" BOLD="false"/>
<edge STYLE="horizontal" COLOR="#cccccc" WIDTH="1"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.tags">
<font SIZE="10"/>
<edge WIDTH="1"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes" ID="ID_1176025365" ICON_SIZE="15 pt" COLOR="#999999" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="20 cm" BORDER_WIDTH="1 px" BORDER_COLOR="#fdfdfc" BORDER_COLOR_ALPHA="0">
<font NAME="Microsoft YaHei" SIZE="8" BOLD="false"/>
<edge STYLE="horizontal" COLOR="#cccccc" WIDTH="2"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" ID="ID_1045000209" ICON_SIZE="15 pt" COLOR="#333333" BACKGROUND_COLOR="#ffffff" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="20 cm" BORDER_WIDTH="1 px" BORDER_COLOR="#fdfdfc" BORDER_COLOR_ALPHA="0">
<font NAME="Microsoft YaHei" SIZE="11" BOLD="false"/>
<edge STYLE="horizontal" COLOR="#cccccc" WIDTH="1"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.floating" ICON_SIZE="15 pt" COLOR="#333333" BACKGROUND_COLOR="#f2f2f2" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="15 cm" BORDER_WIDTH="1 px" BORDER_COLOR="#fdfdfc" BORDER_COLOR_ALPHA="0">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false"/>
<edge STYLE="hide_edge" COLOR="#cccccc" WIDTH="1" DASH="SOLID"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.selection" ICON_SIZE="15 pt" COLOR="#333333" BACKGROUND_COLOR="#6699ff" FORMAT="STANDARD_FORMAT" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#fdfdfc" BORDER_COLOR_ALPHA="0">
<font SIZE="12"/>
<edge STYLE="horizontal" COLOR="#cccccc" WIDTH="1"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="bottom_or_right" STYLE="bubble" FORMAT="STANDARD_FORMAT" BORDER_WIDTH="1 px">
<edge STYLE="horizontal" COLOR="#cccccc" WIDTH="2"/>
<stylenode TEXT="doubt" ICON_SIZE="15 pt" FORMAT_AS_HYPERLINK="false" COLOR="#ff3300" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR="#dbdbdb" BORDER_DASH_LIKE_EDGE="false">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="mark" ICON_SIZE="15 pt" FORMAT_AS_HYPERLINK="false" COLOR="#ffcc99" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR="#dbdbdb" BORDER_DASH_LIKE_EDGE="false">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="wrong" ICON_SIZE="15 pt" FORMAT_AS_HYPERLINK="false" COLOR="#cccccc" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR="#dbdbdb" BORDER_DASH_LIKE_EDGE="false" BORDER_DASH="SOLID">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false" STRIKETHROUGH="true"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="highlight" FORMAT_AS_HYPERLINK="false" COLOR="#333333" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="2 px" BORDER_COLOR="#ffff00" BORDER_DASH_LIKE_EDGE="false">
<font NAME="Microsoft YaHei"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="hide" ICON_SIZE="15 pt" FORMAT_AS_HYPERLINK="false" COLOR="#ebebeb" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR="#dbdbdb" BORDER_DASH_LIKE_EDGE="false" BORDER_DASH="CLOSE_DOTS">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="notice" ICON_SIZE="15 pt" FORMAT_AS_HYPERLINK="false" COLOR="#ff9933" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR="#dbdbdb" BORDER_DASH_LIKE_EDGE="false">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="script" ICON_SIZE="15 pt" STYLE="rectangle" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#00cc33" BORDER_DASH="SOLID">
<font NAME="΢���ź�" SIZE="12" BOLD="false"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="0%" ICON_SIZE="15 pt" COLOR="#cccccc" BACKGROUND_COLOR="#f2f2f2" STYLE="rectangle" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#cccccc" BORDER_DASH="CLOSE_DOTS">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="25%" ICON_SIZE="15 pt" BACKGROUND_COLOR="#f2f2f2" STYLE="rectangle" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#ff99cc" BORDER_DASH="CLOSE_DOTS">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="50%" ICON_SIZE="15 pt" BACKGROUND_COLOR="#f2f2f2" STYLE="rectangle" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#99ccff" BORDER_DASH="CLOSE_DOTS">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="75%" ICON_SIZE="15 pt" BACKGROUND_COLOR="#f2f2f2" STYLE="rectangle" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#ffcc33" BORDER_DASH="CLOSE_DOTS">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="100%" ICON_SIZE="15 pt" COLOR="#cccccc" BACKGROUND_COLOR="#f2f2f2" STYLE="rectangle" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#00cc33" BORDER_DASH="DASHES">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false" STRIKETHROUGH="false"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="comment" ICON_SIZE="12 pt" FORMAT_AS_HYPERLINK="false" COLOR="#666666" BACKGROUND_COLOR="#ffffff" STYLE="fork" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="15 cm" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_DASH_LIKE_EDGE="false">
<font NAME="Microsoft YaHei UI" SIZE="10" BOLD="false" ITALIC="true"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="code" ICON_SIZE="14 pt" FORMAT_AS_HYPERLINK="false" BACKGROUND_COLOR="#ffffff" STYLE="fork" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" TEXT_ALIGN="DEFAULT" MAX_WIDTH="1200 px" MIN_WIDTH="50 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_DASH_LIKE_EDGE="false" BORDER_DASH="SOLID" VGAP_QUANTITY="2 pt" CHILD_NODES_LAYOUT="AUTO_CENTERED">
<font NAME="Consolas" SIZE="10" BOLD="false" STRIKETHROUGH="false" ITALIC="false"/>
<richcontent TYPE="DETAILS" CONTENT-TYPE="plain/html"/>
<edge STYLE="horizontal" WIDTH="1"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/html"/>
</stylenode>
<stylenode TEXT="exception" ICON_SIZE="15 pt" FORMAT_AS_HYPERLINK="false" COLOR="#ff3300" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="1200 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR="#dbdbdb" BORDER_DASH_LIKE_EDGE="false">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="reference" ICON_SIZE="14 pt" FORMAT_AS_HYPERLINK="false" VGAP_QUANTITY="2 pt" CHILD_NODES_LAYOUT="AUTO_CENTERED" BACKGROUND_COLOR="#ffffff" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" TEXT_ALIGN="DEFAULT" MAX_WIDTH="1200 px" MIN_WIDTH="50 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_DASH_LIKE_EDGE="false" BORDER_DASH="SOLID">
<font SIZE="12" BOLD="false" STRIKETHROUGH="false" ITALIC="true"/>
<richcontent TYPE="DETAILS" CONTENT-TYPE="plain/html"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/html"/>
<edge STYLE="horizontal" WIDTH="1"/>
</stylenode>
<stylenode TEXT="process" ID="ID_858991101" MAX_WIDTH="1200 px">
<arrowlink DESTINATION="ID_858991101"/>
<edge WIDTH="1"/>
</stylenode>
<stylenode TEXT="note" ICON_SIZE="12 pt" FORMAT_AS_HYPERLINK="false" COLOR="#333333" BACKGROUND_COLOR="#ffffcc" STYLE="rectangle" SHAPE_HORIZONTAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" TEXT_ALIGN="DEFAULT" TEXT_WRITING_DIRECTION="LEFT_TO_RIGHT" MAX_WIDTH="600 px" MIN_WIDTH="50 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#ffffcc" BORDER_DASH_LIKE_EDGE="false" BORDER_DASH="SOLID" VGAP_QUANTITY="2 pt" COMMON_HGAP_QUANTITY="14 pt" CHILD_NODES_LAYOUT="AUTO_CENTERED">
<font NAME="Microsoft YaHei" SIZE="8" BOLD="false" STRIKETHROUGH="false" ITALIC="false"/>
<richcontent TYPE="DETAILS" CONTENT-TYPE="plain/html"/>
<edge STYLE="hide_edge" COLOR="#cccccc" WIDTH="1" DASH="SOLID"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/html"/>
</stylenode>
<stylenode TEXT="pin" ICON_SIZE="8 pt" FORMAT_AS_HYPERLINK="false" BACKGROUND_COLOR="#ffffcc" STYLE="rectangle" SHAPE_HORIZONTAL_MARGIN="0 pt" SHAPE_VERTICAL_MARGIN="0 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" TEXT_ALIGN="LEFT" TEXT_WRITING_DIRECTION="LEFT_TO_RIGHT" MAX_WIDTH="800 px" MIN_WIDTH="10 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR="#ffffcc" BORDER_DASH_LIKE_EDGE="false" BORDER_DASH="SOLID" VGAP_QUANTITY="2 pt" COMMON_HGAP_QUANTITY="5 pt" CHILD_NODES_LAYOUT="AUTO_CENTERED">
<icon BUILTIN="emoji-1F4CD"/>
<font SIZE="5" BOLD="false" STRIKETHROUGH="false" ITALIC="false"/>
<richcontent TYPE="DETAILS" CONTENT-TYPE="plain/html"/>
<edge STYLE="hide_edge" WIDTH="1"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/html"/>
</stylenode>
<stylenode TEXT="nested" ICON_SIZE="15 pt" FORMAT_AS_HYPERLINK="false" COLOR="#333333" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="5 pt" SHAPE_VERTICAL_MARGIN="3 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" TEXT_ALIGN="DEFAULT" TEXT_WRITING_DIRECTION="LEFT_TO_RIGHT" MAX_WIDTH="800 px" MIN_WIDTH="50 px" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#cccccc" BORDER_COLOR_ALPHA="0" BORDER_DASH_LIKE_EDGE="false" BORDER_DASH="SOLID" VGAP_QUANTITY="2 pt" COMMON_HGAP_QUANTITY="14 pt" CHILD_NODES_LAYOUT="TOPTOBOTTOM_RIGHT_BOTTOM">
<font NAME="Microsoft YaHei" SIZE="12" BOLD="false" STRIKETHROUGH="false" ITALIC="false"/>
<richcontent TYPE="DETAILS" CONTENT-TYPE="plain/html"/>
<hook NAME="NodeCss">
h1 {
  color:#B5A0C9; /*#B5A0C9;*/
  font-size: 14pt;
}
h2 {
  color:#400080; /*#400080,#B5A0C9;*/
  font-size: 13pt;
  border-bottom: 2px solid #E1EBF5;
}
h3 {
  color:#5D17A3; /*#5D17A3,#B5A0C9;*/
  font-size: 12pt;
  padding-left: 5px;
}

h4 {
  color:#8148BA; /*#8148BA,#877EB8;*/
  font-size: 10pt;
  padding-left: 5px;
}

h5 {
  color: #B591D9; /*#B591D9,#8160A1;*/
  font-size: 9pt;
  padding-left: 5px;
}
h6 {
  color: #D5C5E6; /*#D5C5E6,#FFFFFF;*/
  font-size: 8pt;
  padding-left: 5px;
}
.title5 {
  color: #8698F2;
  background-color:#DBE4EB;
  text-decoration: overline;
  font-weight: normal;
}

.title6 {
  color: black,#D5C5E6;
  background-color:#DBE4EB;
  font-weight: normal;
  text-decoration: overline;
}

pre {
  /* font-size: 10pt; */
  margin-left: 10px;
  margin-right: 10px;
  padding: 3px;
  /* background-color:#DBE4EB;  */
  background-color:#DBE4EB; 
  font-family: consolas, Microsoft YaHei, serif;

}
pre.input {
  border-left-color: #89A8D6; 
  /* border-left: 2px solid #89A8D6; */
}
pre.output {
  color: #787AB2;
  border-left: 2px solid #787AB2;
}
/* code.details {
  font-size: 10pt;
} */
code, kbd {
  /* font-size: 10pt; */
  color: #596287;
  /* background-color:#DBE4EB; */
  font-family: consolas, serif;
}

blockquote {
  margin-top: 1px;
  margin-bottom: 1px;
  margin-left: 10px;
  margin-right: 10px;
  color: #769496;
  padding: 5px;
  border-top: 0px solid #769496;
  border-bottom: 0px solid #769496;
  border-left: 1px solid #769496;
  border-right: 0px solid #769496;
}

table {
  width: 100%;
  margin: 1px;
}

th {
  background-color:#DBE4EB;
}
/* th, td {
  border: 1px solid #E8E8E8;
} */
th, td {
  text-align: left; 
  border-top: 0px solid white;
  border-bottom: 1px solid #CCCCCC;
  border-left: 0px solid white;
  border-right: 0px solid white;
}
tr {
  text-align: left; 
}


ol, ul, dl {
  margin-left: 20px;
}

ul.outline {
  list-style-type: none; /* 移除列表项目符号 */
  margin-left: 10px; /* 列表的整体左边距 */
  padding-left: 0; /* 移除列表的内边距 */
}

ul.outline li {
  border-left: 1px solid gray; /* 左侧显示竖线 */
  padding-left: 5px; /* 列表项内容与竖线之间的空间 */
}

a {
  color: #829CF8;
}

abbr {
  color: gray;
  text-decoration: dotted;
}

img {
  width: 100%;
}

details {
  border: 1px solid #24272E;
}

/* p {
  padding-top: 3pt;
  padding-bottom: 3pt;
} */

.toc {
   border-top: 2px solid #DBE4EB;
}

.info, .info-details {
  background-color:#DBE4EB;
  border-top: 1px solid #C9C9E0;
  border-bottom: 1px solid #C9C9E0;
  border-left: 0px solid #C9C9E0;
  border-right: 0px solid #C9C9E0;
}
.warn, .warn-details {
  background-color:#DBE4EB;
  color: #F54D4D;
  border-top: 1px solid #F54D4D;
  border-bottom: 1px solid #F54D4D;
  border-left: 0px solid #F54D4D;
  border-right: 0px solid #F54D4D;
}
.check, .check-details {
  background-color:#DBE4EB;
  color: green;
  border-top: 1px solid green;
  border-bottom: 1px solid green;
  border-left: 0px solid green;
  border-right: 0px solid green;
}
.refer, .refer-details {
  /* font-family: 迷你简启体; */
  /* font-size: 11pt; */
  font-style: italic;
  background-color:#DBE4EB;
  border-top: 1px solid #C9C9E0;
  border-bottom: 1px solid #C9C9E0;
  border-left: 0px solid #C9C9E0;
  border-right: 0px solid #C9C9E0;
}
.details {
  background-color:#E9E5ED;
  /* border: 1px dashed #666666; */
}
.default-details, .info-details, .warn-details, .check-details, .refer-details {
  text-decoration: none;
  border-style: dashed;
}

.code-public {
  color: #0D9A37;
}
/* .code-public {
  color: #F4EA2A;
} */
.code-private {
  color: red;
}
.code-static {
  font-style: italic;
  text-decoration: underline;
  /* background-color: gray; */
}
.code-method {
  color: #72A9FF;
  font-weight: bold;
}
.code-field {
  color: #E66D64;
  font-weight: bold;
}
.code-class {
  color: #A2BA1B;
  font-weight: bold;
}
.code-enum {
  color: #3DCC7D;
  font-weight: bold;
}
.code-constructor {
  color: #4C6CF5;
  font-weight: bold;
}
.code-interface {
  color: #AB4986;
}
.code-annotation {
  color: #AB4986;
  font-weight: bold;
}
.code-exception {
  color: #CC3142;
}
.code-param {
  font-weight: normal;
}
.code-string {
  color: #965D23;
}
.code-comment {
  color: gray;
}


.color-blue {
  color: #72A9FF;
}
.color-orange {
  color: #FFA952;
}
.color-yellow {
  color: #A2BA1B,yellow;
}
.color-green {
  color: #3DCC7D;
}
.color-purple {
  color: #4C6CF5;
}
.color-gray {
  color:#a79c9c;
  font-weight: normal;
}
.color-red {
  color: #CC3142;
  font-weight: normal;
}

.point-red, .background-color-red {
  color: black,white;
  background-color: #CC3142;
}
.point-blue, .background-color-blue {
  color: black;
  background-color: #C9D5FF;
}
.point-orange, .background-color-orange {
  color: black;
  background-color: #FFA952;
  
}
.point-yellow, .background-color-yellow, .highlight {
  color: black;
  background-color: yellow;
}
.point-green, .background-color-green {
  color: black;
  color: #3DCC7D;
}
.point-gray, .background-color-gray {
  color: black,white;
  background-color:#CCCCCC;
  font-weight: normal;
  
}

.ai-explaination {
  border-left: dotted; 
  color: gray; 
  padding-left: 10px;
}
.translation {
  /* font-size: 8pt; */
  padding: 2px;
  margin-left: 5px;
  margin-right: 5px;
  color: gray;
  border: 1px dotted;
}

small, .inlinecomment {
  color: #ADADAD, gray;
  font-size: 9pt;
}


div.ai-chatgpt {
  border: 1px dotted;
  border-color: orange;
  margin: 2pt;
  padding: 2pt;
}

a.quicker-nav {
  color: gray;
}

.reference {
  font-style: italic;
}

div.tag, div.details, div.note {
  border-top: 1px solid gray; 
  margin: 0px 0;
}
</hook>
<edge STYLE="hide_edge" COLOR="#cccccc" WIDTH="1" DASH="SOLID"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/html"/>
<cloud COLOR="#ffffff" SHAPE="RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="bottom_or_right" STYLE="bubble" FORMAT="STANDARD_FORMAT" BORDER_WIDTH="1 px">
<edge STYLE="horizontal" COLOR="#cccccc" WIDTH="2"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" ICON_SIZE="15 pt" COLOR="#333333" BACKGROUND_COLOR="#cccccc" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="20 pt" SHAPE_VERTICAL_MARGIN="10 pt" FORMAT="STANDARD_FORMAT" MAX_WIDTH="15 cm" BORDER_WIDTH="1.5 px" BORDER_COLOR="#fdfdfc" CHILD_NODES_LAYOUT="TOPTOBOTTOM_RIGHT_AUTO" VGAP_QUANTITY="5 pt" COMMON_HGAP_QUANTITY="25 pt">
<font NAME="Microsoft YaHei" SIZE="16" BOLD="false" STRIKETHROUGH="false"/>
<edge STYLE="horizontal" WIDTH="2" DASH="SOLID"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" ICON_SIZE="15 pt" COLOR="#333333" BACKGROUND_COLOR="#f5f5f5" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="10 pt" SHAPE_VERTICAL_MARGIN="5 pt" NUMBERED="false" FORMAT="STANDARD_FORMAT" MAX_WIDTH="15 cm" BORDER_WIDTH="1 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#dbdbdb" VGAP_QUANTITY="3 pt" COMMON_HGAP_QUANTITY="25 pt">
<font NAME="Microsoft YaHei" SIZE="14" BOLD="false"/>
<edge STYLE="horizontal" WIDTH="2" DASH="SOLID"/>
</stylenode>
</stylenode>
</stylenode>
</map_styles>
</hook>
<node TEXT="software" POSITION="bottom_or_right" ID="ID_29407108" CREATED="1754792945355" MODIFIED="1754792945357" LINK="software/">
<node TEXT="Quicker" ID="ID_1879806644" CREATED="1754792952373" MODIFIED="1754792952376" LINK="software/Quicker/">
<node TEXT="Quicker.mm" ID="ID_1533446537" CREATED="1754792957347" MODIFIED="1754792957349" LINK="software/Quicker/Quicker.mm"/>
<node ID="ID_184732051" CREATED="1754792957350" MODIFIED="1754792992584" LINK="software/Quicker/Quicker.png"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    Quicker.png
  </body>
</html>
</richcontent>
<richcontent TYPE="NOTE">
<html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="file:///E:/@mindmap-/@project-/geekmap-cs/doc/software/Quicker/Quicker.png" alt="Image" width="595" height="1389" style="width: 595px; height: 1389px;"/>
    </p>
  </body>
</html></richcontent>
</node>
<node TEXT="Quicker.xmind" ID="ID_84360238" CREATED="1754792957353" MODIFIED="1754792957354" LINK="software/Quicker/Quicker.xmind"/>
</node>
</node>
<node TEXT="cs" POSITION="bottom_or_right" ID="ID_1478000630" CREATED="1754792945361" MODIFIED="1754792945361" LINK="cs/">
<node TEXT="tutorial" ID="ID_70475003" CREATED="1754792957361" MODIFIED="1754792957363" LINK="cs/tutorial/">
<node TEXT="CS-Notes" ID="ID_1072685928" CREATED="1754792957363" MODIFIED="1754792957365" LINK="cs/tutorial/CS-Notes/">
<node TEXT="CS-Notes.mm" ID="ID_1233916617" CREATED="1754792957365" MODIFIED="1754792957367" LINK="cs/tutorial/CS-Notes/CS-Notes.mm"/>
<node ID="ID_1078241408" CREATED="1754792957367" MODIFIED="1754792975619" LINK="cs/tutorial/CS-Notes/CS-Notes.png"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    CS-Notes.png
  </body>
</html>
</richcontent>
<richcontent TYPE="NOTE">
<html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="file:///E:/@mindmap-/@project-/geekmap-cs/doc/cs/tutorial/CS-Notes/CS-Notes.png" alt="Image" width="636" height="3844" style="width: 636px; height: 3844px;"/>
    </p>
  </body>
</html></richcontent>
</node>
<node TEXT="CS-Notes.xmind" ID="ID_1267428947" CREATED="1754792957369" MODIFIED="1754792957372" LINK="cs/tutorial/CS-Notes/CS-Notes.xmind"/>
</node>
</node>
</node>
<node TEXT="java" POSITION="bottom_or_right" ID="ID_630095609" CREATED="1754792945363" MODIFIED="1754792945363" LINK="java/">
<node TEXT="lib" ID="ID_1717511554" CREATED="1754792957298" MODIFIED="1754792957300" LINK="java/lib/">
<node TEXT="Hutool" ID="ID_1057338663" CREATED="1754792957315" MODIFIED="1754792957317" LINK="java/lib/Hutool/">
<node TEXT="Hutool.mm" ID="ID_1085268772" CREATED="1754792957321" MODIFIED="1754792957323" LINK="java/lib/Hutool/Hutool.mm"/>
<node ID="ID_147428717" CREATED="1754792957323" MODIFIED="1754792984437" LINK="java/lib/Hutool/Hutool.png"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    Hutool.png
  </body>
</html>
</richcontent>
<richcontent TYPE="NOTE">
<html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="file:///E:/@mindmap-/@project-/geekmap-cs/doc/java/lib/Hutool/Hutool.png" alt="Image" width="558" height="2076" style="width: 558px; height: 2076px;"/>
    </p>
  </body>
</html></richcontent>
</node>
<node TEXT="Hutool.xmind" ID="ID_1374516304" CREATED="1754792957326" MODIFIED="1754792957328" LINK="java/lib/Hutool/Hutool.xmind"/>
</node>
</node>
<node TEXT="tutorial" ID="ID_1931430675" CREATED="1754792957302" MODIFIED="1754792957305" LINK="java/tutorial/">
<node TEXT="javaguide" ID="ID_131921399" CREATED="1754792957318" MODIFIED="1754792957320" LINK="java/tutorial/javaguide/">
<node TEXT="JavaGuide.mm" ID="ID_268531539" CREATED="1754792957335" MODIFIED="1754792957335" LINK="java/tutorial/javaguide/JavaGuide.mm"/>
<node TEXT="JavaGuide.png" ID="ID_1875232067" CREATED="1754792957337" MODIFIED="1754792957338" LINK="java/tutorial/javaguide/JavaGuide.png"/>
<node TEXT="JavaGuide.xmind" ID="ID_152680004" CREATED="1754792957338" MODIFIED="1754792957340" LINK="java/tutorial/javaguide/JavaGuide.xmind"/>
</node>
</node>
</node>
</node>
</map>
