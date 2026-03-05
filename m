Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD0B3E3DA2;
	Thu,  5 Mar 2026 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731819; cv=none; b=HXsLs3jO5fwYgM1mzYQp3b4w9U7K1TH2Lj6JM1s/OjnFJukyXWwJ2iIkumt0wd6ilxrvhRb4bf82zhsGjURcU9QCxrZBzocOADxxJ/Vkv0EuhhsyXTJdnriVXZiRNx1GNOy/I8OSRBPVSYY3M+jdFC73tYxc9qddvoW3DWt19kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731819; c=relaxed/simple;
	bh=0mcemN83xVHtkBQJrBJzu8J1lZC9SEdGmJouyqgM8Pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rn+DfFxTu+Mr6rgA98LLIWq+PYNRq1rFJOxn23pTpntlY19zwOqInrJ5aj0GrqhR6CnYAAJp3Rayo5DNQAFcq3celd0KdhwsAZVclKzGbosQVpsGlkcQVr/yU4JCR6fqJT6MXnait1YA984XJefDAgu8LoMK3Le8HrZFBbQYUIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QkY5E70O; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=0uhZrBBG; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QkY5E70O";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="0uhZrBBG"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772731728; bh=hpQkfgW/BOteaJCnyaese3D
	BIE6p1mMyBz6ANIdE5UA=; b=QkY5E70OHwi01dH7HNicSQaVe3ShdEiw4aaQ6LQDJJFhk1NRZz
	lKdmeLbtGo11DtAN1QNIP9You075eokysUyKaCNrelDsefqAkigA5ftAjVqetLIpyheZUWCqje6
	OedyRggc/3zZNXMBqs3aXAUO69o8rUGAKKD744j1ziSPJENWztrxWXaS+yZTBGm9C8z5tmKhb/L
	TAh3kn/1rWvuFMy8FPDohNz686nErkExshxsvXyGffe53jrmWOyjZhPW6E7t19V+2QnP2e4QgHQ
	x3e+n5cRPudtWSqEwCK3uFL/tkLK84a1GMMdVvDO592MnEB5I+E9V/diFioJ6SWHBVQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772731728; bh=hpQkfgW/BOteaJCnyaese3D
	BIE6p1mMyBz6ANIdE5UA=; b=0uhZrBBG3I6mTAij6cj4gdGRy38lw+KsA+1LbzTRB1atJlrCQc
	+mIQbLnIrnpAAnpi6/kfa4VEH6mudoif9mAA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 05 Mar 2026 18:28:35 +0100
Subject: [PATCH 3/5] arm64: dts: qcom: Add Redmi 4A
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-riva-common-v1-3-436f1f4b7399@mainlining.org>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
In-Reply-To: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, phone-devel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772731726; l=2653;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=0mcemN83xVHtkBQJrBJzu8J1lZC9SEdGmJouyqgM8Pw=;
 b=tQNP/nf0xiNek8em6AhU37Fw1KV1yVd45q8S0uAqjSbgI3auMDKb5U0MpjWuWYsCpzF+ZTPLw
 hVVvZw0825AB0luVZ3wYpDNJIhIe0x8YtjLsSln/dfeCFOAIkNE8BmJ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Redmi 4A (rolex) is like Redmi 5A with small differences like charging,
fuel gauge, different speaker codec configuration and display.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/Makefile                     |  1 +
 .../boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi     | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts     | 19 +++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6d87be639aac..20e161e843ed 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -82,6 +82,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-rolex.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
index f0a534106e11..50868c679693 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
@@ -104,6 +104,22 @@ edt_ft5306: touchscreen@38 {
 
 		status = "disabled";
 	};
+
+	goodix_gt911: touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&tsp_int_rst_default>;
+		pinctrl-names = "default";
+		AVDD28-supply = <&pm8937_l10>;
+		VDDIO-supply = <&pm8937_l5>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+
+		status = "disabled";
+	};
 };
 
 &pm8937_gpios {
diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts
new file mode 100644
index 000000000000..4cfaa7f6ff81
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Barnabas Czeman
+ */
+
+/dts-v1/;
+
+#include "msm8917-xiaomi-riva-common.dtsi"
+
+/ {
+	model = "Xiaomi Redmi 4A (rolex)";
+	compatible = "xiaomi,rolex", "qcom,msm8917";
+
+	qcom,board-id = <0x1000b 1>, <0x2000b 1>;
+};
+
+&goodix_gt911 {
+	status = "okay";
+};

-- 
2.53.0

