Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E398A22F77B
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 04:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759711; cv=none; b=dIv+s/p4QstupFYWyFRlALb6dGf1pPM4uKE+rR5v5R2NLnV9/hOIZXoH4cr4B6C+1pIx852cV/xGVaIFqo60zzMCoWKjTVkC1aYwLvPpsbEzBRidNXzsvqhO/D8WHYbCP+xmKW2ecgn69ZT11Py5FHajzn/d6WSOQftwJ0n8VZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759711; c=relaxed/simple;
	bh=mrDnR0G7mbNJho3HlF5gQvzhoEN14/C2UquKRdZ6H1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JhgvBa6hSoBq+sCbAe4S/vsjf+d/sGMK2TdztXn2OfOBQttytZanUqMBPAq8Z9T1UlDnQTmvcLALxSU2+mKuub45AYKHjlobIgxTR6UmrtPdksr7bzljlIXU4Nn4eV7Bwzct5iOpYJlOpYHZD8xso+EqlZo5xPxgFP6fm2gIK6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiSFP0Nh; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiSFP0Nh"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so2398013a12.3
        for <phone-devel@vger.kernel.org>; Sat, 28 Mar 2026 21:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759709; x=1775364509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X72F+IYkq8vmJ6nRPI8ppD04puTmgdxZkpkri1mXXzg=;
        b=SiSFP0NhBAJmtHnRK2BBtz3Go07NRQ13nWKVqMWzf16AJC/Z0DSvJAbFA0DXqed1LQ
         o0OjDbJFjinHM6gFTxGD5d7FxHXM2q3dsk0Ze21Ba2RoNG1xuyHfyS27f71iBfgAeFDa
         +gNwIbtZ1ONfXllgQRStXkxJvDU86ABwXNK+iENAUl7ybpVAW45yiscaJaJwu3VIK0zp
         cPaZJOYKXzm+omic4bL3rxD/7TxFrNHqtll9zsubjqn70t6BcQYMPJ0gPo0MP0KFafSM
         3C+q4GtoTYJOBAqLA481D3PoaBsOOI1JWarW10RSdvjgzLtdhCicR19mxKW1JpzZKfHW
         v9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759709; x=1775364509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X72F+IYkq8vmJ6nRPI8ppD04puTmgdxZkpkri1mXXzg=;
        b=orFbBY5NN53MI+TTMKqZxezWI4OHhaPSBS7jjZfk6sQDiz1dkN3Q7PpoFo9tXbPdeo
         TFo3Hg3zQUCqtMC+k/s16GgV8RmpGC6MKDkRlcNJmQQ7RCYyAW4pgG46kAgEpS3q60/Q
         +k8cdvvjoc13gNjduO3N4qa9ArpEv2pvtDjGT+D+6ypwGnokS075FvGh7VdVZ0iPT4zu
         zKSRZonNqFtEs2eCaI/m8KjiG6uc+++KWqwa0CJ8lFCQH2yRFQEZxbtiRkZK3cLuUcqn
         jwYUL3Y+xBS3scI7yi0HzVkn+CJuIfikcIezEybWOmxEJvl/axDY+zAhFViqF8DOGFnt
         WwwA==
X-Forwarded-Encrypted: i=1; AJvYcCV+cP48LSylunL11ArwL4SAOqt57Dmgs3sWUgQMWz/XMqBsAJPRg6Cw4f9FtjxfFZjIKZHDVp1p6IqTBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/0YDWY9so86T2AU07KwYBLgixnMw9ECWPMp5xUqBVw5JB9vb
	pabFM38gDuBhF5oKWawg7nx1US7/FdAqeBRo4xgWog9VlmVlq5T3xYfC
X-Gm-Gg: ATEYQzz8kSwKBzPMkZgwlmEPJmq9hVYWZkvIFA1rToyxVsneCaSizALEeujVVnMYJAz
	/9bsm4Bos5lIJh1WY3v1ETdMzjrUY+T6bwfgoGqqtidDva9eYVxD66mqxBxHyTqk/jG/IJtVEYI
	2WrdUW52elrUboadLvRnwumNxHlT0/iHa3rRcxaQ8uyelSkjmCHSIdBmq3AiTvjxHcOw5FB2kx3
	PHC/F6yZZbG2hxEOmbupkgbcA0yxoAQ1Z/GvfBz85r1epcJymeK8lR8qfT3kMWbLL5uID+QPrk1
	Oysp7XT2k3LO8RmAc0hn+FjlhQI95asJXaoZih4j906OCDwXvED6/X/BMFv97wVjeYCt8wcnqKo
	xyG/XtwM+FKgBDfKXdm5pwxMAgpxLaS2tXdR3QM6C4aABzTjWrmWb5N+k8UvrsIgQ//gSpSqmrF
	rc9lOg8LjQfg3Vjk0Ll2b5l5Aq8DAY
X-Received: by 2002:a05:6a20:9188:b0:394:6344:e5c4 with SMTP id adf61e73a8af0-39c877ea332mr8300548637.3.1774759709300;
        Sat, 28 Mar 2026 21:48:29 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:29 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:47:58 +0000
Subject: [PATCH v2 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-3-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1039;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=mrDnR0G7mbNJho3HlF5gQvzhoEN14/C2UquKRdZ6H1k=;
 b=ph9fTagfBVXtK331HF7XaRKTIzItjVo85alsUFGqPrhIYNQAXctTJbC9AbxZpAXzv901QbdE4
 v03zR55ULznCzUwTjppN1GV1PAgNPMg6p+EkNIgfHXbZXAuTkgnD9xj
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Enable the vibrator on the PMI632 which is used on this phone.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc3028..88691f1fa3a1 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "sm6125.dtsi"
 #include "pm6125.dtsi"
+#include "pmi632.dtsi"
 
 /delete-node/ &adsp_pil_mem;
 /delete-node/ &cont_splash_mem;
@@ -115,6 +116,10 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_vib {
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.53.0

