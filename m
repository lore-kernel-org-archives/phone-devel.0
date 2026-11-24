Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485430;
	b=Un50+L53T0EV24WGjSeCsiz9t5l7fX+O2yg6CTGrvQGoGfRbd1wBi3vl1b3RjupyRZwK
	 8mCd9QeWijXZgKiUBw4FYKaXftzykGU3rKcrGWCJQtJY9plzFjz/xTBghtjYI3l4AcFlB
	 2PnMKygEKYex4JBflggx3+oJLuNOO2U/8qhgZh7BVCrJJMIlegqc1p6ctAyDZLeaAnDCJ
	 uBkS0oSg9eq2A++9fjdwyjSVR9HBFXiGnC9w8bwbHzAvsT2D4ZfjtbG45XmUMICuWPkTv
	 zqmLvtXquoJp6sl4mAShBE5Sg/FR8Jr1MjnMKU+9JvG7qfJZeP8/lbkmOv+G87MMzjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xabHsePonONdwiTfItD6MgwcyoESmGbeuIKIPwB7xTk=;
	b=CsvAhMN6w6HRKNVfxbbzKzwRIg5Zc6BbuVJ1LYjw6FClQEpsWuobQoJb2WXaYFLGpa/U
	 s5YArHiSgloBTUh0jB7NI1feG+AucIGzZW143/6jCj+0JQ3zRPs6gG1c/kbKn/ozgAK1b
	 UQeqTxfR4vGQxQc7bAw6nRPjIwMbbyI4//mYgzAkKBlQymXgnGMLeQjkJGUHcYwjrRqI9
	 WKg3xgrDaIZZELluo9xf/2W3e24W+tzJxKMdMXamnGExNSdUWJN2H+hz8zICzAehiIRcl
	 Iznl5dwh52VpYwGB3qmcJZpLMJYmUERXqilUNpt9usUvItnyyg05wesQA9FpRWMcXMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRi7EmBy;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8402F606A321
	for <phone-devel@vger.kernel.org>; Tue, 24 Nov 2026 01:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8402F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRi7EmBy
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-94961ed97bcso422135385a.1
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 17:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485429; x=1796090229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xabHsePonONdwiTfItD6MgwcyoESmGbeuIKIPwB7xTk=;
        b=tRi7EmByIhgObATe2GhCUv1TEXldNm7csFsBg3QUKYAWyf08f+rm/gIc2r4Ill6JBS
         5cQimg2e0+HXf2MShkwB2vJK4bYC+knCV/6RjTDTLik3iLj8Qc5PqXat78HpQ7u2NaDu
         v4yysu0OgBfsj3rh/Sq4QK6Q/GKrP33rVTcozklXk3kfsGrqhInSt2y/v3JkkYQWwoBs
         OhcOQcNND3TRi7+zq/S7dz4KcDhkTbcTKiC3MyAVsG4xjCgnPhJo0H2SLmBhqlQ52plw
         Z29O/0zZ2gF73f058JTUYATU3c/+MxVam3sVkQZ3jIQQEHrVAGZv4Z2QQnhNKuOk5YVJ
         wO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485429; x=1796090229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xabHsePonONdwiTfItD6MgwcyoESmGbeuIKIPwB7xTk=;
        b=1tkzSl1/SlU66mqzQdVdZoQbP8O8/c369QqvpzJccONGsJuE9Oeyki3x8vkbZmeko/
         TcKuou1iPXxuvdxW7Xaj+pA7EITx0uY/E9wToAhEa+iNEYp8T+4WN4aWWCurpZ1Yc4u3
         N2rNFQA9tGPZ6Ul0DIzNfneNjAbnrzc+dgsRi3/bQe8yo6iFb0y6pFd6U/a21MeMII8j
         fqBRcINI1y/1q+a5lw/NOBzNEvjac4H3LdPGLKCbL86J1ZfuKNwMTFgMi8vnRK6rCWg2
         s08OQ1rp9zoJdagIfekCLbcjnw3xw4oRzi3DPXSx/gg6K1dVQoPNLU5vNNlXSi7D2TVL
         sK7w==
X-Gm-Message-State: APuU4Z9ESwyay3b9CKVjRGm2njm9yfyPuCgkpQ1DefTH4E0BBuBlnfSe
	JgAwgsFESGzs1uVUI2ZLuxqjGpnmgJpRp/ddq0qufnWGgR2bU7+L7qs0
X-Gm-Gg: AZFdTZcedRS3p3y7onuDcwug5CwcT38QpZZS0sn7zis9YCKs+v+l1KVmkjWTqPiI1sc
	KB734PVLfKfVKbxSzWKdWWKw4aPINAXSDzCIyuib/292vjf8/ceM1uANQ3r0lm/q0BiZjT7bui5
	4xJQpaBvztZaRQVpLfKu9WIH/P2Z+iVeDVgGajyBEI4fHufuJrJVcToAL0ystqMNSEyfQqaHQUC
	pDcNLdyqU6JqY9b85lwL3B/LBXISgus8FWZkt0EiX6EH1g6bdjopddYhzdUQSmU/q5iFkAd8Y3q
	WqVpbXaZx6OPgYnMggp4w1CkRzDjOheYEYl+cj9XPXhsqvF+iNFH/NQHDygdeHmL4b//HK6jvaW
	8iEbdAi2RliANMv7FJBGEM36nwtCxhkRSBClt5TYccBNJnDf70/SWnjh2y66CrunDBlrdC5U4NP
	r2jUxaU5XGqTUKTDVEkON0cnzA+C4xy3tcPdTXgnqTR+yPIS2Zho5mY/Jwjd2SYNWrjZxOERA5+
	gG5nSzL+fYSL0eWmmNutzJEzPuXQZ8R5GENJRBe3i+K/DPlN+McJh5ZovzhDwCpxwGEx6uc5Lfw
	A31lRXfzYnL/9a59pnHkwhuhNihI
X-Received: by 2002:a05:620a:601b:b0:949:76ed:591f with SMTP id af79cd13be357-949ba82851fmr2343857285a.8.1795485429482;
        Mon, 23 Nov 2026 17:57:09 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm946256185a.5.2026.11.23.17.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:57:09 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add digital audio codec
Date: Mon, 23 Nov 2026 20:56:10 -0500
Message-ID: <20261124015611.187024-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the digital WCD audio codec to the SDM670 device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index e99183c22208..54d903b89cc1 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -33,6 +34,12 @@ / {
 	chosen { };
 
 	clocks {
+		lpass_cdc_bclk: lpass-cdc-bclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1536000>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -2822,5 +2829,19 @@ data2-pins {
 				};
 			};
 		};
+
+		lpass_codec: audio-codec@62ec0000 {
+			compatible = "qcom,sdm670-wcd-digital-codec",
+				     "qcom,msm8916-wcd-digital-codec";
+			reg = <0 0x62ec0000 0 0x400>;
+
+			clocks = <&lpass_cdc_bclk>,
+				 <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "ahbix-clk", "mclk";
+
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.56.1

