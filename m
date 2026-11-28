Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795840603;
	b=saHaSDjYOTnThGcdin7n2dp56j7pOaVxa8hbiugKhfe65QJCxnucUjMx6rHxHKjnQYWV
	 Qk8CMOkvojo4VUWvOoDNddnNMwVlbPsuO7Bv+zfV6qlX6Ks0kN/AYD1uAFW5ow8iUxTvy
	 qwqZzlWxNFh52k89//MPxhKLpelqlkWvVjUjbZHsH2/U8tbhUN15/wJt35TtDiPa6uVzR
	 M95ao9Ea0+qIaeDTv2MdbvtSZq7igH/aeM1LeECbq/RCUD0JB6DYzGLvSmJqp9teVgqhO
	 cUzzaGAuKEBKA2mwfZPjqyiywZmCfOuJM058u3kUQJxhs1q4i+pNhNpMgf/BTRgRmiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795840603;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ppr2KyBlJNRHanEncBGAQ1yg1tO4mkhJrrpqPLXkPsw=;
	b=LtmeaddkWPZ/rJMa2o2InJLM4gg6wju2FBV2BlBcPAGAGkJRk3cAtBUQNEXBVc4tQ5fN
	 NGjumvST2jD95Rrti3VPLcvmQHNXvd+FuSW/k7h35VAQRpoqXKb421GUVssr7fCG2XPZ0
	 sZ2VJqh/isfmbGlwY5pFZPDq8t0YUPZCgwpz9z5r0ZCIowAA5WifWW+DpXeIxk3rExZIm
	 uYBCMrYCufycQEdLRympdsZ0OH8HNyjCcH0Q05skhcSWtwZC/YGTNLFVTVsVUCrPpKC4A
	 GudrdyBMjQsKpj3OowDR0qVl74ah1EQj6yOb45lijumnjVUWs2EJyrRUMIXv0p+nhiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=duy4jSeM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D4E606A68B;
	Sat, 28 Nov 2026 04:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=duy4jSeM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795840603;
	b=YpA0kUtf4qA+3AiorFau0lO21n38y+vwuncEg1A1WdWz0jwWBRj81iKo/SNoEzRcQW3H
	 Dp3uK888n+B990dddklTD/uLpJ5CB+7s+p5JFEUOg6VNQd4VE+0p5wY1cejJyD18bofmR
	 Mm25EilzoUgNRq0lNQwC4E1iH115Oznpr36rCkV/LPP2vJSdNZMiNvpkBE5Mbx0pvIWsQ
	 mS5kamm8q+JxTiXj8Z6DfkrhCjOKODSpz9Psx9PkY8TlawVDg3ptmFgm9AOe5h+6yv5Zo
	 Elnp465P8ACl77RVZzJWfn/iPsmuqxXa9/CbB75fTsLrn6+hVS6+MlVAmHHBl9WPpqA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795840603;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ppr2KyBlJNRHanEncBGAQ1yg1tO4mkhJrrpqPLXkPsw=;
	b=rtCNFRruHIQZ/De7eB87B1YAsJ9LODG6sMUDUgWVoh88Vhrg8adEredIXvTbvLrO3J81
	 nSrsEyWpnq2X/Rk/1WkYWeHYWpajpjjUzdnaAh1aGGIyxT3ov84YRj3/1aMsMFuH6HfJa
	 ELd3CHQbC98KtScx9tpBGlvScAC99Ai0yLV7u+UlK09nOW2J+0SJHinU/9BXiZ22HCEoh
	 pnq7n4rcvHOhzgpMkcr51y3M7yZzmc7CTxi2cxeydaKqBpqjvyB9ItWrk9eaHEkOlhd/E
	 8k4eJldgcU6s7FAGh0rr7+K6a+e77uGOqfIgxXn/YMTjNdx/wv5oTWQ/Y7dphwEydTw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 488E01F00893;
	Sat, 28 Nov 2026 04:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795840603;
	bh=ppr2KyBlJNRHanEncBGAQ1yg1tO4mkhJrrpqPLXkPsw=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=duy4jSeMHqCqXLI5buTnDwkD+4ne11XoCw0c7U8AutnH3qPy5im20urEseWr/nmLs
	 nSEqJXJFvzH4NvfMPy6zS8XRiysbADLqlHlS2L9pIzLdwJQasW6G9qUO+sWLQ84edj
	 M16BhB/z9g+1Iz3ubeGdeZbLyEVjtqnbWjWmh472kE4WIhP/dwpgX2V4s3+xHpfX0p
	 QRgAEKRUOKx8np9y6Nm3c23Ie017ZqlbjKoh1eYVn+45Q1zaHhPdvE10XAjsywjBJv
	 LjuT4Xcdqq5vMU7mUKTZfGSQgEb62pt8ckI71Bybj1k1tJ/lmBu8DtVuCts8NvLyzm
	 1dest5OeUU3sw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9D4A04DFA7;
	Sat, 28 Nov 2026 04:36:30 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: rva333@protonmail.com, amergnat@baylibre.com, me@adomerle.pw, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] soc: mediatek: pwrap: Add MT6789 support
Date: Sat, 28 Nov 2026 04:36:29 +0000
Message-Id: <20261128043629.67417-1-iasnezhkov@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795840589; l=1370;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=M3zFXLBGQlmXviuDhtRSayyWoir9sMjZ4AHGCQ5FGYo=;
 b=nTBsL0eBkEhX9Ai6E73QBe9P1mZ2pYlG1y4P6k//RrP+7H9QLh+8I4E2EkzghMdTE4qy+MNJY
 X9h+AhJw2dODbP/PJDnkE2H4g9gL5dfVp3819rrvkGt1guyiTfrvbDH
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com

This series continues the MediaTek MT6789 (Helio G99/G99+/G100/G200,
MT8781) PMIC wrapper support originally posted by Arseniy Velikanov (on CC):
- pwrap v1: https://lore.kernel.org/linux-mediatek/20250715225746.1321-1-me@adomerle.pw/
- v3: https://lore.kernel.org/r/20261126031001.27288-1-iasnezhkov@gmail.com
- v4: https://lore.kernel.org/r/20261127030009.10572-1-iasnezhkov@gmail.com

Original authorship and Signed-off-by are preserved on patches 1 and 3.

Changes since v4:
- Rebased onto linux-next (resolving conflicts with mt6572 support and
  the dev_err_probe() conversion in pwrap_probe(), per Roman Vivchar).
- Collected Reviewed-by from Roman Vivchar on patch 1/3.
- Clarified PMIF bank 3 INT_FLG/INT_CLR (0x458/0x45C) provenance in
  patch 3/3 commit message.
- Added phone-devel@vger.kernel.org to Cc.

The v3-v5 rebases and arbiter fix were prepared with an AI coding assistant.

Arseniy Velikanov (2):
  dt-bindings: soc: mediatek: pwrap: Add compatible for MT6789
  soc: mediatek: mtk-pmic-pwrap: Add MT6789 support

Ilia Snezhkov (1):
  soc: mediatek: mtk-pmic-pwrap: Skip WDT source and init on arbiter
    SoCs

 .../bindings/soc/mediatek/mediatek,pwrap.yaml |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 50 +++++++++++++++----
 2 files changed, 42 insertions(+), 9 deletions(-)

-- 
2.54.0 (Apple Git-157)



