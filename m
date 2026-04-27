Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358D23EC2FB
	for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312746; cv=none; b=JimMjRw+/g7O21ifxWcjmIWppUxVbNAg5z1Go2kSr3FmjD/GUePwUg4NJAuoregZ00SZXLHJsyNY3GEzNNoNdGySBWOO6iAbBsU9/dViJ0ZaRXfltK8rWcKE+8seB1Xw5YwmFrM1Wlllc0RT9QaIJGPWNy4kVkioriceHKu/e/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312746; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5MD2IyGeiVuivQ4tKV9qFA0LLgDpuoCO97ngpza6GbRU5Nvaaj08qGBsYSNLul35HWocEkY6QXrF53fY7nk4ZkXWnSCOMqHeKpX452uvu8SOETm6tnLI2/aqEcxfI8P4lnoEZ4vGYHPWBfT8NBeOqfg+YYweXDVN4sooecIPoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5Y3Upzr; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5Y3Upzr"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7986e0553bdso98563377b3.2
        for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312744; x=1777917544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=S5Y3UpzrB0uu+Vxo0VIJkGdyxrv0+IBWysjGpqplCcAeeJUEBXRQG+pMY9+C4d6Vke
         MrZF7mGMt0BRdpg11j+MZumZK8vwen3dHp6UwSh9Fqayjf4/Jk5fyinCIYp1RnWIH7LX
         uFkzlDR8EvbADRstKh3nHwh53oD+7vYTCT6BkbW2EusvOGWGDuYMo/ZEwr38NfP1lyUD
         fExvXSEZxk8e+jpDbiAFXaX3RaS6ogLgQLwHqwK4J9qf95BCMeErZvWyocGZUQm2BG7p
         jWZPv54DV8sqO3d9xRVNQUMJpg4MzHCQgPnabB6V0RwMal8hILf8gY0gzoCXsP2X/lbV
         BCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312744; x=1777917544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=JcNwi5SP7TNKSmGqQIaqWw9PobJowKVbMKbP08q+ONgOVoGpyBAloZ1PY9jLuS7Tsr
         sJRXeWPUFKLhfLuOnsZG7svHmTXDEiC/mBxCrkMMDRDalUIUYpbIR/i6azIQyVKbvWYe
         I45rNmehC6vUjCN4I8mRzXzGKWQtI8tG/zRjb9OP6H/dRKchasXewMxhjamObFW+Wh98
         sIobenY/IqnzReGgwDjssJDV8Sh+AOs5+asDWpsn1v8deUGGBU95cIqtFJei6xjS3Swl
         AIzBfI7d/nmFUJjKeOxrNw2IQeq0Zh6jZdCj+HT14w7X95WgUd+LIMNZTXGJZSOFIa+9
         hM4A==
X-Forwarded-Encrypted: i=1; AFNElJ9JTIZjUr37pAvUh72GBYsiT9xvOKVgnrlTbyzo/hw7XzZvHM8qYDqoNs0pIy4eD8Zs/7xyE3x8nhaUyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8IvP8+4t9STLsnkgOBfbxKeVkSWuiXhbO12DiMH9sL5+024fI
	dpJ1FBcoXG5Dsu13+2jBpX5wILvsyoxxwFalrMrlShRwTPGbaaoUBYml
X-Gm-Gg: AeBDieuYsavRoqxfi7QsWgImVwYnL1h24/9E6GobZ5cviLvso7Tjt6Kjd8d81w+AGkl
	Ihnj+CXG9cQ0Za+kPcc+N5NVPPd+zafuNbfqf6NqgtTAG0msJb12XAlziuNnxTcCudWkr6AROlq
	6tjXkgMeODfRPSb5r3QW2HKf+y6wBGuYkytaGDKndxvBfJ7iV0kOCS0IgoO1HJuNax+p9jXnK13
	b9O/cSwLmFsJJkp4noGsX6KrdtvJ14igVAKMDwfLACfc9N2ycJ1pleTkpPJDmEvdY9hv6VEXKzV
	VvX5VGko4H3D89ZT2WbAsI1/za3H3mhkJZLjmN95QzZW7TkvK7UQE09pxe2EHmuxottPLDZRvVT
	Y7OQhgK7i74qfeWmvzTRcMwptviaNb2dkn/cPih3nnHQjhomcIyDnivXw9xq05GLtEBmppKv8OV
	Qam3IXjLC1La+H0uy/+g5fHybdyGjCd3oB72/Sr6y80KLSeC8=
X-Received: by 2002:a05:690c:6811:b0:79a:60f6:c5ed with SMTP id 00721157ae682-7bced8dc69amr3564447b3.6.1777312744138;
        Mon, 27 Apr 2026 10:59:04 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:27 +0300
Subject: [PATCH RFC v3 05/11] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-msm8939-venus-rfc-v3-5-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
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

