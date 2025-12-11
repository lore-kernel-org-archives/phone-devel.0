Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538332DF148
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 03:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765422332; cv=none; b=GT0d9zyDuCoQDJ94S4enHJTw5DAXq+sLoeQwH1sjJXwJtYBSi3a1h1KIG8zzIpGKIDDqTopJbUhS0P681FgU2ZvMZTDfZ8gfLOtr1S2gu8YnTylJkUKqc5tsATck5VdsG2Ig5E6R3jEvvsK5wy+NPB6ttackU+oli2HEUI49Yag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765422332; c=relaxed/simple;
	bh=mdANDSNEIC5lQ5TbLF7yScpuPNZGHRntBOP09/3K8o8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sv8Zrkc47kSrRNyhxPJ+OjiUErL4B5tw6FiQbzs/iaJC0Laql9P91snk0zjGRgG4ozBU80sib+Qpzov4Yl2nH6n9SXT2spGbVYtdkTlRQnQ1x4F1GpNMo9RJy1NfhMX3dSaAxhZ7EoN5udqs2/5ii+32uTy7xV/8Yigs256s43k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhMBR6AK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4cWkn8d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhMBR6AK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4cWkn8d"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP9mY3544478
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 03:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYw13NnSZLE34uLdTeOQFixQV7gZOlj3zbCPmVoleoE=; b=QhMBR6AKx0IgdgzR
	Coa8P68tPE+TJ4mTFiMCyNcCf4n7uxt5hToDe7kti/wfMk1soE4GEszq7KWxDPpw
	HZDVwjb06Kz6nyADIzifg4JSnE61yuVatGnFc2vSa1oO+U/Uc9Z32ZJRbNh36wk9
	6sHp88tnFXj6LFY6UaUf0Tuzn9Y37PKuRyXon+bw+vad12DCSG+znGrTSjRhp5UX
	yld8HEy9U6z8v1rJ/X6bkX9pqI3oAYdhtemF9TWPwdUETdAUKEfKek6NTznUnl6g
	8Bo0CZb2m9PLgJ/XCUBBVO067OmoN7ahuqG2rDiaAkLRigzseG77qWzq8YqWlOeR
	Jk0/aw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp3x9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 03:05:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62da7602a0so536712a12.2
        for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 19:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765422326; x=1766027126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYw13NnSZLE34uLdTeOQFixQV7gZOlj3zbCPmVoleoE=;
        b=R4cWkn8dH9efMCvzqVXRnCiNQf59cyijP2drLUMABHS2/eGm6eqSAIyNXtv8QXB9D1
         lIoBQ6WL6n5/hqe2nH4f1puAvJHaEhAZUOFSS1TU8WquzNiT/bIncpG0aUCbAREGYcJN
         6NlHLgAsBu0f9rAtPZDhLV1mqaJ8hS/7GrqWYu6YBl4FsRphb30250k+OWQZ5aQyFb+R
         Zp9z8BqoqnVh3UI2y/rj7vyUIVSLXwt4pxdiRK3mBoS5Y1ewij/Ne6dNyPpyn8uIzfv3
         6CHBflvjdAi0Varnn9QZUtILDvxJ52j6tO11BNCw5o/qJPYAQhMlgJ85xcDkCIRJmHSN
         oG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765422326; x=1766027126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UYw13NnSZLE34uLdTeOQFixQV7gZOlj3zbCPmVoleoE=;
        b=Xp7YdX3/jVimeNeBCouXH3DWhEbz0kD6y7ZGv2gl3cA3divrB/IA1yyfeM9cDRez4g
         K4haBsESHarRgkAPOiJCRT8tMm3lb4pJU0zYYDmqZrEb4whQp+oeZEd8exHbM8gn30Cr
         N/o+6gwNEUehqr8cWyX6e/1mLTkJSJ/7tPX9K0Ly15NUFGZKoKfaUq+YdH+sFjRNdcfw
         xGs6FeDmh48B9Y8Y4BvRS8UUevA1fi+FAL3Ymd1Zv7BzLyJNhdemBMtQG9UxS1vwuoeG
         Gp2VGiJCueJZfHIAWJooLM5jW8b9ucyrZXlufr6ggpxs7ZKs6zgglw1InOyjexOEEaOD
         yd6g==
X-Forwarded-Encrypted: i=1; AJvYcCV2DGCBztP1VbCETgTKXsdbP+ZB40tTSpHY3sozElFWHNTaRxOob0L4TTT4mPWEsK7uF6jewvdQVavW9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLct0ulf/81l5WnNtXIXxTnO9v145ewMyEYpdmrnEVcKOm3kgE
	pb+6fjNNJagDVundSTEb/Ftxt94mZk0KCIiQrEFKRqPEjloKiG+ji8/kTQcaKmR9Qy4xjAtzXYY
	9Z0XdS7DTR2KhKoubk18ByxNMo1X1Qr7TQQ3ClSD1PubQFe9VBh4IMspiA9BzbaqwpF52YEtrpw
	==
X-Gm-Gg: AY/fxX7KMxdHqDe3N3rmCIC1hgy6pj7zb0PhKHKk9/u5hWmfbTU6M/2ODgdvPw2q71V
	fiN+FyYD6S/baq2oQpZRlQhfatq+fRyqqr0Mjyf0kSr1jYNPfQp/qgV1t16qYeFwHv/tx+gyB7z
	sLYh+5Ry0GMRDY48mtSOQuTGy9jJJpGv1am3K+lIwtcTgaXTK6GlVVbodky2/22adk7VWVqdZhq
	TwFz0caackGWoyVMLuWMN5qmyx0x5AgaMqViaMimj/yyVMZJM6B9mWbM+aNauGTm6vs0vo7J37n
	qbiQLR6bOZC5dSgc7H9DRh3cAOPl45SqAQOx/Q8i//DIRSwqOjK2oKmG/c9nIpRDajckq2BoXmi
	94OIeu/T0pQXRf6yaLVqgP4awsEKmoCx2p1XVKGndXakv023VVta3mwW5CFZ6
X-Received: by 2002:a05:7022:239a:b0:11b:803c:2cf5 with SMTP id a92af1059eb24-11f296b3f25mr4014191c88.33.1765422326124;
        Wed, 10 Dec 2025 19:05:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqTax8K2iG90nw+jw79ZPQAhA5+eX739G8OYgF33QbZdqOiRKqC88Fg2ejHSSkuf7wj1munA==
X-Received: by 2002:a05:7022:239a:b0:11b:803c:2cf5 with SMTP id a92af1059eb24-11f296b3f25mr4014152c88.33.1765422325401;
        Wed, 10 Dec 2025 19:05:25 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm3935642c88.12.2025.12.10.19.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 19:05:24 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 19:05:06 -0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: kaanapali: Add base QRD board
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-knp-dts-v3-5-8dcd52f055c2@oss.qualcomm.com>
References: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
In-Reply-To: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765422317; l=23008;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=mdANDSNEIC5lQ5TbLF7yScpuPNZGHRntBOP09/3K8o8=;
 b=2imuIFrUV5opryIENLbaz/G6VDIJ9kC/KIdTOKX8ki7ns25otQ/RzxuQExTU8qxR/RPEPYudB
 01Mq9c2ydkLBJPV2Jf+4B13/rLUfboUEfftNkDt73c8sM+NUY4qw7M9
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAxNyBTYWx0ZWRfX/0UCK7u0IN+k
 lBYrCo8wSlROmvp7CGKPL9VTcsksLiRahzYJykz+quo9RgnaN2gMtZ3UCs5PPmChvMILPqet3D0
 BrzM7BuqX4u0YywajheYhaD+4svEtaNqr3Fe6if0noQlXQMvCyjeD3yKcB8L7s5zyejE/JLB8PC
 fa1I2vJsOiuFfjCEUjvtSHfPM3vK8e1BV9UikTU9WfCWrUhVAU3BBmGjmowSVAnID/gztR6hG0o
 sgezL4OTJ/1j09YdvECTapvEwifTwfD+yoznOrlYVBtIV3vfdYHhVu5hFMZ4czytp496zh4ZcIh
 fbHtHSL0joPsTSTkwFOQtrMq7Ig0HNeNnS3fgUIxwFhP8TdN2H5R5FIPA/gdNEUqdbN/cx9F7cV
 z2/0Osy4AOp4CjAxT907UPzmFW/wtw==
X-Proofpoint-ORIG-GUID: uHqkEbiNLdP0HMvzxXUM6qHh6mkkZjNZ
X-Proofpoint-GUID: uHqkEbiNLdP0HMvzxXUM6qHh6mkkZjNZ
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=693a34f8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HxS99sl-kXwyYRSu5lYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110017

Add initial support for Qualcomm Kaanapali QRD board which enables
SD Card, UFS and booting to shell with UART console.

Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
(added ufs) and Manish Pandey (added SD Card).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |   1 +
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 712 +++++++++++++++++++++++++++++
 2 files changed, 713 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ac6c0178aae4..699d61d30280 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
new file mode 100644
index 000000000000..66b423a497b3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -0,0 +1,712 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "kaanapali.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kaanapali QRD";
+	compatible = "qcom,kaanapali-qrd", "qcom,kaanapali";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmh0101-rpmh-regulators";
+		qcom,pmic-id = "B_E0";
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <4000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <3552000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3048000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4b_1p8: ldo4 {
+			regulator-name = "vreg_l4b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l5b_3p1: ldo5 {
+			regulator-name = "vreg_l5b_3p1";
+			regulator-min-microvolt = <3100000>;
+			regulator-max-microvolt = <3148000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l7b_1p8: ldo7 {
+			regulator-name = "vreg_l7b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l8b_1p8: ldo8 {
+			regulator-name = "vreg_l8b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l9b_2p9: ldo9 {
+			regulator-name = "vreg_l9b_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l11b_1p0: ldo11 {
+			regulator-name = "vreg_l11b_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1292000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l12b_1p8: ldo12 {
+			regulator-name = "vreg_l12b_1p8";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l14b_3p2: ldo14 {
+			regulator-name = "vreg_l14b_3p2";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_1p2: ldo18 {
+			regulator-name = "vreg_l18b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "D_E0";
+
+		vreg_s10d_1p0: smps10 {
+			regulator-name = "vreg_s10d_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1d_1p2: ldo1 {
+			regulator-name = "vreg_l1d_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2d_0p9: ldo2 {
+			regulator-name = "vreg_l2d_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3d_0p8: ldo3 {
+			regulator-name = "vreg_l3d_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4d_1p2: ldo4 {
+			regulator-name = "vreg_l4d_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_s6f_0p5: smps6 {
+			regulator-name = "vreg_s6f_0p5";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7f_1p2: smps7 {
+			regulator-name = "vreg_s7f_1p2";
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1372000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8f_1p8: smps8 {
+			regulator-name = "vreg_s8f_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_1p2: ldo1 {
+			regulator-name = "vreg_l1f_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2f_1p2: ldo2 {
+			regulator-name = "vreg_l2f_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3f_0p8: ldo3 {
+			regulator-name = "vreg_l3f_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4f_0p8: ldo4 {
+			regulator-name = "vreg_l4f_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "G_E0";
+
+		vreg_s7g_0p9: smps7 {
+			regulator-name = "vreg_s7g_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9g_1p0: smps9 {
+			regulator-name = "vreg_s9g_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1g_1p2: ldo1 {
+			regulator-name = "vreg_l1g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2g_1p8: ldo2 {
+			regulator-name = "vreg_l2g_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3g_1p2: ldo3 {
+			regulator-name = "vreg_l3g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4g_0p9: ldo4 {
+			regulator-name = "vreg_l4g_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "I_E0";
+
+		vreg_s7i_0p9: smps7 {
+			regulator-name = "vreg_s7i_0p9";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <972000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_1p2: ldo2 {
+			regulator-name = "vreg_l2i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3i_0p8: ldo3 {
+			regulator-name = "vreg_l3i_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pmh0104-rpmh-regulators";
+		qcom,pmic-id = "J_E1";
+
+		vreg_s1j_0p8: smps1 {
+			regulator-name = "vreg_s1j_0p8";
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2j_0p8: smps2 {
+			regulator-name = "vreg_s2j_0p8";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3j_1p2: smps3 {
+			regulator-name = "vreg_s3j_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4j_0p7: smps4 {
+			regulator-name = "vreg_s4j_0p7";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-6 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+		qcom,pmic-id = "K_E1";
+
+		vreg_l1k_0p8: ldo1 {
+			regulator-name = "vreg_l1k_0p8";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k_0p7: ldo2 {
+			regulator-name = "vreg_l2k_0p7";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k_1p2: ldo3 {
+			regulator-name = "vreg_l3k_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k_1p0: ldo4 {
+			regulator-name = "vreg_l4k_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k_0p7: ldo5 {
+			regulator-name = "vreg_l5k_0p7";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k_1p7: ldo6 {
+			regulator-name = "vreg_l6k_1p7";
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k_0p7: ldo7 {
+			regulator-name = "vreg_l7k_0p7";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <848000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-7 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "M_E1";
+
+		vreg_l1m_1p0: ldo1 {
+			regulator-name = "vreg_l1m_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p0: ldo2 {
+			regulator-name = "vreg_l2m_1p0";
+			regulator-min-microvolt = <1096000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_2p8: ldo3 {
+			regulator-name = "vreg_l3m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_2p2: ldo4 {
+			regulator-name = "vreg_l4m_2p2";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6m_2p8: ldo6 {
+			regulator-name = "vreg_l6m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "N_E1";
+
+		vreg_l1n_1p1: ldo1 {
+			regulator-name = "vreg_l1n_1p1";
+			regulator-min-microvolt = <1096000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2n_1p2: ldo2 {
+			regulator-name = "vreg_l2n_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3n_1p8: ldo3 {
+			regulator-name = "vreg_l3n_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4n_1p8: ldo4 {
+			regulator-name = "vreg_l4n_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5n_2p8: ldo5 {
+			regulator-name = "vreg_l5n_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6n_2p8: ldo6 {
+			regulator-name = "vreg_l6n_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7n_3p3: ldo7 {
+			regulator-name = "vreg_l7n_3p3";
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>;
+	pinctrl-1 = <&sdc2_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <36 4>, /* NFC eSE SPI */
+			       <74 1>, /* eSE */
+			       <119 2>, /* SoCCP */
+			       <144 4>; /* CXM UART */
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 217 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1200000>;
+	vccq-supply = <&vreg_l4d_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4g_0p9>;
+	vdda-pll-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};

-- 
2.25.1

