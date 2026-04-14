Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107693242B8
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 19:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196464; cv=none; b=HJnkgx6TScH/NfX1vzNTrp/G2PGkks1ZQJnAoIHLWkkkR5X0TvjZgtXrR8PU747l0hhf1DamNUcievgdFbkUU7B6GCC/1oX1xc37UhwuAVw0vejbAEXIoKU8TJH5GHWQGRhDExMb9uc4cbDZD4KSObLkXGdAu2jb32TQDhOpZI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196464; c=relaxed/simple;
	bh=LSn3UpWfwQWxClYk23NT48+QAIlnEKcXKy1WIK6ir8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WnE4z01iEFvkgUSOs4k70RSIvLbBVYlyulte0gaR+72ZYTu9j22DfAaQQ/DtcVe8F7j++ygBKAAr88ZLV+C/jmlHhz24DLNwnacWzx4GEbHZsdiae9RC3kjwXjabnnYM28l26yuRlX+cGypNvEJQFwV5WdivT78OkZT4DjRSPQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCtH/v26; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCtH/v26"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cf7683a28so4093248f8f.2
        for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196458; x=1776801258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rx6Gs/k39gM6qSQMBZbg940nHO3jpX+P2ASmGy0OCbE=;
        b=sCtH/v26SF3aRH3wg4yn/Z9l7W7XTfUo9sWilkhoe0nF8pdzyOiOE42lhDEGjwcT6D
         IGSkXKkkRriIKMKZ/iSlZx7RCZreZqcO7LUv6JFc26vmZTU85afvrzWBuVXbK0PmrT30
         RCRUTWDsjHm/GRo70ERW0TtHfron+pGGZC+EHQU3W+S4ZIbzs365m4JQStyI7cSRS3GL
         4A/Wt6ITLEWHX8Ljk9Vcd7/IPpwPydRz8UkV0GqCQuHv4RvH/eqnwYvjivW+jftCF75M
         u3uJT7+sKeRVjKvOwaR+whSTXCkWxUB2DnApn6VPlbf2GkkdTbRIEBWJ7qHhmmHBoj1z
         EweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196458; x=1776801258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rx6Gs/k39gM6qSQMBZbg940nHO3jpX+P2ASmGy0OCbE=;
        b=DAp51x19s89KpP0/zxZ0wqHd2qM6Y99Y8iqpT669gQscql1HbycbGSx9bIuy8WzMvn
         mvezekkrF+LkhEsdUV7orr/KbBcKweenlFtSXLej9ycdxH7P/nAJ18jdxPpRCS1ouc1K
         gjz1yW66jcwuJ3rGF+vpYlfiY8t1cF1BKWrOf8zGrsqOOYuX7WwWBcxoJoEDt4Nhw1m/
         EF/aIwlptr60q+6m7LEFYvCjvGIfAEg5mULJeQfJ3ptIlXomwF784PpB1+Ktk2zF2KKG
         usVl6/cQPNZUq7lil/1wgH742dlDTDuuN63fFAouqztuN6sdSUClfmrL0iLjvcU4hLxk
         ywIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HSlrev7zMvTGZlB8wLts6rnQAv82gmE4qOjgDOZP1DgQvYBz3/72Hy/Qw4PNgpqvc8houU9XgfmsLVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUJF76uQn66778nETqA7Iq4YxMEkjqexDcdd039U5JxxzsUIqp
	qWw9AXVlN5x2ePH040YOFRTooATOGrJRKx5WPJEoFFZ5VNjAUgUIfRUZ
X-Gm-Gg: AeBDiet6bq4dGZzhuvuFk9hwbpwq1LlCvP0gD7LOQ0HdmGG/DhEbIR0LuHXZoaxTCyg
	iOh6+Mxa7dDSl8wFh4OW1UuynvS61GTbC2qESm5dHm1/YpfDNLWHc6eLUQTREpm+Cgu0HOFFpFV
	U93Q+5/GcIy2qvxcARS4qCE/KQaoKDtdMjKHHXEfbJJrKsatdJT3HsIGMnhMpug4waGW63XMjV2
	FIjL5K7mYdnNnxX+DT41sqyO9LAzhc+1FLCURx8Ojpbnv/bra1dWThmp9j2gqAn1Dhvx0GSblxo
	xXeHWPh215+U715jEk7DHCX2vIoat0bb7JCgICMWD0eZNOjP1I5llyOrnE7UAjvHqwx4ZjsyNE0
	Vrf/jskMWwsFE7+M9MlWAr5hLPrN1Eo0EGGuzaPQBYNK635YmwVRd9LJPZHwxFF7m7t0ZxobJ+/
	Ptmey4O0evSITjQvsMd1LGEGFfeTI+I4IB1I4VSGi+7TKlWKhgwiQ5BPv4YifmrTmhDQ5B8KX+T
	XN0JyGwcPiYr1ZiuNDndgI=
X-Received: by 2002:a05:6000:2211:b0:43c:fd92:f432 with SMTP id ffacd0b85a97d-43d6425968amr29336493f8f.2.1776196458135;
        Tue, 14 Apr 2026 12:54:18 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:17 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 14 Apr 2026 21:51:53 +0200
Subject: [PATCH 4/4] arm64: dts: marvell: mmp: pxa1908: Add reset cells
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-pxa1908-clk-reset-v1-4-94bae5f3a8cf@dujemihanovic.xyz>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
In-Reply-To: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4013;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=kl4so4YGhRFTk6k5KZvqqawzD5p7cMzaSqktF31UoyA=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU68sktuSvCp0Ohk9bsnNbry6xribDI2aM+cl2Pgp
 3nYbqp/RykLgxgXg6yYIgvzUrlLfKnhEx2KbJNg5rAygQxh4OIUgInwVjIyrF5ZvTbw2TfG8PI7
 h5onnri4Yu+G38v4S0qOBslK/zY6xcbwP+kd5y0Wl+rbMmeufLL9vP7LaeFZmddqyiocpaIVbuq
 /ZQEA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add the newly implemented reset cells to the SoC dtsi.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index 5778bfdb8567..05b56a759e27 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -132,6 +132,7 @@ twsi1: i2c@10800 {
 				reg = <0x10800 0x64>;
 				interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_TWSI1>;
+				resets = <&apbc PXA1908_CLK_TWSI1>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
@@ -143,6 +144,7 @@ twsi0: i2c@11000 {
 				reg = <0x11000 0x64>;
 				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_TWSI0>;
+				resets = <&apbc PXA1908_CLK_TWSI0>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
@@ -154,6 +156,7 @@ twsi3: i2c@13800 {
 				reg = <0x13800 0x64>;
 				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_TWSI3>;
+				resets = <&apbc PXA1908_CLK_TWSI3>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
@@ -162,6 +165,7 @@ apbc: clock-controller@15000 {
 				compatible = "marvell,pxa1908-apbc";
 				reg = <0x15000 0x1000>;
 				#clock-cells = <1>;
+				#reset-cells = <1>;
 			};
 
 			uart0: serial@17000 {
@@ -169,6 +173,7 @@ uart0: serial@17000 {
 				reg = <0x17000 0x1000>;
 				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_UART0>;
+				resets = <&apbc PXA1908_CLK_UART0>;
 				reg-shift = <2>;
 			};
 
@@ -177,6 +182,7 @@ uart1: serial@18000 {
 				reg = <0x18000 0x1000>;
 				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbc PXA1908_CLK_UART1>;
+				resets = <&apbc PXA1908_CLK_UART1>;
 				reg-shift = <2>;
 			};
 
@@ -188,6 +194,7 @@ gpio: gpio@19000 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				clocks = <&apbc PXA1908_CLK_GPIO>;
+				resets = <&apbc PXA1908_CLK_GPIO>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "gpio_mux";
 				interrupt-controller;
@@ -215,6 +222,7 @@ pwm0: pwm@1a000 {
 				compatible = "marvell,pxa250-pwm";
 				reg = <0x1a000 0x10>;
 				clocks = <&apbc PXA1908_CLK_PWM0>;
+				resets = <&apbc PXA1908_CLK_PWM0>;
 				#pwm-cells = <1>;
 				status = "disabled";
 			};
@@ -223,6 +231,7 @@ pwm1: pwm@1a400 {
 				compatible = "marvell,pxa250-pwm";
 				reg = <0x1a400 0x10>;
 				clocks = <&apbc PXA1908_CLK_PWM1>;
+				resets = <&apbc PXA1908_CLK_PWM1>;
 				#pwm-cells = <1>;
 				status = "disabled";
 			};
@@ -231,6 +240,7 @@ pwm2: pwm@1a800 {
 				compatible = "marvell,pxa250-pwm";
 				reg = <0x1a800 0x10>;
 				clocks = <&apbc PXA1908_CLK_PWM2>;
+				resets = <&apbc PXA1908_CLK_PWM2>;
 				#pwm-cells = <1>;
 				status = "disabled";
 			};
@@ -239,6 +249,7 @@ pwm3: pwm@1ac00 {
 				compatible = "marvell,pxa250-pwm";
 				reg = <0x1ac00 0x10>;
 				clocks = <&apbc PXA1908_CLK_PWM3>;
+				resets = <&apbc PXA1908_CLK_PWM3>;
 				#pwm-cells = <1>;
 				status = "disabled";
 			};
@@ -261,6 +272,7 @@ uart2: serial@36000 {
 				reg = <0x36000 0x1000>;
 				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbcp PXA1908_CLK_UART2>;
+				resets = <&apbcp PXA1908_CLK_UART2>;
 				reg-shift = <2>;
 			};
 
@@ -271,6 +283,7 @@ twsi2: i2c@37000 {
 				reg = <0x37000 0x64>;
 				interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&apbcp PXA1908_CLK_TWSI2>;
+				resets = <&apbcp PXA1908_CLK_TWSI2>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
@@ -279,6 +292,7 @@ apbcp: clock-controller@3b000 {
 				compatible = "marvell,pxa1908-apbcp";
 				reg = <0x3b000 0x1000>;
 				#clock-cells = <1>;
+				#reset-cells = <1>;
 			};
 
 			mpmu: clock-controller@50000 {

-- 
2.53.0

