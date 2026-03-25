Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E4441C2F1
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 18:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462077; cv=none; b=rAVyoE9U45xbt5na8xUKvXpn8KRF9YK2N5Umz6bUN4b6CIO8zHt8V0Y+b3+/rq/Ks8nf5OM9freyGL0q4NRj3VWstlmPqIz8HvhiwAVYZpicTMmpwZ/YLh5jF4q+vY3iI2LIi+7p8ZTREItBVtfrSsaAfQnlXwGK2l0aP29wQJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462077; c=relaxed/simple;
	bh=4jcpeoXLPiOxiHalfAjuvYT2yGFc2c9p3Rs4rW0U/Ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oo9aeJ8xKmaxPklO+u8w7jVlggx9Pu1gJYe2+/Y1iDs/3+mrRdrd/Eif5ithff5BAuYBA0RvN+eY15PNURbQOPiTaUkWiUggpRpGvIn/yj9BtySRfzR3uHwXwP0/KJiuUss6TMUhtg0vh8+Q49NOvdb+Uf875oYglQB9DSUqTRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rg3CnNqC; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rg3CnNqC"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2aaf43014d0so690265ad.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 11:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462074; x=1775066874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+mOTnwT88rG+TLvmnzsj95Rl2YZE5vhiJFWZaB3EQE=;
        b=rg3CnNqCqo4TbLmH4nqVWi+2sac5TNqWk4+rZBu2G6KqgZOFXDwFbY0X38X3PuYl8T
         CTyM4j6rtsquyshphPvMIyDXjIsSg762Z8dZr7SSYwTtD06o2ioRivA+zqnpHrZxmo2T
         NhEt5JqtxyCVzDppAVYkzjonaBgYZNvW83GFdauYFDiCBSG8veHHscuMbEnN7nun6bcW
         C3iO2bgwZvZKvNAvYdsjc0EJBvXAaB/hlQLl7x1t7dlEBcfg9/tPMuT1qmhKyPIvuDfj
         gBGwB+ph4DgBWaH3nJFS1p5EMoLeZoUsJfanE10D2GhiCUVxgk8PQtJPiQ3YSP/mtnom
         IwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462074; x=1775066874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A+mOTnwT88rG+TLvmnzsj95Rl2YZE5vhiJFWZaB3EQE=;
        b=KfBcUBpe4LCfrwZJRpWvGGAV0gXxyUEn+5cc2fzdKUiXspDWWtVxcCgGexOGfN5Wt0
         5gXgivd2wt2NrDc3iEBsa+/vxaYI9qQG5Qk562ZNNv724dKelVZinLR9vJkPB4uA5Kj4
         EkrwVmU/Mt5O86DQcEXb7knu12Cg72SnMyFJmHx02gWpCqfvOCR8MIjV1igqGEUIi2yk
         YPTN3+IyTVwhyoZSZeUofAyjr0Iuy8yyLQO6WudHDaSOO2bX5n10SAYvhxMEuZz4nGFS
         WI8Rt3fH5lzw0HFfEquFjfy5ThXYrm9EUhMsaAXsKKQhdY5866++94CvgOGxbk0AWNOV
         BTwA==
X-Forwarded-Encrypted: i=1; AJvYcCUxKhYSYsRxS3LAmuZ9ATTg8XIYZxBqefi2iHTyLRW7EvLwBfkEI7D4uYflqgkrlMYiKNZpozlEtWjDFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX/WEqAZeUqmc9RK4PjEI+l4PpKmC3PISrUld/Dq5Y8gk6AAbl
	d6w+DrLYWqN2DizSsj4Z36OggKbkiEuEPcd1T64UleUEG68tsmj/H3DF
X-Gm-Gg: ATEYQzzVJE9Jee/fvEzJxg+JN+xKzyJd9MTbcSvL4XUAQGL6G3JWiLO+kCxDjz8+8U5
	soAlIB4DDuiT+s6ZLxbozYU1xkGjjaMC89ha9Yc+u+/uJbrlfCx3PeYm5G2R6RbYP+JJQCFZUhd
	uoBCRJdd6TByCVcDoNlSqmbxLKYrdxm7pGhyHncFOM6sMr8iwLzdWeY/lphLqJIPe7UieYMPunp
	3mFKRh9HSplC9zoitADXT1jh8fmXaLif9sJV/QHaY0ePLGnnA7jc7gxYje09AAWXdhbgquAI4kC
	cWvEx5Zdc9K66eyVwsP6u5ck1DcyUsxbI+R2lJx0Y8g13ori5lQP8bHbHUu8axsPIPMCeyQphYS
	8gLaQBMU0Hm0fEQHCns30PIiI8a82s38asH5gbjp6jD8hjDBcO6NThEjVwXG6nBMi2+y+6Jzxk1
	OhlV384pJOuzIdch8Oiwy0dp6u2z+O
X-Received: by 2002:a17:902:ea0e:b0:2b0:afad:7ab8 with SMTP id d9443c01a7336-2b0b0ad2382mr51898775ad.29.1774462073914;
        Wed, 25 Mar 2026 11:07:53 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:53 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:26 +0000
Subject: [PATCH 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-3-446c6e865ad6@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=1268;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=4jcpeoXLPiOxiHalfAjuvYT2yGFc2c9p3Rs4rW0U/Ds=;
 b=Rb1tdZWGQx6hFZr4eESwpKU4K5eOaB1lL5/HKB0tRnFVmA0mXAdsiwXnXAu3WdUAlnwWvnqE+
 PNBv5qA8IpBBPJQtzrzD1uIjANQwg3/048MKk8LX+Hya2EFjYmmWf17
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The USB-C port is used for powering external devices and transfer
data from/to them.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 88691f1fa3a..f66ff5f7693 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -116,6 +116,33 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		port {
+			pmi632_hs_in: endpoint {
+				remote-endpoint = <&usb_dwc3_hs>;
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1000000>;
+	status = "okay";
+};
+
 &pmi632_vib {
 	status = "okay";
 };
@@ -316,3 +343,7 @@ &uart4 {
 &usb3 {
 	status = "okay";
 };
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};

-- 
2.53.0

