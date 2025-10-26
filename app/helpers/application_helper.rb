module ApplicationHelper
  def default_meta_tags
    {
      site: "Magical TIL",
      title: "「今日の学び」を「新しい魔法」を覚える楽しみに。",
      description: "TILを分析して、新しい魔法を授ける",
      charset: "utf-8",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: "https://magical-til.onrender.com/",
        image: image_url("ogp.png"),
        local: "ja-JP"
      },
      twitter: {
        card: "summary",
        image: image_url("ogp.png")
      }
    }
  end
end
