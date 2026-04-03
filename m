Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B2B390989
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224528; cv=none; b=MKmBpUE4i5WsGKPSQT9xe2730DZMKvBzVslWMV6o4rWH4vpeu+KD+YTrLwefH/6tJri1zJTCHeP9FlraVRqaKF6mCZMMefcvfSOOb3seshjk7h7AQGVQ6YyO4yi1FJCdaFrfPgti1OgNe9lFWWIfltnlriWZ2h/0eTw2tNtbxgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224528; c=relaxed/simple;
	bh=Laagl1WvmKQiKODwRM094nhY7LnQG8oBc9UyZ9+RHgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WWdH/d7W4baNkkKa42dHEYrEWRTA/0gPOP7WjXy15JrGsMuEoDgQsCI6uOlm6kNbY+etv+/Sp07H5K0OSLVnuYo4UUHSItscwLURa37fr+o27o19ceVBY25F4ykuB+DvHqUUUXHq2Vrx5Io9CBwtMRG/dGVjWbEJWVoV1ifvZXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uiiEeTs5; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uiiEeTs5"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso4124041a12.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 06:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224521; x=1775829321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1YCa6QIo9PeY+05m/sjhH3PUg81ljbhDyFPKMlTXyw=;
        b=uiiEeTs5YPL1xzsMNn93RhdNKRlOdfSlZ0vc6opd3J2dqbPonRHAIR5CM9UlaE0Coy
         sPlG7rRiH5D+2dTFKSMo47XZskYHG3xa1EGWBv9rA2bE6+jwzwWcxOZOtSJgAuR36ROC
         ta0RejydEDLcpusmRSgJjATdWM88lKfEvdh/z0ilj+RZ/oRMM1dSyGs/u/Ev9RezXjou
         6SPG+BStWNAhW1zE/ulOoRiLXnIKTq0PdSuUtIOFBnWlg/qybwwkP5qgphoCpquKCv7q
         fKaWoww1GxHA37HyDknA6E6A5iQ/BfipLpgfuR++bf7lJ9TviLDAo740pNtewoIDbvBu
         sCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224521; x=1775829321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q1YCa6QIo9PeY+05m/sjhH3PUg81ljbhDyFPKMlTXyw=;
        b=HXpfRdVOzEaeAliM33iNdU2vqBIkbtZxo4Z6CIecxUSIl214zwvuwJIepQTsTmDqDV
         9QVkTf3UDb1yaq/eGAxwLKCqAccXmyVjWP/+vfX6EZSTCrrnapU0ydi2KhcfDP/T5JQY
         63Xv0SND9aFeoAjdu4NqO5VlbJEqNP8DFY6ulbvcHJi55zWzp4TlNbD+spdOWbZ9V7sO
         tnDavosllWEECnd6GOD+LQgz4mv1lFmBzpxcq8v/TwYKTwWwalf70++gHOTLNlyTsVep
         CDWUT1Lq0xSHSdU8VLG1Tqepx1+g08ZhA+dnkLkCZ+AkNzOFn2f4/emzKAbgMEEMkY/r
         l07g==
X-Forwarded-Encrypted: i=1; AJvYcCV1ae1dSTTQue83gJUZMdtFAzDt5hC8pKyQHbEJ2PElO+XYn+ylHBtTUrhMZhxN5lBmzXwf6CcDafNngw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT8v5Ru7CzqeuxdYR2IczUIS5JGE2rYm04ss9bO2FeFOw2/4mj
	QjZhd+1kH/RLXjZhO7Iy5rIrnkpVJM08vZhvUelQ2dAwIWpVCKWHDHSzxt7SGQZMi5Y=
X-Gm-Gg: AeBDievdkGJHbtkCrp6honBQ7IHDe8nHsqSB8HujYtdfN23aQnX6gN/U8FxZFJZBJcR
	oMsMvslX58OpW+9vlNC324jxToI2hDIJLBLBq/cRSUj6QObiFQ0pFTSg2ZMQbL8AXt2RVBTwihR
	P+cCn8JCG5ACVstm074Brc5p4JUFL2M+gxEVbLQR1h02ZcN8GIOTo/OySY0xz7Ad8fjTtJDRTM8
	/2i+QXggLNz7iM1uXjau+TEoY9ihhEgM8FRE3Owmcn7bGqqocqRoU+RwvzFSRVEASz5BAnhA/wi
	66/mF7TnXPnSiKNBic4R1hzZQIeyMcmKcPWNDO6TfRSNlkfmNzfMqL4BWmKoPvsu+Jc7UFV/2/+
	OkUjnB/YAcRfVfD+5UR29y1WkdPauouNok9DafWMZemdjE7CZSqXcVcL+B54tOA1hKEYoE6bWtO
	jK8jtn1w1e/q0XXEw9S/y++h5v1/99tRI0W8g1qd77ZzbI8DgrIdG44rdlcFkbwF09hl9zSW2rD
	6KI8bqLRuUdyxJvK6c4vyiBPI7yR3q5R6hTzJ5X6DXCGIiE
X-Received: by 2002:a17:906:ee83:b0:b99:86b6:85fd with SMTP id a640c23a62f3a-b9c65596fdbmr158557066b.9.1775224521403;
        Fri, 03 Apr 2026 06:55:21 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:51 +0200
Subject: [PATCH v2 5/7] arm64: dts: qcom: milos: Add WCN6755 WiFi node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-5-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=2562;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Laagl1WvmKQiKODwRM094nhY7LnQG8oBc9UyZ9+RHgI=;
 b=5dJnjoMOmNyoMHrWYuV+T1fDHL+fKjWcd2iksZsGpFY5KgrcxW85fMrGe1suXpl/g2g53QTu/
 2BtMLr3WqRnAYp8oduhNM5XgqDpI+uMmoQqYThDMSgKypx2bIP832X6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the WCN6755 WiFi found with the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 71292dfd6e08..3a3d7f2134e8 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2438,6 +2438,52 @@ gic_its: msi-controller@17140000 {
 			};
 		};
 
+		wifi: wifi@17110040 {
+			compatible = "qcom,wcn6755-wifi", "qcom,wcn6750-wifi";
+			reg = <0x0 0x17110040 0x0 0x0>;
+
+			iommus = <&apps_smmu 0x1400 0x1>;
+
+			interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING 0>;
+
+			qcom,rproc = <&remoteproc_wpss>;
+			qcom,smem-states = <&smp2p_wlan_out 0>;
+			qcom,smem-state-names = "wlan-smp2p-out";
+
+			status = "disabled";
+		};
+
 		timer@17420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17420000 0x0 0x1000>;

-- 
2.53.0

