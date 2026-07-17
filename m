Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CC33F8ECA
	for <phone-devel@vger.kernel.org>; Fri, 17 Jul 2026 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294434; cv=none; b=iVhMwFIkk9gktc/dQn+UptaBL8D89DbG1D0ozUsRm7T/Vx7+gBKUlwi4G0aqrD019TPH6XWkgcIOaV9lVc0Zo1eT+JvVRkTcIWh0kR580BzryOOiScH7Dy6bJZ+B0N1n5BUpFRqEo079BrE083hV+30luz8e9QGDpSz+2QtnlpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294434; c=relaxed/simple;
	bh=4tg7Tw9YFwtuTaNFXfaHJYmypQcA98LC9ovUCSBOML8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhL+mJ918RIkud/tluUobgyd9fRewrOSudnnZVMKOyE3Mf6fNSh7VmYm3FyaYC0G68xzWneF/QTQif7GCLkqukr031iu5anhkWfsKGdIl/0XOy2y6zitoi/MzaJ6E9ARTJIL2DnkKpqudAX06XGKC5LVQ5MNf1rTXzdtiBFeLvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mFCWzBiP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mFCWzBiP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b966dd74so31873505e9.3
        for <phone-devel@vger.kernel.org>; Fri, 17 Jul 2026 06:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784294430; x=1784899230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hw/Yv8W0bG7wwTURy/Xky2RJZ2FwJjbfAnGBUOVKvuM=;
        b=mFCWzBiPH+/ufK2FUBdbJZ/hY2APpxUtA2lKFZjSYXWH3HI+30svivl/52lqjcNpxT
         27N/GuCIQd2RiQ+KwuU1B2hWzIYq9auWvAbAyqvGs2zznOjFgThSuz6f4eJMGigCCEeG
         lc1xIMff5LWPmmzOeSU7FiBP4kTJZMMMcfsX44WgLvIhKWCbyp3zMxgwop11Fs50Ra3o
         Rz2W6kuCNnH+u+zYxXX64Gynwf/eAn3JzUbs6QB7kfEhdxGEXnOUjrYSrBWOFgX9GC6f
         qq5cKIq6lwfufl35Xv9inRM9IqCpoH1QbKSMHmzN/ef+0JzaeMUWIjEd9ZBzx+iToyFV
         bL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294430; x=1784899230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hw/Yv8W0bG7wwTURy/Xky2RJZ2FwJjbfAnGBUOVKvuM=;
        b=me2hK27ss2By08dJ3AiTUStlwFoDl3amMyxnnUyQ/vp6XOSIX1nVCgt1K9HQEwd4pQ
         ZRwmjlAVL4lWb+mLPDgc5I7C5Ae97OsB7n/ErWPS8MC2Xd8DrPHkjMl0C5DiiznEGu3n
         50ykAHt7+qKKXMedj5tyX4vtfAAucMftAAmibjQAHRI5A3or11mxDYquB0KNy1WzV48w
         lPJlOzylLjc/qQZGMzoyscn71ukXj+hvEh9B6MYrwfUFSUsslhQi3jwLkjCMwegOfctq
         /51dJyUt4e55jHzuBdfjud8aNw/wqC5NCwZ1AcBZVEIyoIkvkH+N8KMjVQinvp+PZAlu
         EHZw==
X-Forwarded-Encrypted: i=1; AHgh+RozPvuiH4xzNrA6bJvNsPhz1XUlUpXbd38JCbtLPfhoOqFhrjZpIRt8hFjlzSFyCGh6QdqJUJtCCt2KeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDeGFemZ7qfDHfTgmFQyD3qkShSpnTFRbUJy3C/yOVMTJocr4y
	AiAdlwPjWcCMtaEdsfz/keQvQcZL+gWhYl2oCcLYcd0CfNkNg/QXB0iZZuWgRmgOLQc=
X-Gm-Gg: AfdE7cnjj5tjkZgPi1TaIQ/K7+wo5KvCXOCJsi0su0pBXdQVrI3lqD7sJeOwlNHEk3G
	1hprWm61z2JFanq1vcpBtJsa4FI8dwZRMB9rtCx8lOJ8WP888y4Ygtr9Qug+L9V3nie0eEZ7C2u
	7bywcsyc5aP3kbe8EX2VHQjyM0vVf9whZxynxwsjbceE8xUwt5TZytGRnvwPBAPv3s3MEFI9H1x
	UiJfABCHi4AuwRj+jvqrwZGYWs904IW8NwiKjS2kTTY9nyWaQFQiZzBYVzf2zpJrf8+LpOXrzfG
	FQJp493ov9wHbbe1dUkNBV6rw8M+GLHF+L8fW8IN9DZqodouaxrsbPEasohgVJD0JZoROGpW6xf
	onWRgTi2Ip6K5OdxE1r/A7n8gq1F+U/BkQbbiuzBjIGuD/1kr/3WfIU+/vXaTb1jtrBZUvcCf4T
	JCnWiB6G/sQQCEEWc=
X-Received: by 2002:a05:600c:5943:b0:493:c4e1:40a6 with SMTP id 5b1f17b1804b1-4954a514619mr20541645e9.32.1784294430288;
        Fri, 17 Jul 2026 06:20:30 -0700 (PDT)
Received: from [172.18.170.139] ([185.104.138.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954ba2abd0sm28220295e9.15.2026.07.17.06.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:20:30 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Jul 2026 15:19:34 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine:
 Use common pinctrl
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-kodiak-cam-mclk-v2-3-04451f1374bd@fairphone.com>
References: <20260717-kodiak-cam-mclk-v2-0-04451f1374bd@fairphone.com>
In-Reply-To: <20260717-kodiak-cam-mclk-v2-0-04451f1374bd@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784294383; l=1451;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4tg7Tw9YFwtuTaNFXfaHJYmypQcA98LC9ovUCSBOML8=;
 b=jn/P0MbHPLHJEwkXoOznJmDcj62GIY+xc3oyTXDgT6bxcM6l0FG4aHB4MlI4ZJHIuVm01DwUG
 UricQafvBmjDhgy2FIMwjTYFK54nEngYu9Pm3CFo6fsT1tqQfMTaNZG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since there's already a define for gpio67 (mclk3) in kodiak.dtsi, use
that instead of defining an extra pinctrl state. Also rename the suspend
state to match naming.

No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso     | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
index b9e4a5214f70..aceafea45343 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
@@ -51,8 +51,8 @@ camera@1a {
 
 		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default", "suspend";
-		pinctrl-0 = <&cam2_default>;
-		pinctrl-1 = <&cam2_suspend>;
+		pinctrl-0 = <&cam_mclk3_default>;
+		pinctrl-1 = <&cam_mclk3_suspend>;
 
 		clocks = <&camcc CAM_CC_MCLK3_CLK>;
 		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
@@ -73,14 +73,7 @@ imx577_ep: endpoint {
 };
 
 &tlmm {
-	cam2_default: cam2-default-state {
-		pins = "gpio67";
-		function = "cam_mclk";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	cam2_suspend: cam2-suspend-state {
+	cam_mclk3_suspend: cam-mclk3-suspend-state {
 		pins = "gpio67";
 		function = "cam_mclk";
 		drive-strength = <2>;

-- 
2.55.0

