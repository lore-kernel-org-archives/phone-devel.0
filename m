Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271573C1967
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 21:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017575; cv=none; b=Xs6ffT7bBPA3OGD9u1wxS5lYsA7KNKfzeu5YyWXde1jFfO3IAAnLtd9x1lQo0J7ggtOz7cj0k18Wmp2u79+1Qp6LjZRRo8qyFcjNMhO3K9mpyFrVBP4aoVj8SR4o1NS+Vc8XNFTchocrMR2ZZTNNB0goyOHgZOkol10hZh4W8cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017575; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l19FhkIUe5ZijdEQl9jpPQ+H9ZpVCLwkhTDUrj68brIbVBHa/ORgOGUIlMaAinhl46KsIO7ZsF7yP2+m6bMhsBg6T7VWnv9w1y8fvTA9NdN217eM66+1o8L0NmMM2LP1/vanE4evPkBik7BAs/zlLYQCfkkMfhsR2IDNUeq7qrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7j7QgO1; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7j7QgO1"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79885f4a8ffso56755147b3.3
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 14:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017573; x=1778622373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=F7j7QgO1/ZEHRQ8j4k3h/vV1CZpw7eBseb/MmldYW9NO71jM8C/2bvp7ZGvgtWquc2
         yILCpuBnYk+/WriHnGqFKxSKCZqueKWh9M9ZQ0EpMN+ixnRPbZgWuuLFx/jm6/x0xcfR
         GdAojbjrJ7TCqEZrdLr+86nnka9Xjl3NYL2xxxHLWi/vyuZi95DZG+yCin2o1MPwL2/2
         3x5TP8QiUXFDR/kY1sNKo8/yERmAcnK4fZZxudXxb9eRJXnFJL7Jy+6sMfwpKjtJ9JoR
         SicpfEqKqcnUIodTBpYkilqg+AAJw05xoy4ThX7DEKypOWw5PmO1nupZvbv88754fuu2
         h6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017573; x=1778622373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=ZgyOw5J38n/Q8b5U2Jdt8X2Bdw5/mH43ieNRcfTtYBLRWYAV5zy6s0tMCcQWq9x3eN
         XIzGze8qg/aQPhsk8yN3hqf1tmFb9+wwEcffXFkzPxUZIXuVg7kYxZK/sFFlEBWRl9oI
         hb75SQheDkDKjT8AsB/ErNihbCX7NkF08U7YoE5zsPar6GkpFSA1IxRi+oZsX70609p+
         voo/wZPBTJauYuS5gCgHbgX/fc1ken1aKv/ckjuQW+jtM2QIvmnYRcMV7qgJIomBZSrZ
         Kqse/O3aIQQ/+7ztx+3zAAG3RfBunu5MldLXDK6kZtA/ZZBM+rFOiCo7OnQSWEU7DXj4
         /8mw==
X-Forwarded-Encrypted: i=1; AFNElJ8HbakYR0w7mgUtZJqw7QMcflfqJ8/juAE8GW1eFiX/HtYlWZheOq6RwtQM87wtALVzI/oqpTZncJ2+Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLXqCzeyEK52ptNLulDIZwV/R4QxQRpFtS4ephpvmtLAOriseq
	Lv5XYT8UnC36rgvt641l+lDs1oDfc589ziv4pcqzPDessyb4WpBiAbTgReLqOg==
X-Gm-Gg: AeBDietZN/fAAhBeto+JqM5JPQHhUK+Chh6XCrEEvlldUms2fLGMMTXQfzIXKvnYQO7
	+73adNgt/zeX5LexvSwgZ61RrO02rChxNXPfckcACb5JfXbNlMfAdmdJlfSNUNmwi7+R83CKcWY
	zyYAfiF3N89yUc/5KMZ+HQFg3+qzh/nJ7EIATU7wlOWjntLRvSQfzkbokIms1SqHdWEqhy/nd1j
	ZOUJYLgCS6C1COtgCqDiNSF3keS0X37TxwD9DkK4VZoaM+0PxxlJZG7FzwVd1vJOyQppkVd6cqn
	u5fU8Qp5793eSZV54bwhF+OsN7f/+GwFgIgih6SiZ0STkQfsDI8kjvHumxYskl/lSSPWc8CKsyJ
	wjMxD6HVHYcN/LLXxN9jAb0Bqrecw+OWrEgOcP7rFEnZE+VmKEYPuBanj7XY5esria+WCwzpq/D
	NKJ6Z+ejPaQttkLMcpmYyD1y9N6Hb2TmjEsjwhGhlEIQ6K+DY=
X-Received: by 2002:a05:690c:c4f9:b0:7ba:f1a2:a448 with SMTP id 00721157ae682-7bdf5d7f239mr11612357b3.10.1778017572841;
        Tue, 05 May 2026 14:46:12 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:12 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:42 +0300
Subject: [PATCH v4 5/9] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-msm8939-venus-rfc-v4-5-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

