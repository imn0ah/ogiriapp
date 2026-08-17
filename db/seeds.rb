questions = [
    {
        category: "日常",
        content: "友達の家に遊びに行ったら、ありえないものが置いてあった。何があった？"
    },
    {
        category: "日常",
        content: "街頭インタビューで思わず「は？」と言ってしまった。何を聞かれた？"
    },
    {
        category: "日常",
        content: "全員既読無視、理由は？"
    },
    {
        category: "日常",
        content: "語尾に「ぴょん」をつけて相手を怒らせて下さい"
    },
    {
        category: "日常",
        content: "絶対に流行らない新しいスポーツとは？"

    },
    {
        category: "仕事",
        content: "予算会議でちょっとだけ嘘をついて下さい"

    },
    {
        category: "仕事",
        content: "絶対に寝坊した人しか言わない言い訳とは？"
    },
    {
        category: "仕事",
        content: "この上司頼りない、なんて言った？"
    },
    {
        category: "仕事",
        content: "上司を一言で絶望させて下さい"
    },
    {
        category: "仕事",
        content: "面接官が『こいつ優秀だ』と思った応募者の一言とは"
    },
    {
        category: "学校",
        content: "先生が生徒に言わないことランキング第一位は？"
    },
    {
        category: "学校",
        content: "その当番本当に必要？何当番？"
    },
    {
        category: "学校",
        content: "好きな子からの手紙を見て苦笑いした、何が書かれていた？"
    },
    {
        category: "学校",
        content: "全校生徒が反対する校則は？"
    },
    {
        category: "学校",
        content: "2100年、必須教科に加えられた新たな教科は？"
    },
]

questions.each do |question|
    Question.find_or_create_by!(question)
end

