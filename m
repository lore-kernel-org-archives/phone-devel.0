Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B910641C2E5
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462065; cv=none; b=H6JZr7EYRZpTEi3SzKP6JhFWQV0lmLF3XcqZzJbP5cez819xuwBjXWr1iVihTT6ZM6l8jN1r367UJqY2Ybq4u7ZqpbYJj25hSS9sOtMUNqDlP9RVJqPWgEuFFPjsiTEXbboBt6CDYqlvRFOBRVBJetqCxCgrywbqePmBIT+OsTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462065; c=relaxed/simple;
	bh=6OG6ZQbJeltoxnqYdrb7S4/bj6Fp0zUOkvkCuJW35ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lRA2OqrTHIwdCdZbpZdqAL+TEkEXXA1WqP1o/Aot4BfwDUDY/E6sm0Rk+YtUiY3Bz88q6Tc4K63smiQ9rguQ15pGDr9ItNhXhAtu3dL9N/xV4BSBcGkYtg1buIBIbPaapOzPcO7IShyyVoCjcuiZkQkrHOpebC6L4+85BFb/rQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHYIqblN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHYIqblN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b0b0064027so699515ad.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462061; x=1775066861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3LjgTjQB+SlMXVNhHwInhdKxMmJjzyO9kxNTYHklAI=;
        b=tHYIqblNKibm5cLUS1Idiub9GVxPrqxSVVf1YfG+4c3zcQ651oYjnBA4CspMQAM2CW
         6/wfbGv/cBor2JhzvZTzC00XVL2n9GdeYFtcJO6THQunVkKlLCK82tfQpE9fFxMNhCjl
         vB9HT5aenL6QkixQmnbfOU3JEl/mvZzjCLHxyuQOvwy2wuLXFkB+sG7tWoXGr2vrBLSb
         32bnU59RYITv5/wPfN2Gs7LhPc3hko7HexqfRoDmJZy1yDGfPb0DDtv9T0Uoil28y1eE
         CF8imw/m6+yJESFyDc/GiSf03zfewaSiy/MJy5PWsV2wFW1oozWk9KifrFhzv7/KE5e9
         Dvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462061; x=1775066861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3LjgTjQB+SlMXVNhHwInhdKxMmJjzyO9kxNTYHklAI=;
        b=lkUTHHkecETIjUSDwPg94X14CTsHIIBRc1Ae61LN+En9CCGbYPQTfPSZ3cYj81y0j6
         tf8kkueP/1iNGb7LUEtKqQYPZ+JJD99GhKbjKB2GO/hnGTOmCrUiSv9PXl1c7+1iKaAD
         3EZhUVOGZfT9rMUyBR3+rW/aYQctJc424yxM4Kv50ol2vaffewvszCUSJcksSmn5u5uD
         pbA/uwsahMtLjIjalBCP6TuXl3tGXflwUmED5L7s8TZfpMvkW3mKaZ01FXrpMe56a/e+
         82LhhK7rK45qFMfCYLoe16yIJ5eyc3QtrylLCtL8PaNdYwjEE/YJ+dgO0MxoufWcjcBf
         A1Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWrBXWypYjfP1QmOgeNWdwFNkd4SWTOxKe0bHafCjBMsT+HU06opihCjBjDMlwAdYdmMu7Ip21UK2NQ+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxg+9orodIJx6PkbIvvtxt+hcyTXv6Ml1Ln9Lkl+OM46b24qjG
	//3gv9huo4Ad0MG0KWu0KWWooY2RRNd7fYle+OTVPGMBg5qnjFIMJ9ZE
X-Gm-Gg: ATEYQzzozjSE2tUvMQQCOwqku0ywiG2NUls5s4TvouAC17k1kPDd/LKbmb2zdVfFGEO
	o54P5nO5aDO4yli+cobGeCGJmqIEKr50gMJF3FoTGzTCI/ZgC/XL9vxj0aTsIuWENDpG5MKLiK/
	mmiKwhKd3xCYQCQqYFKE4mp14ml5PuR49r3EidvWk4JPrnVf8WIyTWyhn8FfkfDVP5KK5LdxB3B
	fm6z6SYTePw6L6YNT0JA1M+TWJiaCz1Nh0hNMcIpjZkSSxVq0F8iGC7kv1Fj4na1CH684u7dKmO
	wZtnVXG8bPQs4YHq+xonsUchMu/wTGlkE5FqfR6FTwMeDjGCSkPVI0eOKuTkQE2hHFbGYchkcjm
	eV+tbOo4Tj+iXhkJGb5UDswLm+cw2k7Hd2410Mb5HITT2N5CO7U0CPo4yIrH+gziaAl7y09DmuB
	GZt7LVXXQJTEFKiTTRKQ+gL/fBYUwK
X-Received: by 2002:a17:903:2c0c:b0:2b0:60b2:4dc with SMTP id d9443c01a7336-2b0b09cf4e1mr49434745ad.15.1774462061252;
        Wed, 25 Mar 2026 11:07:41 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:40 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:24 +0000
Subject: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=909;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=6OG6ZQbJeltoxnqYdrb7S4/bj6Fp0zUOkvkCuJW35ec=;
 b=/L75YqmElCivRnT3k1uY+DoU66iVUSy3psZfDffVjcwjfbXXx3kMslkg/jC4xSt8hIUlX+8px
 cr1phXGHRqIBjatTcmFRu41sIUd4E18nCR3eVSb9rAUz6oAxWXP1R+a
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Enable the vibrator on the PMI632 which is used on this phone.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc302..88691f1fa3a 100644
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

