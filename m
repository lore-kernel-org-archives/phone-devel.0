Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B4537A4AB
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 22:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884349; cv=none; b=eJDvnjBRkmkaXOkMcJ8BK0dZKM6WW8iIEotvYTgz/r1wKazgnOXKzs5/PQl52JBYJ36Co167knq36F0zKRm7NVu4KEKggweFr60SNFUgnma/uRrbxzBADZ1iPnS5PYizR2NIEftnHYlRULjEGfvysR2whkWrWpdR+ZLKdkqLGns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884349; c=relaxed/simple;
	bh=J+1g3BFKpGsLeGH9UYvNfZGkIIHnMQDBztHbe/vYHes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNZL4dDSxxC578qFwuavNJxV8VWHvmHzoVpA+4LsWWKXgSHAIw1qSTDRJ/vFyjlfFOj5Z9TCC4ssHA4ypwfkVPTf3t/7PLr1jQv78ZRp/iPrcwuFsChNVczYOcO9WHOpdukDtjwAk2i0MfUoE2mr4MbPOtnfTvD9d6G/PNlCqIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Es4KXQM7; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Es4KXQM7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1771884345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PWGj0PuEmaHxhlgWD4cc6InO9oM8rB7Fxw08u8rCwZw=;
	b=Es4KXQM7Nf+JQFxE5NW63WUEhXrXkm9t6ef5UY6tQrprP+IBQzx3vzuFYzB63R6u1Xzyx/
	ealhNFtSKeJKhWMCd8fikJ2lDVj+J1VN9r+j6K572JViwV4bFsoVwNtscB4Hqo1Nz7b7jF
	PqlYPuVpKzuigbILx0nODdcvb51zVchLKosVewPIB6ZEsmU/TNaQN31Gh5SHZmFTUPU3b/
	zo3phqbq32LHQvVc+kj0xOjI2yX0iGeYddFz9GgVWQshTPjsbgjU0ibLroIGp4ie4wj+sU
	myzatLmiByPwTDWhmSSKTwq7coU9IJVSqhsb096jd93utHpVaXcG/3701EoCjA==
From: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Max McNamee <maxmcnamee@proton.me>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	~postmarketos/upstreaming@lists.sr.ht,
	Raymond Hackley <raymondhackley@protonmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: msm8916-samsung-coreprimeltevzw: add device tree
Date: Mon, 23 Feb 2026 22:05:14 +0000
Message-ID: <20260223220514.2556033-4-wonderfulshrinemaidenofparadise@postmarketos.org>
In-Reply-To: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
References: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Max McNamee <maxmcnamee@proton.me>

Samsung Galaxy Core Prime Verizon Wireless is a phone based on MSM8916.
They are similar to the other Samsung devices based on MSM8916 with only a
few minor differences.

The device trees contain initial support with:
 - GPIO keys
 - Regulator haptic
 - SDHCI (internal and external storage)
 - USB Device Mode
 - UART (on USB connector via the SM5502 MUIC)
 - WCNSS (WiFi/BT)
 - Regulators
 - QDSP6 audio
 - Speaker/earpiece/headphones/microphones via digital/analog codec in
   MSM8916/PM8916
 - WWAN Internet via BAM-DMUX
 - PMIC and charger
 - Touchscreen

There are different variants of Core Prime, with some differences in
NFC and MUIC.

The common parts are shared in
msm8916-samsung-fortuna-common.dtsi and msm8916-samsung-rossa-common.dtsi
to reduce duplication.

Signed-off-by: Max McNamee <maxmcnamee@proton.me>
[Raymond: Refactor touchscreen and MUIC. Add commit messages.]
Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../qcom/msm8916-samsung-coreprimeltevzw.dts  | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-coreprimeltevzw.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..6cbe919c978a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -61,6 +61,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-motorola-surnia.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-coreprimeltevzw.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-e5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-e7.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-gprimeltecan.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-coreprimeltevzw.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-coreprimeltevzw.dts
new file mode 100644
index 000000000000..40415b5635ef
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-coreprimeltevzw.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-samsung-rossa-common.dtsi"
+
+/ {
+	model = "Samsung Galaxy Core Prime LTE Verizon Wireless";
+	compatible = "samsung,coreprimeltevzw", "qcom,msm8916";
+	chassis-type = "handset";
+};
+
+&battery {
+	charge-term-current-microamp = <150000>;
+	constant-charge-current-max-microamp = <700000>;
+	constant-charge-voltage-max-microvolt = <4400000>;
+};
+
+&charger {
+	richtek,usb-connector = <&usb_con_sm5502>;
+	status = "okay";
+};
+
+&mpss_mem {
+	/* Firmware for coreprimeltevzw needs more space */
+	reg = <0x0 0x86800000 0x0 0x5400000>;
+};
+
+&muic_sm5502 {
+	status = "okay";
+};
+
+&s3fwrn5_nfc {
+	status = "disabled";
+};
+
+&usb {
+	extcon = <&muic_sm5502>, <&muic_sm5502>;
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&muic_sm5502>;
+};
-- 
2.47.3

