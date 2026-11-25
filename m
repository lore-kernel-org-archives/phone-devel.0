Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612120;
	b=sxRLCFXWEMFuo2Ax/+esEPF8ZWv2qSorZntptdSpr4pQRyVgLfL+hiq7yq2M7LI+tJmE
	 khmSTN7sn+PaApDcOuiEOg+8YGhkr1BprsJmfSToyMSXc1pjoUAkOdl5IulPOx/8zRm9Q
	 rHCVuqGbeZDs9jshxH6EX5q86Tn1OoGr18DCpUuJlLQtsq5tqq5sLDz/uh2ZPldXVjwHf
	 s0fsBVbaHk8ZeZjLZhxx3gUFtBmc84HWod917CBv5iCR3qpIOKpd7cnLECAWJCfDvXX0G
	 htNVJq2l4rI8sKbbG66Y4vj7OR5hEcr/HgRj21iu7pdUc9ThpjFsM0386DhUO5WED8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612120;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bC6BOA8lkj4euco4/6Bslnj1/a+liwPShT0rQp2o0u0=;
	b=hYgttz//9eAWdCqjIG7GfsqKyZk4jAo+8WhOWwgRBAg3iWi+Eex4ttWVU93WBTdtiNeq
	 lRJHxoQhCcOO3yp8BNM/DR3ujUqWwjm3coe4XcEJhCgc7cdTzJEGCbXCHXqa2aUZxgTtr
	 v8SvpywVkiUyJnXbJaEWwp+AjFst+rQksocRCtK2rnvuP86xVuzaM+2g+qb87rbrm0P9u
	 S0bQMYKIWMgPEJ9qsEusM9QqBSsA1UVPwmXH5K1bS7IC+44UpNKekw/UCZlWHHbZxQHVp
	 bwcWOWZzcOf8S/lmRLYxd4dxtId7Dt+tdxNZR0aVQqKjd87aNepUHBco7N+UNZbbctg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6OYEWOF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C49606A32C;
	Wed, 25 Nov 2026 13:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6OYEWOF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795612120;
	b=G4euRiEazQJqfCqNyUcxnd01IXO/tpwydroPDcplpVeyMdmnaqGd6vZ9LcUdcFiIPYwJ
	 zMN00y+rx9qSN3JAmEdWPIikfcsK8AO611mtSl0mZjfJRR2EBQYl54ERNIc+OUmien/uP
	 F6T8VRvvtDalPHU63rK/vRxiWpjilhjfDYlVbgGCxpPaszLFth6LCnmlpMG9E67g8+1aL
	 oAepR56OkLzf8p/4daopTnibhnqBuvTSfh9Lzou+Y/P5glcH9sJPmb8ct/9qC6PePItgk
	 boSSMYuXHX9Dojy7dcLpn63QwhbT+AcwV4lsnohAWR0VZ9quM63vJHuqBBf/DIjX3/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795612120;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bC6BOA8lkj4euco4/6Bslnj1/a+liwPShT0rQp2o0u0=;
	b=NxMMRlewSIzdqFn78OXIk3ZukxabJSqJmLgYkNg86BgK350pXxMYJrm+6dE6IG8HAqeU
	 s61WvOBuWZQyzVXsqMIcFPtfnumdazuxYe2ZIFRAR3BJt6FZm7jubazLrmHy2KTgLUSAA
	 /uk3LjnHRKRUyKJkU7AVtvG1IzhKCy8INC9luich0JqlRja3GABiHIe17W958VLhAH71d
	 j7KNgy4D+9kMkXxWbrPkn2m8A951M8w2caLLa4R2oXfKMPKe9T++PvsB1mJxpF+uYHo3h
	 yt8y9/khoRXS2b+zaxRJ0UrYnfxEOap+LACyxb8D27h6oBmcdyrrwzv3JFasknz1Q4Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51F6C1F000E6;
	Wed, 25 Nov 2026 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612120;
	bh=bC6BOA8lkj4euco4/6Bslnj1/a+liwPShT0rQp2o0u0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=I6OYEWOFxYvjfUY0UL5lTLq9+2Y16VdmRXx/HIcXeR7KyWvhyNY4ObG9u3o1sKYX0
	 xhbsDDv4zT3djYCftuyLn8oam9pIevC5JY1j/uLdH4YJfQe1gjR+R0qnK/QWA2lO24
	 Tyu6IihDjdne6ouhZajVjdwWNOqPzfpdvXSAj4IBLm3J35TeNWyk6y8g+HwsVBg9p+
	 EoYPJegrJhAcTM3GX7pd54BEaQHY5/wjN22p6RvKoi0H1UnvidyhLy/DjbQQXayn3k
	 GTKPUh8udWFwBP7fFAPIi6gewB3KUrpBukuNVLYkJSop8VgUesj71H+ubIT0ob2M2P
	 ACCK7mbLwJXyQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 742204CEDD;
	Wed, 25 Nov 2026 13:08:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 25 Nov 2026 14:08:16 +0100
Subject: [PATCH v3 5/5] arm64: dts: qcom: sdm845-google: drop panel
 regulator-always-on
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-fix-blueline-panel-v3-5-914b4a30b73e@ixit.cz>
References: <20261125-fix-blueline-panel-v3-0-914b4a30b73e@ixit.cz>
In-Reply-To: <20261125-fix-blueline-panel-v3-0-914b4a30b73e@ixit.cz>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3724; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=7MbJWcOA7VgDjyx+wISNbX3wFon6Upjhtfj1PpZjQxE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrBt3BP5Lf1wO+j5Mx/5MSPqPEcwqPoMlGv/Zcc
 PrK11+eEfiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawbdwQAKCRBgAj/E00kg
 clXoD/41wH4jQ2DlT9BhUtMArglYyo7sqm5aOY7yyZ5mM5eH9losiXE56sS8ihyEO/UZAN5vyDQ
 QDPdpORQ5pxnA2Mmc1pxQYCl0TeEbjsxXji3wZ0CItqXEk/wettggKnb5hlaBU1z6EiGdp2f7De
 Mx1IbciyUHEgSW9yzzuv94ZzWIkAVaKEi8gUiMSJBatJn7WFrpQrxD7aEGm2KV5vlsWKB7SqSJW
 WtS4okXZrAbEGQGFRH+hFgddp0eHGZX3WAEyBgR0NaPt0sUoFMW2QmovUFAeEScVCy+puZdKwe3
 GLE9pPCZyPRWgEdk2bl1XaxnnZJ+wa/Z724pbryOPx/XGP2Cld7DAgiQaTNYxTvK5Q0puBUoaFx
 eWFbqdupYvQ9r5fBAt6tFu+0LbK8To9ylptdOYwzFmLIFBfH/saQDQARRgI2gznL3xATV1UDMrA
 AJECdsfywp8KZqvE189QTe0NBFsktAw71L0A2LmT9dX699c0isV8Ks52dU6+xiIpECizTFSNkUI
 00CT5xZYa5XTm+WDFmyDHZWqEsV5erwrwWzHdrPAVkBvdC968m108HfBR0uJhLewZr0V5fW0x1T
 b8SspazuuKf3Ee33ppR0y8O2/uONXGz/KohqS0E8O833dylOAUCa8kRBRT5hd5w8EVAWcVwaZbv
 O8PzMa64wMKLTqA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Drop the regulator-always-on workaround from vreg_l14a_1p8 (vddi) and
vreg_l28a_3p0 (vpnl/vci) now that the LG SW43408 panel driver keeps vpnl
paired with vddi, allowing both rails to power down on Pixel 3 when
neither the panel nor the touchscreen requires vddi.

Define the supplies on Pixel 3 XL's framebuffer0 node so simpledrm keeps
the panel powered once regulator late cleanup runs, while intentionally
leaving them off Pixel 3's framebuffer0 node so simpledrm handover does
not drop vpnl independently of vddi.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts   |  2 ++
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi    | 10 ----------
 arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts |  3 +++
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
index a000c75494f1c..f916f4dbb89c5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
@@ -14,16 +14,18 @@ &battery {
 	voltage-min-design-microvolt = <3600000>;
 	voltage-max-design-microvolt = <4400000>;
 };
 
 &framebuffer0 {
 	width = <1080>;
 	height = <2160>;
 	stride = <(1080 * 4)>;
+
+	/* intentionally no supplies here, see the LG SW43408 driver */
 };
 
 &i2c2 {
 	clock-frequency = <1000000>;
 
 	status = "okay";
 
 	/* ST,FTS @ 49 */
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 3c9656b88b696..c025b2df4ea25 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -246,21 +246,16 @@ vreg_l13a_2p95: ldo13 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l14a_1p8: ldo14 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-boot-on;
-			/*
-			 * We can't properly bring the panel back if it gets turned off
-			 * so keep it's regulators always on for now.
-			 */
-			regulator-always-on;
 		};
 
 		vreg_l17a_1p3: ldo17 {
 			regulator-min-microvolt = <1304000>;
 			regulator-max-microvolt = <1304000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -308,21 +303,16 @@ vreg_l26a_1p2: ldo26 {
 			regulator-boot-on;
 		};
 
 		vreg_l28a_3p0: ldo28 {
 			regulator-min-microvolt = <2856000>;
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
 			regulator-boot-on;
-			/*
-			 * We can't properly bring the panel back if it gets turned off
-			 * so keep it's regulators always on for now.
-			 */
-			regulator-always-on;
 		};
 	};
 
 	regulators-1 {
 		compatible = "qcom,pmi8998-rpmh-regulators";
 		qcom,pmic-id = "b";
 
 		vdd-bob-supply = <&vph_pwr>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
index 2a81ca1d00b1b..7591c6ebb1cb9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
@@ -19,16 +19,19 @@ &dispcc {
 	/* Disable for now so simple-framebuffer continues working */
 	status = "disabled";
 };
 
 &framebuffer0 {
 	width = <1440>;
 	height = <2960>;
 	stride = <(1440 * 4)>;
+
+	vddi-supply = <&vreg_l14a_1p8>;
+	vci-supply = <&vreg_l28a_3p0>;
 };
 
 &mdss {
 	/* Disable for now so simple-framebuffer continues working */
 	status = "disabled";
 };
 
 &wifi {

-- 
2.55.0


